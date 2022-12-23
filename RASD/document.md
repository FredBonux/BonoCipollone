## 1.1 Purpose

Electric mobility (e-Mobility) is a way to limit the carbon footprint caused by our urban and sub-urban mobility needs. When using an electric vehicle, knowing where to charge the vehicle and carefully planning the charging process in such a way that it introduces minimal interference and constraints on our daily schedule is of paramount importance.

The purpose of this document is to analyze and define the goals and requirements to later design, on behalf of the e-Mobility Service Providers (eMSPs), the infrastructure for a platform that helps the end users to plan the charging process, by getting information about charging stations nearby, their costs and any special offer; book a charge in a specific station for a certain timeframe, control the charging process and get notified when the charge is completed. Finally, the service providers would like to enable digital payments for the service via the same system.

In the e-Charging ecosystem, there are many different actors involved that we need to keep into consideration while collecting requirements and designing the system. The first information to consider is that Charging stations are owned and managed by Chargin Point Operators (CPOs) and each CPO has its own IT infrastructure, managed via a Charge Point Management System (CPMS). Then, every CPMS handles the acquisition of energy from the Distribution System Operators (DSOs), distributes it to each connected vehicle and makes decisions on the amount of energy to be used for each connected vehicle. 
The CPO can dynamically decide from which DSO to acquire energy based on price and/or energy source, and, as a consequence, decide the pricing for charging and set special offers and discount rates.
Some charging stations can have batteries available to store energy acquired from DSOs and the CPOs of those stations can decide whether to use or not them.

All these decisions can be handled both by humans and by the CPMSs.

### 1.1.1 Goals 
| **Goal** | **Description** |
| :---:   | :---: | 
|G1| Allow users to know about the charging stations nearby, their cost, any special offer they have|
|G2| Allow users to book a charge in a specific charging station for a certain timeframe |
|G3| Allow users to start the charging process at a certain station |
|G4| Allow users to pay the service|


## 1.2 Scope 
While there are several actiors to considerm we will focus on eMSP(e-Mobility Service Providers) and CPMS(Charge Point Management System). Any eMSP can interact with multiple CPMSs, each one owned by different CPO (Charging Point Operators).

### 1.2.1 World Phenomena 
| Identifier | Description |
| :---:   | :---: | 
| WP1 | The user need to charge the electric vehicle |
| WP2 | CPOs want to sell energy |
| WP3 | ... |

### 1.2.2 Shered Phenomena 
| Identifier | Description |
| :---:   | :---: | 


