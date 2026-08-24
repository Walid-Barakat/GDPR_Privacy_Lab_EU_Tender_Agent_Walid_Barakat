# Client Recommendation Memo

**To:** Management and Technical Lead, i@work UG  
**From:** Walid Barakat  
**Date:** 24 August 2026  
**Subject:** GDPR readiness of the EU Tender Autonomous Agent  

**Bottom line: Go with conditions.** The system may proceed as a human-supervised tender decision-support tool, but production use should not begin until the personal-data flow, vendor contracts and enforceable privacy controls are documented.

The present use case is comparatively contained. The agent evaluates tenders and organisational fit, while a human makes the final bid or no-bid decision. It does not decide an individual's employment, credit, public benefit or access to an essential service. GDPR still applies because tender documents, logs and reports can contain professional contact details, user identifiers, IP addresses, named experts and other information relating to identifiable people. Public availability does not remove that information from GDPR.

Three actions should be completed in sequence. First, approve a complete controller, processor and transfer map. Execute Article 28 DPAs with every relevant hosting, LLM, vector, collaboration and publication provider. For each non-EEA transfer, verify current adequacy coverage or implement the correct Standard Contractual Clauses, a transfer assessment and supplementary safeguards. Second, complete a documented DPIA screening and implement a privacy gate before every LLM, Pinecone and publication call. The gate should remove unnecessary names, email addresses, signatures, CV content, credentials and special-category information. Model training or service improvement using operational prompts must remain disabled until a separate purpose and lawful basis are approved. Third, implement retention and rights handling. Prompts, logs, embeddings, reports and collaboration copies need linked deletion, correction and access procedures, with tested owners and deadlines.

Residual risks remain. External models may retain or reproduce information despite minimisation. Erasure can be difficult once data has reached embeddings, backups and multiple publication channels. Vendor subprocessors, transfer mechanisms and hosting access can change after approval. Public-source data may also be inaccurate or used outside the individual's reasonable expectations. These risks cannot be eliminated completely, but they can be reduced through short retention, source provenance, vendor review, access controls, human validation and periodic reassessment.

The recommended release gate is therefore conditional approval by the controller after the above evidence has been completed and tested.

## Sources

- [GDPR official text](https://eur-lex.europa.eu/eli/reg/2016/679/oj/eng)
- [EDPB DPIA guidance](https://www.edpb.europa.eu/documents/guideline/data-protection-impact-assessments-high-risk-processing_en)
- [EDPB international-transfer guidance](https://www.edpb.europa.eu/sme/be-compliant/international-data-transfers_en)

