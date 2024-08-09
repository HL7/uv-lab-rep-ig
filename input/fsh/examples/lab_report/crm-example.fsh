Instance: CRMObservtionResult
InstanceOf: ObservationResultsUvLab
Title: "Observation: certified reference material"
Description: "Example of Observation with a concentration of insulin of 50 mIU/L, using as certified reference material https://www.nibsc.org/documents/ifu/66-304.pdf"
Usage: #example

* id = "4335db48-7090-45b3-a2c2-45b45f94a67c" 
* status = #final
* code.coding[+] = http://loinc.org#20448-7	"Insulin [Units/volume] in Serum or Plasma"
* code.coding[+] = http://npu-terminology.org#NPU02496 "P—Insulin; arb.subst.c.(IRP 66/304; proc.) = ? × 10-3 IU/L"
* effectiveDateTime = "2023-03-27T11:24:26+01:00"
* subject = Reference(urn:uuid:de17bfd2-8d73-45fa-b0bb-8eb0e463ddb8)
* performer[+].display = "Jan Laborant" // ToDo: consider cardinality
* valueQuantity = 50 'm[iU]/L' "mIU/L"
* extension[ObservationCertifiedRefMaterialCodeable].valueCodeableConcept = $nibsc#66/304 "Insulin, human, for immunoassay, Lyophilized, 3 IU / ampoule."
* extension[ObservationCertifiedRefMaterialIdentifer].valueIdentifier
  * system = $nibsc
  * value = "66/304"


