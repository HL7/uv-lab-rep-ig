###  Scenarios

This page describes laboratory report scenarios for the purpose of **highlighting how laboratory report relevant statuses should be set**.

These scenarios, in scope for this guide, relate to tests performed and reported by a clinical laboratory in fulfillment of test orders.

More details on statuses and their relationships are provided in [Laboratory result report status](status-mgmt.html).

It is not in the scope of this version of the IG to specify the actor-to-actor interactions for supporting such scenarios. (e.g. how to communicate that a report has been sent in error).

#### Complete Laboratory Report

* A Laboratory, after performing its internal testing workflow, **forms a complete result report**, according to the requirements and query parameters formulated by the ordering entity. Internal testing workflow includes consolidation of all test result orders or order groups and all steps of data quality assurance and validation.
* Then, depending on its internal organization, the laboratory may inform the application of the clinical practice (known as Order Result Tracker), send the report to the intended recipients included in the Laboratory test order; store a report copy in an EHR-system; etc.

In this case:
* the Laboratory report status is set to “final”;
* all individual test results which are included in the final laboratory report should be also marked as final or cancelled

#### Partial Laboratory Report

* In some cases, a laboratory might **release a laboratory report** which is **incomplete** (not all results are available or marked as “final”).
* This usually occurs when some of the results are known to be produced later, but others need to be communicated to report recipients due to specific organizational and/or process rules; or because of the urgency of some results. Note: The ‘delay’ in the results availability may be due to the nature of the test, or to organizational or technical reasons.

In such cases: 
* the report status should be set to “partial”. 

#### Preliminary Laboratory Report

* In some cases, a laboratory might **release a laboratory report** which is either **verified results that are known to change over time.**.
* This usually occurs for specific methods that require a long performance period, like cultures of slow growing organisms, but intermediate verified results need to be communicated to report recipients due to specific organizational and/or process rules (e.g. culture and susceptibility testing for Mycobacterium tuberculosis (MTB))

In such cases: 
* the report status should be set to "preliminary". 

####  Updated Laboratory Report

* A **laboratory report, after being released as “final”, is modified** (edited or added to).
* The report is complete and verified by an authorized person

In this case:

* the report status used will indicate what modifications have occurred:
  * status set to “amended” when changes were made to patient demographics or other parts of the report that don't affect the result value (with units, if applicable) or result interpretation
  * status set to “corrected” when changes are made to the result value (with units, if applicable) or result interpretation
  * status set to “appended” when new results or interpretations are being added

#### Cancelled Laboratory Report

* In some cases, **a laboratory might not be able to perform any test and deliver a laboratory report**. This might have many reasons, e.g., lost sample, broken tube, dysfunction of the analyser etc. 

In such case:
* the status value should be updated to “cancelled” and 
* the specific details given - preferably as coded values - in the DiagnosticReport.extension:event-statusReason element.
* additional information may be provided in the result comment element as well.


#### Error Laboratory Report

* It may happen that a **laboratory report is originally created/issued in error**. The report is marked so that the entire report shall not be considered as valid.
* All involved actors are informed about this “in error” report.

In this case:
* the laboratory report status should be set to “entered-in-error”.


### Status Management

Laboratory reports, as documented in [Laboratory Report scenarios](scenarios.html), could exist in several statuses.

Applications consuming laboratory reports must take careful note of updated (revised) reports and ensure that retracted reports are appropriately handled.

For applications providing diagnostic reports, such as laboratory reports, a report should not be final until all the individual test results reported in it are final or cancelled.

If the report has been withdrawn, following a previous final release, the report and associated results should be retracted by replacing the status codes with the “entered-in-error” and setting the conclusion/comment (if provided) and the text narrative to some text like “This report has been withdrawn” in the appropriate language. A reason for retraction may be provided in the narrative.

The following paragraphs describe:
* the statuses foreseen for the HL7 FHIR resources relevant for documenting Laboratory Reports and included results.
* the state machine diagrams documenting possible transitions between states.


Please refer to the [Design Choices page](design-choice.html) for details on the general approach and on how these resources are used together for the scope of this guide.



#### Laboratory Report: DiagnosticReport

DiagnosticReport is the HL7 FHIR resource designed for documenting Laboratory reports. It includes clinical context such as requesting provider information, and some mix of atomic results, images, textual and coded interpretations, formatted representation of diagnostic reports and status information.


Diagnostic report status value set is comprised from following status codes ( [DiagnosticReportStatus](https://hl7.org/fhir/R4/codesystem-diagnostic-report-status.html) )

|Lvl|Code|Display|Definition|
|:---:|----|-------|----------|
|1|registered|Registered|The existence of the report is registered, but there is nothing yet available.|
|1|partial|Partial|This is a partial (e.g. initial, interim or preliminary) report: data in the report may be incomplete or unverified.|
|2|preliminary|Preliminary|Verified early results are available, but not all results are final.|
|1|final|Final|The report is complete and verified by an authorized person.|
|1|amended|Amended|Subsequent to being final, the report has been modified. This includes any change in the results, diagnosis, narrative text, or other content of a report that has been issued.|
|2|corrected|Corrected|Subsequent to being final, the report has been modified to correct an error in the report or referenced results.|
|2|appended|Appended|Subsequent to being final, the report has been modified by adding new content. The existing content is unchanged.|
|1|cancelled|Cancelled|The report is unavailable because the measurement was not started or not completed (also sometimes called "aborted").|
|1|entered-in-error|Entered in Error|The report has been withdrawn following a previous final release. This electronic record should never have existed, though it is possible that real-world decisions were based on it. (If real-world activity has occurred, the status should be "cancelled" rather than "entered-in-error".).|
|1|unknown|Unknown|The authoring/source system does not know which of the status values currently applies for this observation. Note: This concept is not to be used for "other" - one of the listed statuses is presumed to apply, but the authoring/source system does not know which.|


<div>
<p>Fulfilling the following state diagram:</p>
<img src="diagnostic-report-state-machine.png"  alt="Laboratory result report state machine diagram" width="60%">
<p>Figure 1: DiagnosticReport state machine diagram</p>
</div>

#### Laboratory report: Composition

A Composition defines the structure and narrative content necessary for a laboratory report. It is a mandatory resource for a Document Bundle this guide is based on (see [FHIR Documents](https://hl7.org/fhir/R4/documents.html) ).

The status of the composition reflects the status of the document and it should be aligned with that of the DiagnosticReport.
Unfortunately, in HL7 FHIR R4 – see the [following paragraph](#hl7-fhir-r4-1) - only a subset of them are allowed for the Composition, requiring some mapping effort in dealing with them. (See the paragraph [DiagnosticReport and Composition status correlation](#diagnosticreport-and-composition-status-correlation) below)


##### HL7 FHIR R4

|Lvl|Code|Display|Definition|
|:---:| --------- | ----------- | ------------------------------------------------------------------------------------- |
| 1 | preliminary | Preliminary | This is a preliminary composition or document (also known as initial or interim). The content may be incomplete or unverified.                                                                                |
| 1 | final       | Final       | This version of the composition is complete and verified by an appropriate person and no further work is planned. Any subsequent updates would be on a new version of the composition.                        |
| 1 | amended     | Amended     | The composition content or the referenced resources have been modified (edited or added to) subsequent to being released as "final" and the composition is complete and verified by an authorized person. |
| 1 | entered-in-error | Entered in Error | The composition or document was originally created/issued in error, and this is an amendment that marks that the entire series should not be considered as valid.                                    |

A following state machine diagram describes transitions between statuses.

<div>
<p></p>
<img src="composition-state-machine-R4.png"  alt="Composition state machine diagram - R4" width="60%">
<p>Figure 2 - Composition (R4) state machine diagram</p>
</div>


##### HL7 FHIR R5

Composition status codes have been extended in HL7 FHIR R5 to align Composition and DiagnosticReport statuses.

|Lvl|Code|Display|Definition|
|:---:| --------- | ----------- | ------------------------------------------------------------------------------------- |
| 1 | registered  | Registered  | The existence of the composition is registered, but there is nothing yet available.   |
| 1 | partial     | Partial     | This is a partial (e.g. initial, interim or preliminary) composition: data in the composition may be incomplete or unverified.                                                                            |
| 2 | preliminary | Preliminary | Verified early results are available, but not all results are final.                  |
| 1 | final       | Final       | This version of the composition is complete and verified by an appropriate person and no further work is planned. Any subsequent updates would be on a new version of the composition.                        |
| 1 | amended     | Amended     | The composition content or the referenced resources have been modified (edited or added to) subsequent to being released as "final" and the composition is complete and verified by an authorized person. |
| 2 | corrected   | Corrected   | Subsequent to being final, the composition content has been modified to correct an error in the composition or referenced results.                                                                         |
| 2 | appended    | Appended    | Subsequent to being final, the composition content has been modified by adding new content. The existing content is unchanged.                                                                             |
| 1 | cancelled   | Cancelled   | The composition is unavailable because the measurement was not started or not completed (also sometimes called "aborted").                                                                            |
| 1 | entered-in-error | Entered in Error | The composition or document was originally created/issued in error, and this is an amendment that marks that the entire series should not be considered as valid.                                    |
| 1 | deprecated  | Deprecated  | This composition has been withdrawn or superseded and should no longer be used.       |
| 1 | unknown     | Unknown     | The authoring/source system does not know which of the status values currently applies for this observation. Note: This concept is not to be used for "other" - one of the listed statuses is presumed to apply, but the authoring/source system does not know which.                                                             |

A following state machine diagram describes transitions between statuses.

<div>
<p></p>
<img src="composition-state-machine-R5.png"  alt="Composition state machine diagram - R5" width="60%">
<p>Figure 3 - Composition (R5) state machine diagram</p>
</div>

#### Results: Observation

A laboratory report comprises a set of entries, i.e., the individual results, each of which can be in its own lifecycle stage (that could not be necessarily the same of the overall report).

This stage could be expressed in the Observation resource using a status code, as described in the table below. The allowed state transitions are reported in the following State machine diagram.

It is responsibility of the system curating the report to keep consistency between the statuses of the report and those of the single results.


|Lvl|Code|Display|Definition|
|:---:| --------- | ----------- | ------------------------------------------------------------------------------------- |
| 1 | registered  | Registered  | The existence of the observation is registered, but there is no result yet available. |
| 1 | preliminary | Preliminary | This is an initial or interim observation: data may be incomplete or unverified.      |
| 1 | final       | Final       | The observation is complete and there are no further actions needed. Additional information such "released", "signed", etc would be represented using [Provenance]({{ site.data.fhir.path }}provenance.html) which provides not only the act but also the actors and dates and other related data. These act states would be associated with an observation status of `preliminary` until they are all completed and then a status of `final` would be applied. |
| 1 | amended     | Amended     | Subsequent to being Final, the observation has been modified subsequent. This includes updates/new information and corrections. |
| 2 |  corrected  | Corrected   | Subsequent to being Final, the observation has been modified to correct an error in the test result.|
| 1 | cancelled   | Cancelled   | The observation is unavailable because the measurement was not started or not completed (also sometimes called "aborted").|
| 1 | entered-in-error | Entered in Error | The observation has been withdrawn following previous final release. This electronic record should never have existed, though it is possible that real-world decisions were based on it. (If real-world activity has occurred, the status should be "cancelled" rather than "entered-in-error".). |
| 1 | unknown      | Unknown    | The authoring/source system does not know which of the status values currently applies for this observation. Note: This concept is not to be used for "other" - one of the listed statuses is presumed to apply, but the authoring/source system does not know which. |

<div>
<p></p>
<img src="observation-state-machine.png"  alt="Observation state machine diagram" width="60%">
<p>Figure 4 - Observation state machine diagram</p>
</div>

#### Laboratory report and result statuses correlation

From the workflow perspective, the status of the report and that of its entries is partially independent; thus, formal consistency rules would be difficult to be specified.

However some basic rules about the status in observation and the expected status in DiagnosticReport is recommended as proposed in the following table.


| DiagnosticReport status | Definition (excerpt) | Observation status recommendations for implementers           |
| ----------------------- | --------------------- | ------------------------------------------------------------- |
| registered              |                       | All Observations should be registered.                        |
| partial                 | Data in the report may be incomplete or unverified. | Some Observation.status are not final and/or the report has not been verified (Composition.attester is empty) |
| preliminary             | Verified early results are available, but not all results are final. |  Report is verified (Composition.attester is not empty) and some Observation.status are not final. |
| final                   | The report is complete and verified. | Report is verified (Composition.attester is not empty) and all Observation.status are final or some are canceled. |
| amended                 | Report has been modified. This includes any change in the content of a report that has been issued. | (Some Observation.status are entered-in-error or amended rest of the Observation.status are final) and/or any other part of the report has changed. |
| corrected               | The report has been modified to correct an error subsequent to being final. | Some Observation.status are corrected or entered-in-error and the rest of the Observation.status are final. |
| appended                | Subsequent to being final, the report has been modified by adding new content. | Report is verified (Composition.attester is not empty) and all Observation.status are final or some are canceled. |
| cancelled               | The report is unavailable because the measurement was not started or not completed | All Observation.status are cancelled |
| entered-in-error        | The report has been withdrawn following a previous final release. | All Observation.status are entered-in-error |
| unknown                 |  | All Observation.status are unknown. |

#### DiagnosticReport and Composition status correlation

The status of the laboratory report should be reported in both the DiagnosticReport and Composition status, and they should be consistent.

As previously described, if the alignment is possible for HL7 FHIR R5 (see [HL7 FHIR R5](#hl7-fhir-r5-1) below), the Composition status value set required for HL7 FHIR R4 only includes a subset of the needed concepts.  

The following paragraph describes a possible approach to try to keep this consistency.

##### HL7 FHIR R4

For the purpose of this guide, based on HL7 FHIR R4, the status of the laboratory report is recorded in the DiagnosticReport.status, applying as possible the following recommended mapping table between DiagnosticReport and Composition.status codes:


| DiagnosticReport status | Composition status |
| ----------------------- | ------------------ |
| registered              | preliminary        |
| partial                 | preliminary        |
| preliminary             | preliminary        |
| final                   | final              |
| amended                 | amended            |
| corrected               | amended            |
| appended                | amended            |
| cancelled               | final              |
| entered-in-error        | entered-in-error   |
| unknown                 | ANY status         |

##### HL7 FHIR R5

Recommended mapping between DiagnosticReport and Composition.status codes for FHIR R5:

| DiagnosticReport status | Composition status |
| ----------------------- | ------------------ |
| registered              | registered         |
| partial                 | partial            |
| preliminary             | preliminary        |
| final                   | final              |
| amended                 | amended            |
| corrected               | corrected          |
| appended                | appended           |
| cancelled               | cancelled          |
| entered-in-error        | entered-in-error   |
| unknown                 | unknown            |
