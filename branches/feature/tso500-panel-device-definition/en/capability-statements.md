# Capability Statements - MII IG Kerndatensatz-Modul Molekulargenetischer Befundbericht v2026.0.4

* [**Table of Contents**](toc.md)
* **Capability Statements**

## Capability Statements

### Capability Statements

The CapabilityStatements of the **Molekulargenetischer Befundbericht** module describe the expected server/client capabilities (supported resources and interactions).

To enable decentralized data analysis through the German Health Research Data Portal (Deutsches Forschungsdatenportal für Gesundheit) of the Medical Informatics Initiative, the [capabilities interaction](https://www.hl7.org/fhir/http.html#capabilities) SHALL be supported, so that the FHIR server exposes a CapabilityStatement at `[BASE-URL]/metadata`. That CapabilityStatement SHALL state which profiles — including their version — and which search parameters are supported.

The following lists the content that SHALL be stated in the CapabilityStatement. In addition, conformance to the CapabilityStatement below SHALL be declared in the respective CapabilityStatement instance under [`CapabilityStatement.instantiates`](https://www.hl7.org/fhir/capabilitystatement-definitions.html#CapabilityStatement.instantiates).

Canonical: `https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/CapabilityStatement/metadata`

[mii-cps-molgen-capabilitystatement](CapabilityStatement-mii-cps-molgen-capabilitystatement.md)

