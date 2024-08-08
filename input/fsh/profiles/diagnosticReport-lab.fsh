//===================================
/// INVARIANTS
//===================================

Invariant: dr-to-comp-link
Description: "The DiagnosticReport included in a laboratory report bundle SHALL always refer to a composition"
Expression: "extension('http://hl7.org/fhir/5.0/StructureDefinition/extension-DiagnosticReport.composition').exists()"
//Expression: "entry.resource.ofType(DiagnosticReport).extension('http://hl7.org/fhir/5.0/StructureDefinition/extension-DiagnosticReport.composition').exists()"
Severity:    #error

//==========================
// PROFILE
//==========================

Profile: DiagnosticReportLabUv
Parent: DiagnosticReport
Id: DiagnosticReport-uv-lab
Title: "DiagnosticReport: Laboratory Report"
Description: "DiagnosticReport used to represent an entry of a Laboratory Report, including its context, for the scope of the HL7 Uv Lab project."


* obeys dr-to-comp-link

* insert SetFmmandStatusRule ( 2, trial-use)
* . ^short = "Laboratory Report DiagnosticReport"
* . ^definition = "Laboratory Report DiagnosticReport"

* extension contains $diagnostic-report-composition-r5 named DiagnosticReportCompositionR5 0..1

* extension[DiagnosticReportCompositionR5]
  * ^short = "Associated Lab Report Composition"
  * ^definition = "This extension implements the R5 composition element. It allow to link this DiagnosticReport with the Composition documenting this Laboratory Report."
  *  valueReference 1..1
  *  valueReference only Reference(CompositionLabReportUv)

/*
content to be referred...
Specimen Collection 1.3.6.1.4.1.19376.1.3.1.2
Specimen Received 1.3.6.1.4.1.19376.1.3.1.3
Specimen Site 1.3.6.1.4.1.19376.1.3.1.8
Notification Organizer
Notifiable Condition
Case Identifier
Outbreak Identifier
Laboratory Isolate Organizer
Laboratory Battery Organizer
Laboratory Observation
Mutimedia Embedded Content
Annotation Comment
*/

* basedOn only Reference ( ServiceRequestLabUv )

* insert ReportStatusRule

* identifier
  * ^comment = "Usually assigned by the Information System of the diagnostic service provider for facilitating the Report search. The order id can be used as one of the Report identifier if only one report is produced for that order."
  
* insert ReportIdentifierRule
* insert ReportCategoryRule 
// add binding
/* * code 1.. 
* code only $CodeableConcept-uv-ips
* code from LabReportTypesVs (preferred) // value set to be revised add alternative value sets
* code ^binding.extension.extension[0].url = "purpose"
* code ^binding.extension.extension[=].valueCode = #candidate
* code ^binding.extension.extension[+].url = "valueSet"
* code ^binding.extension.extension[=].valueCanonical = LabStudyTypesVs
* code ^binding.extension.extension[+].url = "documentation"
* code ^binding.extension.extension[=].valueMarkdown = """Laboratory Specialties."""
* code ^binding.extension.url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* code ^binding.description = "Laboratory Specialties." */

* insert ReportTypeRule ( code )
* insert ReportSubjectRule
* insert ReportEncounterRule
* effective[x] ^short = "Clinically relevant time/time-period for report."
* performer ^short = "Responsible Diagnostic Service." // add reference to the used profiles
  * insert ReportAuthorRule
  /* * obeys labRpt-author */
* resultsInterpreter
  * insert ReportAuthorRule
  /* * obeys labRpt-author */
* specimen only Reference (SpecimenUvLab)
  * ^short = "Specimens this report is based on."
* result only Reference (ObservationResultsLabUv)
  * ^short = "results" 
* imagingStudy 0..0
* presentedForm ^short = "Entire report as issued (pdf recommended)"
