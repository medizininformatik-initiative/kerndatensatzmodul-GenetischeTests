// ValueSet Family Member SNOMED
ValueSet: MII_VS_MolGen_FamilyMember_SNOMED
Id: mii-vs-molgen-family-member-snomed
Title: "MII VS MolGen Family Member SNOMED"
Description: "The ValueSet contains codes for related family member types from SNOMED CT."
* insert PR_CS_VS_Version
* insert Publisher
* ^status = #active

* include codes from system $SCT where concept descendent-of #125677006