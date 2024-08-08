Profile: QuantityUvLab
Parent: Quantity-uv-ips
Id: Quantity-uv-lab
Title: "Quantity (Uv Lab)"
Description: "This profile constrains the Quantity data type to use UCUM as the code system for units and optionally share measurement uncertainty"
// * ^publisher = "HL7"
* ^purpose = "This profile of the Quantity data type imposes the usage of the UCUM as the code system for units and allows expressing uncertainty of measurement"
* . ^short = "A measured amount using UCUM"
* . ^definition = "A measured amount (or an amount that can potentially be measured) and uncertainty of the measurement. Note that measured amounts include amounts that are not precisely quantified, including amounts involving arbitrary units and floating currencies.\r\nThis profile imposes that the code system for units be UCUM."
* extension contains $iso21090-uncertainty named uncertainty 0..1
* extension contains $iso21090-uncertaintyType named uncertaintyType 0..1

/* Profile: RangeUvLab
Parent: Range-uv-ips
Id: Range-uv-lab
Title: "Range (Uv) for lab observations"
Description: "Data type Range constrained to use UCUM as the code system for units and optionally share measurement uncertainty"
* ^publisher = "HL7"
* ^purpose = "This profile of the Range data type imposes the usage of the UCUM as the code system for units and allows expressing uncertainty of measurement"
* . ^short = "A measured amount range using UCUM"
* . ^definition = "A measured amount range (or an amount range that can potentially be measured) and uncertainty of the measurement. Note that measured amounts include amounts that are not precisely quantified, including amounts involving arbitrary units and floating currencies.\r\nThis profile imposes that the code system for units be UCUM."
* low.extension contains $iso21090-uncertainty named uncertainty 0..1
* low.extension contains $iso21090-uncertaintyType named uncertaintyType 0..1
* high.extension contains $iso21090-uncertainty named uncertainty 0..1
* high.extension contains $iso21090-uncertaintyType named uncertaintyType 0..1

 */
Profile: RatioUvLab
Parent: Ratio-uv-ips
Id: Ratio-uv-lab
Title: "Ratio (Uv Lab)"
Description: "This profile constrains the Ratio data type to use UCUM as the code system for units and optionally share measurement uncertainty"
// * ^publisher = "HL7"
* ^purpose = "This profile of the Ratio data type imposes the usage of the UCUM as the code system for units and allows expressing uncertainty of measurement"
* . ^short = "A measured ratio using UCUM"
* . ^definition = "A measured ratio (or a ratio that can potentially be measured) and uncertainty of the measurement. This profile imposes that the code system for units be UCUM."
* extension contains $iso21090-uncertainty named uncertainty 0..1
* extension contains $iso21090-uncertaintyType named uncertaintyType 0..1
