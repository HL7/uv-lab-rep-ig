ValueSet: LabOrderCodesEuVs
Id: lab-orderCodes-uv-lab
Title: "Laboratory Order"
Description: "List of LOINC Laboratory codes of type 'Order' or 'Both. This value set is built upon the IPS value set 'Results Laboratory Observation - IPS'"

// * ^publisher = "HL7 Europe"
// * ^copyright = "HL7 Europe"
* insert LOINCCopyrightForVS
* insert SetFmmandStatusRule ( 2, trial-use)
* include codes from system $loinc where ORDER_OBS = "Order"
* include codes from system $loinc where ORDER_OBS = "Both"