# Before/After Link Examples

## 1. MII MolGen Canonical URL (Canonical Box)

**Before:**
```html
href='/resolve?&scope=project:MedizininformatikInitiative-ModulOMICS&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test'
```

**After:**
```html
href='https://simplifier.net/resolve?scope=de.medizininformatikinitiative.kerndatensatz.molgen@2026.0.4&canonical=https://www.medizininformatik-initiative.de/fhir/ext/modul-molgen/StructureDefinition/anforderung-genetischer-test&fhirVersion=R4'
```

---

## 2. FHIR R4 Base Profile (Basis Column)

**Before:**
```html
href='/resolve?&scope=project:MedizininformatikInitiative-ModulOMICS&canonical=http://hl7.org/fhir/StructureDefinition/ServiceRequest'
```

**After:**
```html
href='https://hl7.org/fhir/R4/ServiceRequest.html'
```

---

## 3. FHIR R4 Core (filepath pattern)

**Before:**
```html
href="https://simplifier.net/resolve?scope=package:hl7.fhir.r4.core@4.0.1&filepath=package/StructureDefinition-ServiceRequest.json"
```

**After:**
```html
href="https://hl7.org/fhir/R4/ServiceRequest.html"
```

---

## 4. Internal Profile Reference (supportingInfo, derivedFrom)

**Before:**
```html
href="artifacts/fsh-generated/resources/StructureDefinition-mii-pr-molgen-familienanamnese.json"
```

**After:**
```html
href="MIIIGModulMolekulargenetischerBefundbericht-TechnischeImplementierung-Familienanamnese-Familienanamnese---FamilyMemberHistory.html"
```

---

## 5. Clinical Genomics STU3

**Before:**
```html
href="https://simplifier.net/resolve?scope=package:hl7.fhir.uv.genomics-reporting@3.0.0&filepath=package/StructureDefinition-diagnostic-implication.json"
```

**After:**
```html
href="https://hl7.org/fhir/uv/genomics-reporting/STU3/StructureDefinition-diagnostic-implication.html"
```

---

## 6. HL7 Terminology (THO)

**Before:**
```html
href="https://simplifier.net/resolve?scope=package:hl7.terminology.r4@5.0.0&filepath=package/CodeSystem-v2-0203.json"
```

**After:**
```html
href="https://terminology.hl7.org/CodeSystem-v2-0203.html"
```

---

## 7. German Base Profile (de.basisprofil.r4)

**Before:**
```html
href="https://simplifier.net/resolve?scope=package:de.basisprofil.r4@1.5.0&filepath=package/StructureDefinition-identifier-iknr.json"
```

**After:**
```html
href="https://simplifier.net/packages/de.basisprofil.r4/1.5.4/files/package/StructureDefinition-identifier-iknr.json"
```

---

## 8. MII Base ValueSet

**Before:**
```html
href="https://simplifier.net/resolve?scope=package:de.medizininformatikinitiative.kerndatensatz.base@2025.0.0&filepath=package/ValueSet-mii-vs-meta-profile-status.json"
```

**After:**
```html
href="https://simplifier.net/packages/de.medizininformatikinitiative.kerndatensatz.base/2026.0.0/files/package/ValueSet-mii-vs-meta-profile-status.json"
```

---

## Summary Statistics

From the Anforderung-ServiceRequest page:
- **Before:** ~200+ broken resolve links
- **After:** 1 intentional Simplifier resolve link (the canonical)
