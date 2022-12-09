# Introduction
### Effort: 1h + 1.5h

## 1.1 Purpose
The purpose of this document is to analyze and define the objectives and requirements of the Charging Point Management System (CPMS), the IT structure capable of managing a car charging station.

### 1.1.1 Goals
G2 - Allow eMSPs to have information about the position of the charging stations
G1 - Allow eMSPs to have information about the status of the charging stations
G3 - Allow eMSPs to have information about the current energy price
G4 - Allow eMSPs to have information about every charging process 
G5 - Allow eMSPs to book a charge session 
G6 - Allow CPOs to have information about the status of the charging station
G7 - Allow CPOs to have information about the current energy price of each DSO
G8 - Allow CPOs to manually decide the current energy price
G9 - Allow CPOs to manually decide from witch DSO acquire energy 
G10 - Allow CPOs to manually decide whether to use or store energy inside batteries
G11 - Allow users to start and end a charging sesssion

## 1.2 Scope 

This IT structure is part of the e-Charging ecosystem, able to offer support to users during their charging planning process. This must be able to provide all the information about the charging point through an interface with the different eMSPs. Each CPMS is managed by charging point operators (CPOs) who must be able to modify the behavior of the system. It must also manage the interaction with the various Distribution System Operators (DSO), managing to dynamically select the optimal source of energy to use.
To interface with the rest of the ecosystem, the following protocols are used:
- towards e-Mobility Service Providers (eMSPs) [OCPI (Open Charge Point Interface) protocol](../Specs/OCPI-2.2.1.pdf) 
- between a Charge Point and Central System [OCP (Open Charge Point ) protocol](../Specs/ocpp-1.6.pdf.pdf) 


### 1.2.1 World Phenomena 

User side
WP1 - User decides to charge the electric vehicle
WP2 - User goes to the Charging Point
WP3 - User connects the Electric vehicle to the Charging Slot
WP4 - User disconnects the Electric Vehicle from the Charging Slot

Charging Point side
WP5 - Charging Point starts to provide energy to the Electric Vehicle of the User
WP6 - Charging Point ends to provide energy to the Electric Vehicle of the User
WP7 - CPO starts the maintenence of a Charging Slot
WP8 - CPO completes the maintenence of a Charging Slot

CPO side 
WP9 - CPO decides to check the status and diagnostic information of their charging station
WP10 - CPO decides to set up an energy management policy
WP11 - CPO decides to change the price of the energy sold
WP12 - CPO wants to see prices regarding the prices of the various energy suppliers


### 1.2.2 Shared Phenomena
Since there is no direct interaction with users, their actions with the CPMS take place through the eMSPs.

eMSPs side shared phenomena
SP1 - eMSPs request information about the location of the charging point
SP2 - eMSPs receive information sent by CPMS about the dynamic information of the charging point 
SP3 - eMSPs books a charging session 
SP4 - EMSPS receive information sent by CPMS about the status of the charging session

Charging point side shared phenomena
SP5 - System prepares an EVSE to be used
SP6 - EVSE sends information about the charging status
SP7 - System authenticate the charging session
SP8 - EVSE communicates diagnostic information about its status

CPO side shared phenomena
SP9 - CPO decides to check the status and diagnostic information of their charging station
SP10 - System notifies the CPO of a component malfunction
SP11 - CPO login into the system and change the energy management settings
SP12 - CPO login into the system and change the energy price
SP13 - CPO login into the system and view the information regarding the prices of the various energy suppliers


## 1.3 Definitions, Acronyms, Abbreviation

### 1.3.1 Definitions




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
2. [OCP (Open Charge Point ) protocol](../Specs/ocpp-1.6.pdf.pdf) 

## 1.4 Document structure
