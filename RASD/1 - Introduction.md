# Introduction
### Effort: 1h + 1.5h

## 1.1 Purpose
The purpose of this document is to analyze and define the goals and requirements of the Charging Point Management System (CPMS), the IT structure capable of managing a car charging station.

### 1.1.1 Goals
G1 - Allow eMSP to start and end a charging session
G2 - Allow eMSP to be notified when the charging process is completed
G3 - Allow CPO to have information about the internal status of a charging station
G4 - Allow eMSPs to have information about the current tariffs
G5 - Allow eMSPs to have information about the position of the charging stations
G6 - Allow eMSPs to have information about the status of the car charging process 
G7 - Allow CPOs to manually decide the current energy price
G8 - Allow CPOs to manually decide from witch DSO acquire energy 
G9 - Allow CPOs to manually decide whether to use or store energy inside batteries


## 1.2 Scope 

Each charging station managed by the Charging Point Operators (CPO) has an IT infrastructure called Charge Point Management System (CPMS). Through this application, administrators are able to manage the various charging stations such as the selection of the DSO and the use of the batteries present in the stations. The CPMS must be able to manage the station,deciding independently the most optimal energy management policy. The CPMS is able to connect the charging station with the rest of the e-Charging ecosystem, allowing an interaction with the user and with the various energy suppliers (Distribution System Operators (DSO)).


To interface with the rest of the ecosystem, the following protocols are used:
- towards e-Mobility Service Providers (eMSPs) [OCPI (Open Charge Point Interface) protocol](../Specs/OCPI-2.2.1.pdf) 
- between a Charge Point and Central System [OCP (Open Charge Point ) protocol](../Specs/ocpp-1.6.pdf.pdf) 


### 1.2.1 World Phenomena 

User side
- WP1 - User decides to charge the electric vehicle
- WP2 - User goes to the Charging Point
- WP3 - User connects the Electric vehicle to the Charging Slot
- WP4 - User disconnects the Electric Vehicle from the Charging Slot

Charging Point side
- WP5 - Charging Point starts to provide energy to the Electric Vehicle of the User
- WP6 - Charging Point ends to provide energy to the Electric Vehicle of the User
- WP7 - CPO starts the maintenence of a Charging Slot
- WP8 - CPO completes the maintenence of a Charging Slot
- WP9 - CPO decides to check view the internal status of a charging station
- WP10 - CPO decides to set up an energy management policy
- WP11 - CPO decides to change the price of the energy sold
- WP13 - CPO decide from whitch DSO acquire energy
- WP14 - DSO provide energy to the charging station        

### 1.2.2 Shared Phenomena
Since there is no direct interaction with users, their actions with the CPMS take place through the eMSPs.

eMSPs side shared phenomena
SP1 - eMSPs request information about the charging points
SP2 - eMSPs books a charging session 
SP3 - eMSPs receives information about the state of charge of the car

Charging point side shared phenomena
SP4 - System authenticate the charging session
SP5 - The system activates a charging socket of an charging slot, making it available
SP6 - The system deactivates a charging socket of an charging slot
SP7 - charging slot sends to the system information about the charging status of the car
SP8 - charging slot communicates diagnostic information to the system

CPO side shared phenomena

SP9 - The system shows the current energy management settings to the CPO
SP10 - CPO login into the system and change the energy management settings
SP11 - CPO login into the system and change the energy price
SP12 - CPO login into the system and view information about the internal status of the system
SP13 - System notifies the CPO of a component malfunction


## 1.3 Definitions, Acronyms, Abbreviation

### 1.3.1 Definitions
| Definition | Description |
| :---: | :---: |
| Internal status | Information on : amount of energy available in its batteries, if any,  number  of  vehicles  being  charged  and,  for  each  charging  vehicle,  amount  of  power absorbed and time left to the end of the charge |
| External status | Information on : number of charging sockets available, their type such as slow/fast/rapid, their cost, and, if all sockets of a certain type are occupied, the estimated amount of time until the first socket of that type is freed|
|Cahrging slot| Charging column which is able to recharge electric vehicles using charging sockets




### 1.3.2 Acronyms
| Abbreviation | Description |
| :---: | :---: |
|eMSP | eMobility Service Provider |
|CP | Charge Point / Charging Point |
|CPO | Charging Point Operator 
|CPMS | Charging Point Management System
|OCPI | Open Charge Point Interface
|DSO| Distribution Management System 
|EV | Electric Vehicle

## 1.4 Revision history
- The specification document " <NOME_FILE>"
## 1.5 Related documents
1. [OCPI specifications document](../Specs/OCPI-2.2.1.pdf)
2. [OCP (Open Charge Point ) protocol](../Specs/ocpp-1.6.pdf.pdf) 

## 1.4 Document structure
