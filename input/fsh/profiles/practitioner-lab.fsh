
//====== Profiles =====================================

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  PractitionerUvLab
Parent:   http://hl7.org/fhir/uv/ips/StructureDefinition/Practitioner-uv-ips
Id:       Practitioner-uv-lab
Title:    "Practitioner: Laboratory Report"
Description: "This profile defines how to represent Practitioners in FHIR for the purpose of the  HL7 UV Lab project."

* insert SetFmmandStatusRule ( 2, trial-use)
//-------------------------------------------------------------------------------------------

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Profile:  PractitionerRoleUvLab
Parent:   http://hl7.org/fhir/uv/ips/StructureDefinition/PractitionerRole-uv-ips
Id:       PractitionerRole-uv-lab
Title:    "PractitionerRole: Laboratory Report"
Description: "This profile defines how to represent Practitioners (with their roles) in FHIR for the purpose of the  HL7 UV Lab project."

* insert SetFmmandStatusRule ( 2, trial-use)
//-------------------------------------------------------------------------------------------
