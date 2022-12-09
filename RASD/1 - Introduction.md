# Introduction
### Effort: 1h + 1.5h

## 1.1 Purpose
The purpose of this document is to analyze and define the goals and requirements to later design, on behalf of the e-Mobility Service Providers (eMSPs), the infrastructure for the eMall App.

### 1.1.1 Goals
G1 - Allow users to find charging station nearby and their tariffs
G2 - Allow users to book a charge session in one of the Charging Point
G3 - Allow users to authenticate to the Charge Point and start the charging session
G4 - Allow users to check the status of an active charging session
G5 - Allow users to be notified when the charging process is completed
G6 - Allow users to pay for the charging session

## 1.2 Scope 

Electric mobility (e-Mobility) is a way to limit the carbon footprint caused by our urban and sub-urban mobility needs. When using an electric vehicle, knowing where to charge the vehicle and carefully planning the charging process in such a way that it introduces minimal interference and constraints on our daily schedule is of paramount importance.

eMall App is a platform that helps the end users to plan the charging process, by getting information about Charging Points nearby, their costs and any special offer; book a charge in a specific station, control the charging process and get notified when the charge is completed. It also handles payments for the service.

In the e-Charging ecosystem, there are many different actors involved that we need to keep into consideration while collecting requirements and designing the system. The first information to consider is that Charging Points are owned and managed by Charging Point Operators (CPOs) and each CPO has its own IT infrastructure, managed via a Charge Point Management System (CPMS). 
In order to comunicate with each actor, the [OCPI (Open Charge Point Interface) protocol](../Specs/OCPI-2.2.1.pdf) is used. 

### 1.2.1 World Phenomena 
As this system will act as a middleman between the users and the various Charging Point CPMSs, we thought that splitting the phenomena between "user side" and "CPMS side" can help to better understand.

User side
WP1 - User decides to charge the electric vehicle
WP2 - User goes to the Charging Point
WP3 - User connects the Electric vehicle to the Charging Slot
WP4 - User disconnects the Electric Vehicle from the Charging Slot

CPMS side
WP5 - Charging Point starts to provide energy to the Electric Vehicle of the User
WP6 - Charging Point ends to provide energy to the Electric Vehicle of the User
WP7 - CPO starts the maintenence of a Charging Slot
WP8 - CPO completes the maintenence of a Charging Slot

Payment Provider side
WP9 - Payment provider charges the payment methods registered by the user


### 1.2.2 Shared Phenomena
User side shared phenomena
SP1 - User registers an account
SP2 - User verifies the email for his account
SP3 - User add payments information for his account
SP4 - System shows the nearby available charging points to the user
SP5 - User books a charging session through the system
SP6 - System send information about a charging session to the User
SP7 - User starts the charging session through the system

CPMS side shared phenomena
SP8 - System books the charging session for the user via the CPMS
SP9 - CPMS send to the System the charging session details
SP10 - System authenticate the charging session for the CPMS

Payment Provider side shared phenomena
SP11 - System send cost information to the Payment Provider to charge the User
SP12 - Payment Provider send to the system the payment process details (eg. status)

## 1.3 Definitions, Acronyms, Abbreviation

### 1.3.1 Definitions
Charging Point - Physical structure composed by multiple Charging Slots
Charging slot - Physical device with multiple Charging plugs that can charge electric vehicles
Charging plug - Physical connector that allow to transfer energy between the Charging station and the connected vehicle
Maintenence of a charging slot - Activity/activities that results in a momentary unavailability of the charging slot
Payment information - information required by the payment provider to be able to charge the user for the service (e.g. credit card number)
Charging session - period of time when the vehicle is connected to a charging plug for charging
Booking period - period of time between the booking of a charging session and the beginning of the charging session
Guest / Guest User - Unregistered user
User / Enabled User / Active User - Registered user with confirmed email and payment method
Unconfirmed User - Registered user without confirmed email
Pending User - Registered user with confirmed email but no payment method set up

Payment Service Provider - External service that provides API to process payments

### 1.3.2 Acronyms
eMSP & e Mobility Service Provider\\
CP & Charge Point / Charging Point\\
CPO & Charging Point Operator\\
CPMS & Charging Point Management System\\
OCPI & Open Charge Point Interface\\
EV & Electric Vehicle\\

## 1.4 Revision history
## 1.5 Related documents
1. [OCPI specifications document](../Specs/OCPI-2.2.1.pdf)

## 1.4 Document structure

TODO: Review this part

This document is composed of six sections, detailed below.

In the first section the problem is introduced together with the associated goals of the project. Additionally the scope of the project is specified along with the various phenomena occurring. Lastly, the necessary information to read the report is presented, such as definitions and abbreviations.

Section two contains an overall description of the system, including a detailing of its users and main functions. Moreover there is the class diagram, descriptions of several scenarios, some statecharts and finally the domain assumptions made in this report.

In section three the requirements on the system is specified. This includes functional requirements, non-functional requirements and requirements on external interfaces. Furthermore use cases are described, with accompanying use case and sequence diagrams. Section three also contains mappings of functional requirements to the goals of the system, and to the use cases.

Section four contains a formal analysis with the help of Alloy. Together with the Alloy code, the analysis objective is described.

In section five there is a presentation of the project members total effort spent.

Section six contains the references used.

