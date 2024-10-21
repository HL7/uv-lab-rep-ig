### Design Choices

{% include fsh-link-references.md %}

#### DiagnosticReport vs HL7 FHIR Document

There are two ways - in principle - for representing a Laboratory report in HL7 FHIR:
* by using the DiagnosticReport resource; or 
* by treating the report as any other clinical document, i.e. using a HL7 FHIR Document Bundle.

The solution proposed in this guide tries to take in consideration the very different meanings that a Laboratory Report can assume in different countries.

In fact, in many countries a Laboratory Report is a **legally signed document**. 
Reports are often structured in sections and may include different kinds of test results.
There are several implementations still based on HL7 CDA (mainly IHE XD-LAB) that are progressivly moving to HL7 FHIR and are still using document exchange infrastructures (e.g. IHE XD*).

In others, a report is a simple collection of results, not treated as a document and often not providing any structured content.

This guide proposes a scalable approach:
* Report as a collection of results: DiagnosticReport (figure 1)
* Report as a structured collection of results: DiagnosticReport with Composition (figure 2)
* Report as a FHIR Document: DiagnosticReport with Composition in a 'document' Bundle (figure 3)

These choices would allow for different jurisdictions to select the solution that better fits with their requirements, while assuring the capability for everyone to retrieve laboratory report data by searching via DiagnosticReport.


In brief:

* A Laboratory Report is always represented by one and only one DiagnosticReport.
* A DiagnosticReport may refer to a Composition. (required for documents)
* When present, the referred Composition:
  * defines the report structure, often just a single section;
  * provides a means for assembling the report as a document (i.e. as a Bundle of type 'document')
* A document Bundle may be used to represent the legally signable report, including all the data defining the report.


The following figures graphically summarizes the described design approach.


<div>
<img src="lab-structure-1.png"  alt="Laboratory report design approach" width="40%">
<p>Figure 1 - Report as collection of results: DiagnosticReport</p>
<p></p>
</div>

<div>
<img src="lab-structure-2.png"  alt="Laboratory report design approach" width="50%">
<p>Figure 2 - Report as structured collection of results: DiagnosticReport with Composition </p>
<p></p>
</div>

<div>
<img src="lab-structure.png"  alt="Laboratory report design approach" width="80%">
<p>Figure 3 - Report as document: DiagnosticReport with Composition in a Document Bundle</p>
<p></p>
</div>


The document based solution, adopted in the European realm, tries to balance the two expectations of having a HL7 FHIR Document and searching reports via DiagnosticReport, limiting as much as possible the implementation options. 
Moreover it takes into account the R5 DiagnosticReport design pattern where the DiagnosticReport vs. Composition relationship is directed from the DiagnosticReport to the Composition resource.

The authors are aware of the fact that this choice requires additional work by the report creator, requesting to consistently record in both DiagnosticReport and Composition a set of information. 
However, they believe that it enables more options for the consumer:
* preserving the existing document-based paradigm and helping the transition from CDA-based solutions by facilitating the reuse of:
  * the existing exchange infrastructures
  * the on-development mapping of CDA to FHIR artifacts
* enabling for use of the REST paradigm


#### Pre-adoption of R5 Rules for Document Bundles

To support the described documental approach, this guide allows for the **pre-adoption of the R5 rules for the inclusion of the resources in a document Bundle**, that is:

_"The document bundle SHALL include only: <..>
The supporting information: Any resources that are part of the graph of resources that reference or are referenced from the composition set, either directly or indirectly (e.g. recursively in a chain)"_

in opposition to the R4 rules requiring that, with the exception of the Provenance resource and the Binary including the stylesheet, only resources directly or indirectly - referred **from** the composition can be included.

This choice is justified by the fact that:
* There was a good consensus in the HL7 FHIR community for supporting this.
* In R5 the link between the DiagnosticReport and the Composition is realized with a Reference from the DiagnosticReport. The team decided to follow the same design pattern to facilitate the R4 to R5 transition.
* Adding a reference from the Composition to the DiagnosticReport would create an undesirable circular reference.

However, this choice is not imposed, so that usage contexts wishing to keep a full consistency with R4 rules may use the [DiagnosticReportReference] extension to refer to the DiagnosticReport from the Composition. The adoption of this extension implies the presence of a circular reference of Composition to/from the DiagnosticReport.