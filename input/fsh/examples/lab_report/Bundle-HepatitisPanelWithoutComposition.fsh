Instance: BundleHepatitisPanelWithoutComposition
InstanceOf: BundleLabReportUv
Title: "Bundle: Hepatitis Panel without Composition"
Description: "Example of Laboratory Report (Bundle) including a Hepatitis Panel - without Composition resource"
Usage: #example
* identifier.system = "http://example.org"
* identifier.value = "V1CZ454557891308174803488707671420"
* type = #collection
* timestamp = "2022-10-25T14:30:00+01:00"

* entry[diagnosticReport].fullUrl = "urn:uuid:12c2f420-2502-46cc-acd1-877bfb2580e6"
* entry[diagnosticReport].resource = Inline-Diag-Report-hepatitis-panel-without-composition
* entry[patient].fullUrl = "urn:uuid:8472931c-fbd0-437b-9ed1-4f66472c78b5"
* entry[patient].resource = Inline-Patient-hepatitis-panel
* entry[specimen].fullUrl = "urn:uuid:3c9bd730-3ff9-40ee-9da1-4f3d5c526f13"
* entry[specimen].resource = Inline-Specimen-hepatitis-panel
* entry[observation][+].fullUrl = "urn:uuid:2c72163e-b741-44a3-aff7-c52f17f7a1ba"
* entry[observation][=].resource = Inline-Observation-hepatitis-panel
* entry[observation][+].fullUrl = "urn:uuid:104a5829-565b-46a6-85d6-36751ef79a40"
* entry[observation][=].resource = Inline-Observation-hepatitis-1
* entry[observation][+].fullUrl = "urn:uuid:01b8ec35-9b20-45a4-bd41-42eeae2fd521"
* entry[observation][=].resource = Inline-Observation-hepatitis-2
* entry[observation][+].fullUrl = "urn:uuid:096e27da-0768-47e4-b33c-9f1be93e1f88"
* entry[observation][=].resource = Inline-Observation-hepatitis-3
* entry[observation][+].fullUrl = "urn:uuid:861e7b48-5497-410a-bed8-2cde814e09fc"
* entry[observation][=].resource = Inline-Observation-hepatitis-4
* entry[observation][+].fullUrl = "urn:uuid:cc96d499-3e0e-4588-a021-4fe576766112"
* entry[observation][=].resource = Inline-Observation-hepatitis-5
* entry[+].fullUrl = "urn:uuid:608b5309-2609-4d03-b6da-c758bfa1de70"
* entry[=].resource = Inline-Organization-hepatitis-panel

Instance: Inline-Diag-Report-hepatitis-panel-without-composition
InstanceOf: DiagnosticReport-uv-lab
Usage: #inline
* id = "12c2f420-2502-46cc-acd1-877bfb2580e6"
* status = #final
/* * category = $v2-0074#MB "Microbiology" */
* code.coding[+] = $loinc#11502-2 "Laboratory report"
* code.coding[+] = LaboratoryLocalCS#3002989 "Hepatitis Panel, Acute with Reflex to HBsAg Confirmation and Reflex to HCV by Quantitative NAAT"
* code.text = "Acute Hepatitis Panel, reflex to confirmation"
* subject = Reference(urn:uuid:8472931c-fbd0-437b-9ed1-4f66472c78b5)
* effectiveDateTime = "2022-10-25T13:35:00+01:00"
* performer[+].display = "MUDr. Aleš Procházka"
* specimen = Reference(urn:uuid:3c9bd730-3ff9-40ee-9da1-4f3d5c526f13)
* result[+] = Reference(urn:uuid:2c72163e-b741-44a3-aff7-c52f17f7a1ba)
