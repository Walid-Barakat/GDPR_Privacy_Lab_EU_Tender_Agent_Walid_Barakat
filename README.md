# GDPR Privacy Audit Lab: EU Tender Autonomous Agent

**Author:** Walid Barakat  
**Client scenario:** i@work UG  
**Lab:** Same Product, Privacy Lens  
**Status:** Submission-ready, except for the required human partner review

## Purpose

This repository contains only the materials prepared for the GDPR mini-audit of the EU Tender Autonomous Agent. The system is a nine-stage, human-supervised tool that researches EU energy tenders, assesses business fit and produces an advisory bid or no-bid recommendation.

The audit applies GDPR, the EU AI Act, ePrivacy and the Data Act to the same product previously assessed through the AI Act risk-classification lens.

## File map

| File | Contents |
|---|---|
| `GDPR_Privacy_Audit_Pack_EU_Tender_Autonomous_Agent_Walid_Barakat.pdf` | Complete fact pattern, data map, lawful-basis analysis, rights and risk review, nine-criterion DPIA screening, law stacking and the 300 to 400 word client memo |
| `Client_Recommendation_Memo_iAtWork_EU_Tender_Agent.md` | Standalone copy of the client-facing recommendation memo |
| `DPIA_and_Privacy_by_Design_Appendix_EU_Tender_Agent.md` | Proportionate DPIA outline, proposed vendor DPA clause, UK GDPR variation and privacy-by-design checklist |
| `Partner_Peer_Review_Rubric_EU_Tender_Privacy_Audit.md` | Required partner scoring form and client-response section, intentionally left pending for the actual reviewer |
| `Submission_Workflow_GitHub_Privacy_Lab.md` | Step-by-step validation, Git, GitHub and submission workflow |
| `references/Official_EU_Legal_Sources.md` | Official EU and EDPB legal sources used in the audit |
| `scripts/validate_submission.sh` | Local validation script for required files, prohibited sensitive files and memo word count |

## Bottom-line result

**Go with conditions.** The system supports a business decision about whether i@work should pursue a tender. It does not determine a natural person's legal rights. The main GDPR risks arise from public professional contact data, user and system logs, named experts in documents, cross-border AI and cloud vendors, vector storage and replication into publication channels.

## Evidence boundary

The audit distinguishes between documented project architecture and demonstrated privacy controls. ReAct, LangGraph, Pinecone RAG, n8n orchestration, external APIs and Stage 9 publication are part of the described system. A complete production privacy programme, including executed DPAs, vendor transfer assessments, automated retention, a rights-request workflow and a tested breach procedure, has not been evidenced in the supplied material. These items are therefore recorded as conditions, gaps or unknowns rather than completed controls.

## How to validate

From the repository root:

```bash
bash scripts/validate_submission.sh
```

The script does not replace legal review. It checks submission structure and common hygiene issues.

## Submission note

The lab requires a GitHub repository URL. Complete the genuine partner-review form, commit it, push the final repository and submit the repository URL. Do not replace the human review with generated feedback.

## Core sources

- [General Data Protection Regulation](https://eur-lex.europa.eu/eli/reg/2016/679/oj/eng)
- [EDPB guidance on high-risk processing and DPIAs](https://www.edpb.europa.eu/documents/guideline/data-protection-impact-assessments-high-risk-processing_en)
- [European Commission AI Act overview](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai)
- [ePrivacy Directive](https://eur-lex.europa.eu/eli/dir/2002/58/oj/eng)
- [European Commission Data Act explanation](https://digital-strategy.ec.europa.eu/en/factpages/data-act-explained)

