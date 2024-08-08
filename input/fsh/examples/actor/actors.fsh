Instance: actor-creator-uv-lab
InstanceOf: ActorDefinition
Title: "Actor Laboratory Report Creator"
Description: """Laboratory Report Creator: a system generating and sending/providing a Laboratory Report to a Consumer or to a Repository for report storage and sharing."""
Usage: #example

* url = "http://hl7.org/fhir/uv/laboratory/actor-creator-uv-lab"
* name = "LabReportCreator"
* status = #active
* type = #system
// * type = #entity
* documentation = """This actor represents the Laboratory Report creators. That is the actor creating the report that can be send to a consumer or to a repository for report storage and sharing."""

Instance: actor-consumer-uv-lab
InstanceOf: ActorDefinition
Title: "Actor Laboratory Report Consumer"
Description: """Laboratory Report Report Consumer: a system receiving/querying and using a Laboratory Report."""
Usage: #example

* url = "http://hl7.org/fhir/uv/laboratory/actor-consumer-uv-lab"
* name = "LabReportConsumer"
* status = #active
* type = #system
// * type = #entity
* documentation = """This actor represents the Laboratory Report consumers. That is the system using the report received or retrieved.
Using includes, but is not limited to, the report display, storage or processing."""

Instance: actor-repos-uv-lab
InstanceOf: ActorDefinition
Title: "Actor Laboratory Report Repository"
Description: """Laboratory Report Report Repository: a system maintaining a copy of the received Laboratory Report, to store and make it available for the consumers."""
Usage: #example

* url = "http://hl7.org/fhir/uv/laboratory/actor-repos-uv-lab"
* name = "LabReportRepos"
* status = #active
* type = #system
// * type = #entity
* documentation = """This actor represents the Laboratory Report Repositories. That is any system maintaining a copy of the report received, to store and make it available for the consumers."""