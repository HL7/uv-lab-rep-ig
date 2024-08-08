Profile: SpecimenUvLabObligations
Parent: SpecimenUvLab
Id: Specimen-obl-uv-lab
Title:    "Specimen: Obligations"
Description: "This profile defines obligations for Specimen in FHIR for the purpose of this guide."
* insert SetFmmandStatusRule ( 0, informative)

// TEST OBLIGATIONS  ====>

* subject insert ObligationSet1
* type insert ObligationSet1
* request insert ObligationSet2
* collection insert ObligationSet1
  * bodySite insert ObligationSet1
  * extension[bodySite] insert ObligationSet2
* processing.additive insert ObligationSet2
* container insert ObligationSet1
  * type insert ObligationSet1  

