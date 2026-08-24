#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_dir="$(cd "${script_dir}/.." && pwd)"

required_files=(
  "README.md"
  "GDPR_Privacy_Audit_Pack_EU_Tender_Autonomous_Agent_Walid_Barakat.md"
  "Client_Recommendation_Memo_iAtWork_EU_Tender_Agent.md"
  "DPIA_and_Privacy_by_Design_Appendix_EU_Tender_Agent.md"
  "Partner_Peer_Review_Rubric_EU_Tender_Privacy_Audit.md"
  "Submission_Workflow_GitHub_Privacy_Lab.md"
  "references/Official_EU_Legal_Sources.md"
  "scripts/validate_submission.sh"
)

errors=0

for required_file in "${required_files[@]}"; do
  if [[ ! -f "${repo_dir}/${required_file}" ]]; then
    echo "ERROR: missing required file: ${required_file}"
    errors=$((errors + 1))
  fi
done

while IFS= read -r unsafe_file; do
  [[ -z "${unsafe_file}" ]] && continue
  echo "ERROR: prohibited sensitive or unrelated file pattern: ${unsafe_file#${repo_dir}/}"
  errors=$((errors + 1))
done < <(
  find "${repo_dir}" -type f \
    \( -name '.env' -o -name '.env.*' -o -name '*.pem' -o -name '*.key' \
       -o -name '*.p12' -o -name '*.pfx' -o -name '*credential*' \
       -o -name '*secret*' -o -name '*.dump' -o -name '*.sql' \) -print
)

memo_file="${repo_dir}/Client_Recommendation_Memo_iAtWork_EU_Tender_Agent.md"
if [[ -f "${memo_file}" ]]; then
  memo_words="$(
    awk '
      /^\*\*Bottom line:/ {capture=1}
      /^## Sources/ {capture=0}
      capture {print}
    ' "${memo_file}" | wc -w | tr -d ' '
  )"

  if (( memo_words < 300 || memo_words > 400 )); then
    echo "ERROR: client memo contains ${memo_words} words; required range is 300 to 400."
    errors=$((errors + 1))
  else
    echo "OK: client memo word count is ${memo_words}."
  fi
fi

if grep -q 'PENDING PARTNER REVIEW' "${repo_dir}/Partner_Peer_Review_Rubric_EU_Tender_Privacy_Audit.md"; then
  echo "WARNING: partner review is still pending. Complete it before final submission."
fi

if (( errors > 0 )); then
  echo "Validation failed with ${errors} error(s)."
  exit 1
fi

echo "Validation passed. Review the warning, inspect git status, and push only this lab package."

