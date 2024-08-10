ValueSet:      LabReportBundleTypesVs
Id:	       reportBundleType-uv-lab
Title:	       "Laboratory Report Bundle Types"
Description:   """Laboratory Report Bundle Types"""
* insert SetFmmandStatusRule ( 2, trial-use)
* ^experimental = false
* $bundle-type#document "Document"
* $bundle-type#transaction "Transaction"
* $bundle-type#collection "Collection"
