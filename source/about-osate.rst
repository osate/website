About OSATE
===========

OSATE Modeling Capabilities
---------------------------

OSATE (Open Source AADL Tool Environment) includes the capability to:

1. Create AADL models using a syntax-aware text editor and synchronized
   graphical editor. AADL models are organized in separate projects in a
   workspace. The tool supports validation of AADL models according to
   all naming and legality rules defined in the AADL standard. The text
   editor provides code templates, real-time syntax checking, code
   completion, and proposals to fix errors. In addition to the core
   language, models may contain elements from the AADL Standard Annexes
   (e.g., error model, requirements definition and analysis, ARINC653,
   and behavior annexes).
2. Import Mathworks® MATLAB™ Simulink™ models into OSATE. The importer
   translates the diagram structure and transforms SCADE and Simulink
   blocks into AADL components.
3. Support the SAE Standard Aerospace Recommended Practice (ARP) 4761,
   Guidelines and Methods for Conducting the Safety Assessment Process
   on Civil Airborne Systems and Equipment. The processes and techniques
   of the ARP4761 standard addressed by the tool are the Functional
   Hazard Assessment, Fault Tree Analysis, Failure Modes and Effects
   Analysis, and Dependence Diagrams, also referred to as Reliability
   Block Diagrams.
4. Perform structural verification of AADL models and of property values
   associated with model elements using the Resolute constraint language
   (developed by Rockwell Collins in the SMACCM research project).
   Example use of Resolute: verify OS specific constraints on ARINC653
   systems for code and configuration generation.
5. Perform compositional verification of system and component behavior
   using the AGREE language (developed by Rockwell Collins in the SMACCM
   research project). This supports reasoning about system behavior
   based on assume/guarantee contracts and the structure of the system’s
   architecture model.
6. Architecture Led Integrated System Assurance (ALISA). ALISA provides
   a Requirement Specification capability that allows users to express
   stakeholder requirements and system specifications in the context of
   an AADL model of a system. A requirements analysis will assess how
   well different aspects of the system (interfaces, quality attributes,
   and hazards) are covered by the requirements specification. This is a
   capability that was added to OSATE in version 2.2. The capability
   includes the ReqSpec requirements definition, requirements
   traceability, traceability reports, verification plan execution, and
   certification plan execution. For documentation see the Alisa User
   Guide accessible from the OSATE Help Page.
7. Provide basic repository support through the git perspective in
   OSATE.

OSATE Code Generation Capabilities
----------------------------------

Beyond the modeling and analysis of real-time computing systems in AADL,
OSATE also currently supports automated generation and integration of
the software specified in the AADL model (e.g., data, runtime behavior,
code, partition scheduling, and partition memory configuration). The
resulting auto-generated software, after being linked and compiled, can
be loaded onto the processor operating system for execution of the
system functionality.

OSATE currently includes the following automated generation
capabilities, dependent on the Ocarina plugin:

1. WindRiver® VxWorks™ and DDC-I® DeOS™ Configuration File Generator.
   This capability generates configuration files for WindRiver® VxWorks™
   and DDC-I® DeOS™ ARINC653 Real-Time Operating System (RTOS) targets
   from verified AADL models with AADL Standard ARINC653 annex
   annotations.
2. Runtime executive code generation for application functions. This
   capability utilizes Ocarina to generate C code that interfaces
   application functions through task communication services and
   application subprogram calls to be configured on a specific RTOS.
   Handwritten or generated subprograms from functional models such as
   SCADE or Simulink are supplied by the developer for integration with
   Ocarina generated code. This capability is available when installing
   Ocarina to interface with an OSATE Ocarina Bridge plugin.
3. Prototyping with a portable Partitioned Operating system Kernel
   (POK). This capability generates configurations of ARINC653
   partitioned applications from AADL models for POK, a configurable
   portable partition RTOS for distributed platforms. This capability
   allows for early prototyping without access to the target platform.
4. User-friendly code generation. The code generation is based on the
   user selecting the target OS. The process can be started by selecting
   a model implementation, going to the OSATE menu bar and finding Code
   Generation -> Check semantics for (VxWorks, DeOS, POK). The code
   generation tool will:

   -  Perform semantic checks based on a particular OS validation rules
      that will ensure the use of appropriate modeling
      patterns/properties before generating code
   -  Guiding the system designer to check content of the model before
      generating code
   -  Inform the user as to any missing or incorrect properties
      particular to the OS selected.

Ocarina is a tool suite written in Ada to manipulate AADL models.
Ocarina proposes AADL model manipulation, generation of formal models,
performs scheduling analysis and generates distributed applications. For
more information on Ocarina, visit http://www.openaadl.org/ocarina.html.

OSATE Analysis Capabilities
---------------------------

OSATE includes the capability to perform a variety of resource analyses.
Online help for each analysis is available via SEI Validation Plugins
within the AADL Workbench help area.

The following summarizes the analyses that can be performed. Items 4-7
below include information on analyses that are supported by direct
invocation of the analysis as well as by a workflow approach to
executing the analyses.

1. *End-to-end Latency Analysis* – This capability lets users determine
   the worst-case response time and latency jitter on an end-to-end flow
   specified in an AADL model. The analysis calculates the results with
   increasing fidelity as AADL models are refined. Latency may be
   calculated for functional architectures purely based on specified
   latency for components and connections, for sampling and queued task
   architectures with sampling, immediate (mid-frame), and (frame)
   delayed connections, binding to an ARINC653 partitioned architecture,
   and processors with different speeds. It can also take into account
   data size, protocol overhead, and network bandwidth. The tool
   produces a report that can be imported in popular productivity tools.
2. *Functional Integration Analysis* – This capability lets users assess
   consistency when components are integrated together through
   connections. It assures that for port connections the data types of
   data being communicated match, that their base types, such as signed
   32-bit integer, expected range of values and assumed measurement
   units match, and that the data is consistently mapped into an
   underlying ARINC429 protocol.
3. *Port Connection Consistency Checks (also: Architecture Topology
   Analysis)* – This capability lets users assess consistency in
   architecture connectivity. Examples of this type of consistency
   checks are ensuring that the correct types of hardware components can
   be interconnected, e.g., a device is connected via USB2.0, ensuring
   that only one incoming sampling data port connection is active in
   each operational mode, and ensuring that when threads with port
   connections are bound to different processors a hardware path via
   buses/networks exists between these processors.
4. *Weight Analysis* – This capability allows users to determine whether
   a physical system exceeds maximum weight requirements. Weights on
   individual components and connecting elements are expressed as gross
   or net weight. The analysis ensures consistency between weight
   specifications and compositionally aggregates weights across multiple
   architectural layers. The analysis provides feedback on incompletely
   specified models indicating the ratio of components with actual
   weight specification.
5. *Electrical Power Analysis* – This capability allows users to specify
   the supply capacity of electrical power providers, the
   demands/budgets for electrical power consumers, as well as the
   capacity of the power distribution system. The distribution system
   can be connected to sub-distribution systems. The analysis identifies
   any mismatch between supply and demand. The analysis is intended for
   early electrical power budgeting and does not take into account any
   dynamics of a power distribution system.
6. *Computer Resource Budget Analysis* – This capability performs
   resource budget analysis for

   -  processors with capacity expressed in MIPS and demands in terms of
      MIPS budgets and refined to threads with periods and execution
      time. The analysis can be applied to the system as a whole. It can
      also be applied to systems/abstract components in a functional
      architecture, or processes and threads in a task architecture once
      they are bound to processors, in processor specific form.
   -  memory budget with memory capacity and component budgets expressed
      in terms of bytes, Kbytes, or Mbytes. The analysis helps ensure
      that the memory provided is sufficient to address the memory
      demands of the Application components.
   -  network bandwidth analysis based on 1) inferred binding of
      connections to buses; and 2) analysis based on explicit binding of
      connections to buses. Each of the two variants supports taking
      into consideration loopback communication of connections within
      the same processor. In case of loopback communication,
      intra-processor communication is also routed through the network.
      This technique allows application components to be relocated to
      different processors without impacting the load on the network.

7. *Safety Analysis* – OSATE supports SAE ARP 4761 safety analysis for
   Functional Hazard Assessments (FHAs), Fault Tree Analysis (FTA),
   Failure Modes Effects Analysis (FMEA), Common Mode Analysis, and
   Reliability Block Diagrams (RBD)/Decision Diagrams (DD).
8. *Structural Model Verification* – The Resolute language for model
   checking/requirements verification is included in the current release
   of OSATE.
9. *Compositional Verification* OSATE currently uses AGREE for
   compositional verification of system and component behavior based on
   assumptions and guarantees.

Adventium Tools
---------------

Tools developed by Adventium Labs are documented at their web site:
https://www.adventiumlabs.com/our-work/products-services/model-based-engineering-mbe-tools
