# Introduction
### Effort: 1h + 1h

## 1.1 Purpose
Electric mobility (e-Mobility) is a way to limit the carbon footprint caused by our urban and sub-urban mobility needs. When using an electric vehicle, knowing where to charge the vehicle and carefully planning the charging process in such a way that it introduces minimal interference and constraints on our daily schedule is of paramount importance.

The purpose of this document is to analyze and define the goals and requirements to later design, on behalf of the e-Mobility Service Providers (eMSPs), the infrastructure for a platform that helps the end users to plan the charging process, by getting information about charging stations nearby, their costs and any special offer; book a charge in a specific station, control the charging process and get notified when the charge is completed. Finally, the service providers would like to enable digital payments for the service via the same system.

In the e-Charging ecosystem, there are many different actors involved that we need to keep into consideration while collecting requirements and designing the system. The first information to consider is that Charging stations are owned and managed by Charging Point Operators (CPOs) and each CPO has its own IT infrastructure, managed via a Charge Point Management System (CPMS). 
In order to comunicate with each actor, the [OCPI (Open Charge Point Interface) protocol](../Specs/OCPI-2.2.1.pdf) is used. 

### 1.1.1 Goals
G1 - Allow users to find charging station nearby and their tarrifs
G2 - Allow users to book a charge session in one of the stations
G3 - Allow users to authenticate to the Charge Point and start the charging session
G4 - Allow users to check the status of an active charging session
G5 - Allow users to be notified when the charging process is completed
G6 - Allow users to pay for the charging session

## 1.2 Scope 
## 1.2.1 World Phenomena 
User side World
WP1 - User decides to charge the electric vehicle
WP2 - User goes to the Charging Point
WP3 - User connects the Electric vehicle to the Charging Slot
WP4 - User disconnects the Electric Vehicle from the Charging Slot

CPMS side World
WP5 - Charging Point starts to provide energy to the Electric Vehicle of the User
WP6 - Charging Point ends to provide energy to the Electric Vehicle of the User
WP7 - CPO completes the maintenence of a Charging Slot


## 1.2.2 Shared Phenomena
User side shared phenomena
SP1 - User registers an account
SP2 - User verifies the email for his account
SP3 - User add payments information for his account
SP4 - System shows the nearby available stations to the user
SP5 - User books a charging session through the system
SP6 - System send information about a charging session to the User

CPMS side shared phenomena
SP7 - System books the charging session from the CPMS
SP8 - CPMS send to the System the charging session details
SP9 - System authenticate the charging session for the CPMS

Payment Provider side shared phenomena
SP10 - System send cost information to the Payment Provider to charge the User
SP11 - Payment Provider send to the system the payment process details (eg. status)
