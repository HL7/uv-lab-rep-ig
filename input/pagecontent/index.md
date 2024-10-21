{% include fsh-link-references.md %}

<div xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<blockquote class="stu-note">		
		<p>This ballot version is based on the HL7 Europe Laboratory Report FHIR IG as the initial content.</p>		
		<p>Balloters are requested to provide their feedback on the design approach taken in this IG (based on the prior European work), particularly on the use of the FHIR 'document' Bundle containing both the Composition and DiagnosticReport resources for structuring and organizing the report.  This approach is the result of compromising between the business requirements that have been expressed for the report to be a valid clinical document (potentially with signature) and also searchable and accessible via the DiagnosticReport endpoint, as well as the desire to constrain the available options and promote standardization on a common implementation strategy.
		</p>
		<p>The IG aims to represent two principal methods of communicating lab results - one method that uses a FHIR 'document' Bundle to include the DiagnosticReport/Observations, and another method that includes the DiagnosticReport/Observations and also optionally as needed a Composition for structuring the results that would not yield a formal FHIR Document.  We seek feedback on the pros and cons of supporting both of these options (vs. requiring a single common approach) and how to better represent and/or explain the choices and tradeoffs.
		</p>
		<p>We also seek feedback on how to model DiagnosticReport - Observation structures to enable consistent representation of Observations that are reported either as part of a panel or separately.  E.g., when should DiagnosticReport.code and Observation.code be duplicative, can Observations include panel headers (and thus have empty Observation.value attributes, etc.).
		</p>
	</blockquote>
</div>

<div xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<blockquote class="stu-note">		
		<p>Obligations have been added to this version of the IG only as <b>Informative</b> material to collect feedback about their usage.</p>		
		<p>For more details about obligations please refer to the <a href="obligations.html">Obligations page</a></p>
	</blockquote>
</div>


### Scope

Specify a set of rules to be applied to HL7 FHIR to define how to represent a **Laboratory Report** .

This Implementation Guide applies to laboratory reports within the core fields of in-vitro diagnostics, for example clinical biochemistry, haematology, immunohematology, microbiology, immunology, while leaving out some specialised laboratory domains like histopathology or medical genetics. 
This version focuses only on common rules that apply to all the in-scope situations, without specifying specialized domain-specific profiles, as for example microbiology profiles.

This guide is not limited to test results performed by clinical laboratories on Human specimens (from human subject), but it considers also results on non-human materials or living subjects; or non-human specimens paired with a human subject. Derived guides may restrict the scope as needed (e.g. limiting the scope to well-identified human beings)

### Purpose
The goal of this Implementation Guide is to define a universal standard for the Laboratory Report to facilitate the harmonization among worldwide initiatives and minimizing unnecessary variations across realms.

This project used the [HL7 Europe Laboratory Report FHIR IG](https://hl7.eu/fhir/laboratory) and other existing guides as a starting point; and it aims to be realized in collaboration with the IHE PALM community.

### Design choices

The solution adopted by this guide - and detailed in the [Design choices](design-choice.html) page - balances the business requirement of some jurisdictions of the Laboratory Report as legally signable document (i.e. as a FHIR Document), with the expectation in several usage contexts to not rely on the documental approach. 
This guide supports a scalable approach allowing different jurisdictions to select the solution that better fits with their requirements, while assuring the capability for everyone to retrieve laboratory report data by searching per DiagnosticReport.

<div>
<img src="lab-structure.png"  alt="Laboratory report design approach" width="50%">
<p>Figure 1 - Overview of the report design approach</p>
<p></p>
</div>

### Navigating the profiles

The following diagrams provide a browseable overview of the profiles specified by this guide (not all the relationships have been reported).

The first highlights the most relevant relationships starting from the DiagnosticReport ( [DiagnosticReportUvLab] ) resource (REST Perspective).

<div>
<p>{% include links-overview.svg %}</p>
<p>Figure 2 - Overview of the profiles relationships</p>
<p></p>
</div>

The second the profiles included in the document bundle ( [BundleLabReportUv] ) (Document Perspective).

<div>
<p>{% include document-overview.svg %}</p>
<p>Figure 3 - Overview of the document structure</p>
<p></p>
</div>


### Dependencies

{% include dependency-table.xhtml %}

### Cross Version Analysis

{% include cross-version-analysis.xhtml %}

### Global Profiles

{% include globals-table.xhtml %}

### IP statements

{% include ip-statements.xhtml %}

### Authors and Contributors

Please refer to the [Authors and Contributors](contributors.html) page.
