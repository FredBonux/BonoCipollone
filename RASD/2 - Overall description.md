# 2.1 - Product perspective
Effort: 

## 2.1.1 - Scenarios 

### 1. User wants to start a charge at the station
Bob goes to a station and wants to start charging his vehicle, with a booking for that time frame, 
he simply needs to park the car in the correct spot, connect it with the correct plug and enable the charge
flow via the app. Without a booking, he needs to look for an available spot via the app and start a booking
process for it.

Mando un messaggio a eMSP del comletamento della carica 

### 2. CPO wants to change the price of the energy sold
Alice is the administrator of a charging station and has decided to increase the price of energy. Alice opens the internet portal of her CPMS via a browser. By entering the credentials, Alice accesses the interface concerning the proposed price. After a careful analysis, Alice changes the price and presses the "Save Changes" button.

### 3. CPO wants to disable a charging socket to perform maintenance
Fabio is a maintenance technician at a charging station and has to carry out routine checks on the correct functioning of a charging socket. Fabio opens the internet portal of her CPMS via a browser. By entering the credentials, Fabio accesses the booking interface. Fabio selects an available time slot and presses the "Maintenance" button.

TODO: Insert scenarios from eMSPs point of view

## 2.1.2 - Class diagram

TODO: insert diagram

## 2.2 - Product functions

In this section the main functionalities of the CPMS is presented and described in more detail.
- As OCPI enables a very complex pricing system, to keep the scope of the project simple, the system will use only the per-KW price (also called energy based price), with differentiation between fast charging and non-fast charging. Time limited promotions are also allowed.
The prices are synced by the CPMSs via the PUSH interface defined in the OCPI protocol. (i.e. at any time, each CPMS can define only two active prices: standard and fast-charging)

- Another limitation that we need to impose to reduce the complexity is the various connector types. We define only two generic types of connector: standard and fast-charging, each type has its own pricing defined by the CPMS.

### 2.2.1 Dynamically decide the energy source to use
The dynamic management of the needed energy resources is one of the CPMS's main responsibilities. It should also be able to dynamically decide from which DSO to acquire energy based on the current price and energy source mix, and decide whether to store or use energy from the station's batteries. 

### 2.2.2 Communicate information to the various eMSPs
The system must be able to communicate via the OCPI protocol with the various eMSPs that make port on the network. Through this protocol, the two actors will be able to communicate information such as: position of the charging stations managed by the CPO, rates offered, availability for reservations, type of charging available. 

### 2.2.3 CPOs, station monitoring and management
It must be possible to monitor and display information such as: tariffs offered, current cost of energy purchased from DSOs, battery status, reservation shedules. Furthermore, the admin must be able, through a dedicated portal, to make changes and decisions on the management of the station.

### 2.2.4 Manage the reservations shedule
The system should be able to manage and keep track of the reservations that are made by the various eMSPs. The system must be able to handle the modification, if possible, or cancellation of reservations.

### 2.2.5 Interaction with DSOs
The system must be able to communicate with the various Distribution Management Systems (DSOs). The system must be able to request information such as: energy price, energy type. It must also be able to request connection and supply of energy from each DSO.

### 2.2.6 Communication with the charging slots
The system should be able to communicate with the charging slots present in each charging point. communication must take place via the OCPP protocol. The exchange of information such as: diagnostic data, charging status, activation of the charging socket must take place through this protocol.


## 2.3 User characteristics

We can identify a CPO administrator as the only user of the CPMS system. For the purpose of the project we assume that situations in which the CPO administrator is not present or registered are not allowed.

1. CPO Administrators
> The CPO will utilize the CPMS to oversee their charging stations and manually address tasks such as selecting which DSO to obtain energy from or establishing special offers for charging stations. 
2. Maintainer
>A person responsible for maintaining and repairing all parts of the charging station.

## 2.4 Assumptions, dependencies and constraints

D1 - There is a system admin that does the initial setup of the system and manages it 
D2 - The system admin adds the necessary information about charging point, slots to the database 
D3 - DSOs are connected and entered into the system by the admin during the initial set up
D4 - Users always complite their booked charging session

