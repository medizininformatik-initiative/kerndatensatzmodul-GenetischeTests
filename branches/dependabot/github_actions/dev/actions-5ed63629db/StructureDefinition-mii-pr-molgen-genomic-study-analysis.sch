<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile GenomicStudyAnalysis
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Procedure</sch:title>
    <sch:rule context="f:Procedure">
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-genome-build']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-genome-build': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-genomic-source-class']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-genomic-source-class': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-title']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-title': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-metrics']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-metrics': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-regions']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-regions': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-protocol-performed']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/uv/genomics-reporting/StructureDefinition/genomic-study-analysis-protocol-performed': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
