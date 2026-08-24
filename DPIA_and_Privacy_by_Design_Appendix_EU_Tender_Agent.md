# DPIA and Privacy-by-Design Appendix

**System:** EU Tender Autonomous Agent  
**Client:** i@work UG  
**Status:** Proportionate outline and control-gap assessment  

## 1. DPIA outline

### 1.1 Description of processing

The system acquires EU tender and supporting information from official portals and research sources. n8n orchestrates validation, branching, retries and publication. FastAPI and the external agent boundary manage ReAct tool calls, LangGraph state and Pinecone retrieval. LLM services analyse tender material and generate structured scores and reports. A human approves the final company-level bid or no-bid decision. Outputs may be stored in Notion, Slack, Google Drive and PDF files.

### 1.2 Necessity and proportionality

| Question | Assessment |
|---|---|
| Is personal data required? | Limited professional identifiers may be necessary to interpret a tender or contact the contracting authority. Most scoring can use organisation-level data. |
| Can less data be used? | Yes. Contact fields, signatures, CV details and unrelated free text can be removed before model and vector processing. |
| Is the purpose specific? | Yes for tender acquisition, assessment and report delivery. General model training is a different purpose and is not approved. |
| Is retention limited? | Proposed periods exist, but automated enforcement is not evidenced and must be implemented. |
| Is human review effective? | The architecture identifies a human at the helm, but production evidence should show the reviewer can inspect sources and override the recommendation. |

### 1.3 Principal risks

| Risk | Likelihood before controls | Impact | Proposed mitigation |
|---|---:|---:|---|
| Unnecessary contact or CV information is sent to an LLM | Medium | Medium | Schema allowlist, redaction, prompt filter and no-training configuration |
| Personal data is embedded and cannot be found or deleted | Medium | High | Record-level provenance, subject-to-vector mapping, namespace deletion test and re-indexing procedure |
| Inaccurate public information affects a report | Medium | Medium | Authoritative sources, timestamps, confidence labels, correction workflow and human review |
| Report is shared with an unintended Slack, Notion or Drive recipient | Medium | High | Verified recipient IDs, least privilege, publication receipts and a joined completion gate |
| Non-EEA vendor or subprocessor access lacks a valid mechanism | Medium | High | DPF verification or SCCs, transfer assessment, regional controls and periodic vendor review |
| Logs expose prompts, credentials or personal data | Medium | High | Structured logging, secret filtering, short retention, access controls and incident alerting |
| Special-category information appears incidentally | Low to medium | High | Detection, quarantine, exclusion from prompts and documented escalation |

### 1.4 Measures and residual risk

The processing can be proportionate if the privacy gate, source provenance, linked deletion, short logging retention, vendor assessments, access controls and human approval are implemented. Residual risk remains medium because information can be copied across external services and because complete removal from model or backup infrastructure may not always be immediately verifiable. The controller should not launch person-level ranking or model-training reuse without a new assessment.

## 2. Proposed DPA clause

### Subprocessor, location and model-use change clause

> The Processor shall not use Client Personal Data, prompts, retrieved passages, embeddings or outputs to train, fine-tune, evaluate or improve any general or shared model except on the Controller's prior documented instruction. The Processor shall give at least 30 days' written notice before appointing or replacing a subprocessor, enabling access from a new third country, or materially changing retention or model-use terms. The notice shall identify the subprocessor, processing purpose, location, transfer mechanism and deletion period. The Controller may reasonably object on documented data-protection grounds. On termination or instruction, the Processor shall delete or return the data, including retrievable vector representations and replicas, and provide confirmation, subject only to documented legal retention duties.

This clause addresses the highest practical risk: a vendor changing its data-use, location or subprocessor arrangement after the initial assessment.

## 3. UK GDPR variation

If i@work also serves data subjects in the United Kingdom, the recommendation remains **go with conditions**, but the transfer and governance map must add UK requirements. UK GDPR and the Data Protection Act 2018 apply to relevant UK personal data. A UK representative may be required where the organisation is outside the UK and Article 27 conditions are met. Transfers from the UK require UK adequacy regulations, the International Data Transfer Agreement, or the UK Addendum to the EU SCCs as appropriate. EU and UK rights workflows can share operational tooling, but notices, supervisory contacts, transfer documents and regulatory monitoring must identify both regimes. The EU and UK data flows should be separately recorded rather than treating an EU mechanism as automatically sufficient for the UK.

## 4. Privacy-by-design checklist

Statuses describe the evidence currently available for the project, not assumptions about production configuration.

| Control | Status | Assessment and required evidence |
|---|---|---|
| Data minimisation | **Partial** | Structured tender fields are used, but a tested personal-data filter before every LLM and vector call is not evidenced |
| Purpose binding | **Unknown** | Operational assessment is defined, but technical prevention of vendor training or unrelated reuse requires contract and configuration evidence |
| Access controls | **Unknown** | Credentials and workspaces exist, but role matrix, least-privilege review and access-test evidence are not supplied |
| Retention enforcement | **Fail / not evidenced** | No demonstrated automated deletion policy covers prompts, logs, vectors, reports and publication copies |
| Subject-rights workflow | **Fail / not evidenced** | No tested process shows that a person can be located, corrected, restricted or erased across every store within the applicable deadline |
| Incident response | **Unknown** | Workflow errors and alerts exist, but a documented GDPR breach-assessment and 72-hour notification procedure is not evidenced |
| Transfer governance | **Unknown** | Vendors are identifiable, but current DPAs, DPF certifications, SCC modules and transfer assessments are not supplied |
| Human decision authority | **Partial** | The design places a human at the helm, but override, source-inspection and decision-record evidence should be retained |
| Publication recipient validation | **Partial / gap** | Stage 9 publishes to several services; completion must join all branches and verify each intended recipient before certification |
| Source provenance and correction | **Partial** | RAG grounding is described, but record-level provenance and correction propagation should be demonstrated |

## 5. Release conditions

1. No operational personal data is reused for general model improvement.
2. DPAs and transfer mechanisms are approved for all processors.
3. The privacy gate is tested with representative tender and document samples.
4. Linked access, correction and deletion are tested across the full data path.
5. Stage 9 recipient validation and joined completion are demonstrated.
6. The controller signs the DPIA screening and residual-risk acceptance.

## References

See `references/Official_EU_Legal_Sources.md`.

