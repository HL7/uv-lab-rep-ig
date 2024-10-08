
<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<blockquote class="stu-note">
		<b>Informative for this version of the guide</b>
		<p>Obligations have been added to this version of the guide only as informative material to collect feedback about their usage.</p>
	</blockquote>
</div>


### Overview 

Obligations are a means offered by HL7 FHIR to specify functional capabilities that defined actors MAY, SHOULD or SHALL conform to for the data elements specified by the profiles.

The current choice is to define the obligations in StructureDefinitions distinct from those used for defining the structural constraints.

This page also describes the actors that have been defined for specifying the obligations.

### Actors

{% include fsh-link-references.md %}

Three actors have been specified:
* the [Creator](ActorDefinition-actor-creator-uv-lab.html) ;
* the [Repository](ActorDefinition-actor-repos-uv-lab.html) ; and 
* the [Consumer](ActorDefinition-actor-consumer-uv-lab.html)

The first is the actor creating the report. This report can be sent to a consumer or to a repository for report storage and sharing. 
The second actor is the system maintaining a copy of the report received, to store and make it available for the consumers.
The last actor is the system using the report received or retrieved.

<p>{% include actors.svg %}</p>

### Obligations List

1. Patient Obligations ([PatientUvLabObligations])
1. Observation Obligations	([ObservationUvLabObligations])
1. ServiceRequest Obligations ([ServiceRequestUvLabObligations])
1. Specimen Obligations ([SpecimenUvLabObligations])