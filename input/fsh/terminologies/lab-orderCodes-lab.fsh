ValueSet: LabOrderCodesEuVs
Id: lab-orderCodes-uv-lab
Title: "Laboratory Order"
Description: "List of LOINC Laboratory codes of type 'Order' or 'Both. This value set is built upon the IPS value set 'Results Laboratory Observation - IPS'"


* insert LOINCCopyrightForVS
* insert SetFmmandStatusRule ( 2, trial-use)
* include codes from system $loinc where STATUS = "ACTIVE" and CLASSTYPE = "Laboratory class" and ORDER_OBS = "Order"
* include codes from system $loinc where STATUS = "ACTIVE" and CLASSTYPE = "Laboratory class" and ORDER_OBS = "Both"
//* include codes from system $loinc and valueset $results-laboratory-observations-uv-ips where ORDER_OBS = "Order"
//* include codes from system $loinc and valueset $results-laboratory-observations-uv-ips where ORDER_OBS = "Both"
