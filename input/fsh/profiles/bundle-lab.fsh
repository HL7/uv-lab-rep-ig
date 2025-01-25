//===================================
/// INVARIANTS
//===================================

Invariant: dr-to-comp-link
Description: "If the laboratory report bundle contains a Composition resource, the DiagnosticReport SHALL always refer to the composition"
Expression: "entry.resource.ofType(Composition).exists() implies (entry.resource.ofType(DiagnosticReport).extension('http://hl7.org/fhir/5.0/StructureDefinition/extension-DiagnosticReport.composition').value.resolve() is Composition)"
Severity:    #error

Invariant: dr-comp-enc
Description: "DiagnosticReport and Composition SHALL have the same encounter"
/* Expression: "( (entry:composition.resource.encounter.empty() and entry:diagnosticReport.resource.encounter.empty() ) or entry:composition.resource.encounter = entry:diagnosticReport.resource.encounter )" */
Expression: "( (entry.resource.ofType(Composition).encounter.empty() and entry.resource.ofType(DiagnosticReport).encounter.empty() ) or entry.resource.ofType(Composition).encounter = entry.resource.ofType(DiagnosticReport).encounter )"
Severity:    #error

Invariant: dr-comp-subj
Description: "If the laboratory report bundle contains a Composition resource, DiagnosticReport and Composition SHALL have the same subject"
Expression: "entry.resource.ofType(Composition).exists() implies ( (entry.resource.ofType(Composition).subject.empty() and entry.resource.ofType(DiagnosticReport).subject.empty() ) or entry.resource.ofType(Composition).subject = entry.resource.ofType(DiagnosticReport).subject )"
Severity:    #error


Invariant: dr-comp-type
Description: "If the laboratory report bundle contains a Composition resource, at least one DiagnosticReport.code.coding and Composition.type.coding SHALL be equal"
Expression: "entry.resource.ofType(Composition).exists() implies entry.resource.ofType(Composition).type.coding.intersect(entry.resource.ofType(DiagnosticReport).code.coding).exists()" 
Severity:    #error

Invariant: dr-comp-category
Description: "At least one DiagnosticReport.category.coding and Composition.category.coding SHALL be equal"
Expression: "(entry.resource.ofType(Composition).category.exists() or entry.resource.ofType(DiagnosticReport).category.exists()) implies entry.resource.ofType(Composition).category.coding.intersect(entry.resource.ofType(DiagnosticReport).category.coding).exists()" 
Severity:    #error

Invariant: dr-comp-identifier
Description: "If one or more DiagnosticReport.identifiers are given, at least one of them SHALL be equal to the Composition.identifier"
/* "Composition.identifier SHALL be equal to one of DiagnosticReport.identifier, if at least one exists" */

Expression: "(entry.resource.ofType(Composition).identifier.exists() or entry.resource.ofType(DiagnosticReport).identifier.exists()) implies entry.resource.ofType(Composition).identifier.intersect(entry.resource.ofType(DiagnosticReport).identifier).exists()" 
Severity:    #error

Invariant: one-comp-max
Description: "A laboratory report bundle SHALL include a maximum of only one Composition"
Expression: "entry.resource.ofType(Composition).count() <= 1"
Severity:    #error

Invariant: one-dr
Description: "A laboratory report bundle SHALL include one and only one DiagnosticReport"
Expression: "entry.resource.ofType(DiagnosticReport).count() = 1"
Severity:    #error

//==========================
// PROFILE
//==========================

Profile: BundleLabReportUv
Parent: Bundle
Id: Bundle-uv-lab
Title: "Bundle: Laboratory Report"
Description: "Clinical document used to represent a Laboratory Report for the scope of the HL7 UV Lab Report project."

* insert SetFmmandStatusRule ( 2, trial-use)
* . ^short = "Laboratory Report bundle"
* . ^definition = "Laboratory Report bundle."

* obeys dr-to-comp-link
* obeys one-comp-max
* obeys one-dr
* obeys dr-comp-identifier
* obeys dr-comp-type
* obeys dr-comp-category
* obeys dr-comp-subj
* obeys dr-comp-enc


* identifier ^short = "Business identifier for this Laboratory Report"
* identifier 1..
* type from LabReportBundleTypesVs (required)
* timestamp 1..
* total ..0
* link ..0
* entry 1..
  * link ..0
  * fullUrl 1..1
  * resource 1..
  * search ..0
  * request ..0
  * response ..0
* signature ^short = "Digital Signature of this report"

* entry ^slicing.discriminator[0].type = #type
* entry ^slicing.discriminator[0].path = "resource"
// * entry ^slicing.ordered = true => changed on 2023-07-19  to be checked
* entry ^slicing.ordered = false
* entry ^slicing.rules = #open

* entry contains composition 0..1
* entry[composition] ^short = "Entry in the bundle: Laboratory Report Composition"
* entry[composition].resource only CompositionLabReportUv

* entry contains diagnosticReport 1..1
* entry[diagnosticReport] ^short = "Entry in the bundle: Laboratory Report DiagnosticReport"
* entry[diagnosticReport].resource only DiagnosticReportUvLab

* entry contains patient 0..1
* entry[patient] ^short = "Entry in the bundle: Patient"
* entry[patient].resource only Patient or PatientUvLab or PatientAnimalUvLab

* entry contains observation 0..*
* entry[observation] ^short = "Entry in the bundle:	Laboratory Result Observation"
* entry[observation].resource only ObservationResultsUvLab

* entry contains specimen 0..*
* entry[specimen] ^short = "Entry in the bundle: Laboratory Specimen"
* entry[specimen].resource only SpecimenUvLab

* entry contains serviceRequest 0..*
* entry[serviceRequest] ^short = "Entry in the bundle: 	Laboratory ServiceRequest"	
* entry[serviceRequest].resource only ServiceRequestUvLab

* entry contains organization 0..*
* entry[organization] ^short = "Entry in the bundle: Organization"
* entry[organization].resource only Organization
* entry[organization].resource ^short = "Organization"

* entry contains practitioner 0..*
* entry[practitioner] ^short = "Entry in the bundle: Practitioner"
* entry[practitioner].resource only PractitionerUvLab

* entry contains practitionerRole 0..*
* entry[practitionerRole] ^short = "Entry in the bundle: PractitionerRole"
* entry[practitionerRole].resource only PractitionerRoleUvLab

* entry contains bodyStructure 0..*
* entry[bodyStructure] ^short = "Entry in the bundle: BodyStructure"
* entry[bodyStructure].resource only BodyStructureUvLab

* entry contains encounter 0..*
* entry[encounter] ^short = "Entry in the bundle: Encounter"
* entry[encounter].resource only Encounter

* entry contains location 0..*
* entry[location] ^short = "Entry in the bundle: Location"
* entry[location].resource only Location

* entry contains provenance 0..*
* entry[provenance] ^short = "Entry in the bundle: Provenance"
* entry[provenance].resource only Provenance

* entry contains coverage 0..*
* entry[coverage] ^short = "Entry in the bundle: Coverage"
* entry[coverage].resource only Coverage

* entry contains device 0..*
* entry[device] ^short = "Entry in the bundle: Device"
* entry[device].resource only Device

//* entry contains documentReference 0..*
//* entry[documentReference].resource only DocumentReference

