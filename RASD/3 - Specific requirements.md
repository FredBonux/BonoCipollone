# 3 Specific Requirements

## 3.1 Use case diagram

TODO: insert diagram
## 3.2 Use Cases 

### CPO login 
- Actor -> CPO admin
- The CPO is registered into the system bus has to log in 
- Event flow:
    1. The admin open the web portal of the CPMS
    2. The admin taps the "LogIn" button 
    3. The admin fills up the form
    4. The system validates the data and grants access to the admin
    5. The system redirect the admin to the main page

- Exit condition:
    The admin is logged in 
- Exeptions:
    1. The form data are incomplite or not valid 
    2. The system cannot process the data

### View information about energy price 
- Actior :
    CPO admin, DSOs
- Entry condition:
    - The admin is logged in 
- Event flow:
    1. The admin taps on the "View energy prices" button 
    2. The system request to DSOs informations 
    3. The system shows the list of prices proposed by the various DSOs, also indicating the type of energy
- Exit condition:
    1. The admin goes yo another section or close the page 
- Exeptions:
    1. The system is unavaible
    2. Some or all of the DSOs are unavailable or unreachable

### CPO Change energy management settings 
- Actior :
    CPO admin 
- Entry condition:
    - The admin is logged in 
- Event flow:
    1. The amin select the charging station from the list
    2. The admin taps on the "Energy management" button
    3. The system shows a page with all the information on the current energy management
    4. The admin taps on the "Modify" button
    5. The system shows a page with all the parameters that the CPO can modify
    6. The admin modifies the parameters
    7. The admin taps on the "Save" button
- Exit condition:
    1. The admin goes yo another section or close the page 
- Exeptions:
    1. The system is unavaible
    2. Some or all of the DSOs are unavailable or unreachable

### Displays information about the internal status of a charging station
- Actior :
    CPO admin 
- Entry condition:
    - The admin is logged in 
- Event flow:
    1. The amin select the charging station from the list
    2. The admin taps on the "System monitor" button
    3. The system shows a page with all the information about the charging station status
- Exit condition:
    1. The admin goes yo another section or close the page 
- Exeptions:
    1. The system is unavaible


### Start a booked charging session
- Actior :
    eMSP, Charging point
- Entry condition:
    - The charging slot has been booked
- Event flow:
    1. The system receives the command from the eMSP
    2. The system verifies the validity of the reservation
    3. The system sends the command to the charging point
    4. The system sends the confirmation to the eMSP
- Exit condition:
    1. eMSP receive a response
- Exeptions:
    1. The charging station is unreachable
    2. The CPMS does not confirm the reservation
    3. The charging point does not confirm activation

### End a charging session
- Actor: 
    eMSP, CP 
- Entry condition:
    1. There is a active session 
- Event flow:
    1. The system receives the request to end the session from the eMSP
    2. The system sends the request to end the session to the CP
    3. The system receives the end session confirmation from the CP
    4. The system send the confirm to the eMSP
- Exit condition:
    1. eMSP receives a response
- Exeptions:
    1. The CP is unreachable
    2. The CP cannot end the session
    3. eMSP cannot receive the response

### Update the state of the charging session
- Actor: 
    eMSP, CS
- Entry condition:
    1. There is a active session 
- Event flow:
    1. The system receives information about the status of the charging session from the CP
    2. The system sends information about the status of the charging session to the eMSP
- Exit condition:
    1. eMSP receives information about the status of the charging session
- Exeptions:
    1. eMSP is unreachable
    2. The CP cannot reach the system


## 3.3 Sequence diagrams 
Here are presented the sequence diagrams for the most important use cases.Only the "success" flow is displayed, every exception in the communication flow results in an error message displayed to the log file and a request retry.




## 3.4 Functional Requirement

- The system should:
    1. Allow to book a charging session on a specific CS
    2. Allow to start a charging session on a specific CS
    3. Allow to stop a charging session on a specific CS
    4. Forward information about the state of a charging session to the eMSP
    5. Allow Login for CPO
    6. Allow to view information about the internal status of a charging station
    7. Forward of the offered tariffs 
    8. Allow CPO to set or change tariffs
    9. Allow CPO to enter static information about charging stations
    10. Forward information about the location of charging stations
    11. Forward the status of the charging session
    12. Allow CPOs to change the settings and management settings of the charging station

Mapping: 
G1 -> 1,2,3
G2 -> 1,2,3,4
G3 -> 5,6
G4 -> 5,7,8
G5 -> 9,10
G6 -> 11
G7 -> 5, 12
G8 -> 5, 12
G9 -> 5, 12



## 3.5 Performance Requirement 

As most of the Charge Points are located in the city centre, where internet connectivity is usually optimal and at high speed, the system does not have special requirements for performances related to bandwidth usage. Also, no particular usage spikes are expected at any moment, so server load should be directly connected to the number of users and Charge Points covered by the system.

## 3.6 Design Constraints 

### 3.6.1 Standard compliance 
For the legal aspect it is necessary to follow the requirements of the GDPR regarding the management of sensitive data of users and CPOs. While to allow interconnection with the different eMSPs and CPs, it is necessary to follow the OCPI and OCPP standards in the implementation of communication protocols and data structures.

## 3.6.2 Hardware limitations 
No particular hardware are required to use the System


## 3.7  Non-functional Requirements
- NFR1:
    - Reliability impacts the system usage and the related business, to keep it as high as possible, fall back servers shall be considered while designing the infrastructure.
- NFR2:
    - Availability also has a huge impact but as this is not a sensible service that needs to be up and running at all time, a good compromise with cost effectiveness can be considered.
- NFR3:
    - The basic security standard "de-facto" measurements should be followed, SSL and HTTPS should be enough to offer both security and ease to use.

## 3.8 EXTERNAL INTERFACE REQUIREMNTS 

### 3.8.1 User Interfaces 
?????????????????????????

### 3.8.2 hardware interfaces 
Non ci sono hardware interfaces 

### 3.8.3 Communication interfaces 

- As the system needs to communicate with multiple actors, the following communication interfaces are required:
    1. eMSP communication:
    > To share data with the various eMSPs, an active, low-latency internet connection is needed. Also is required that the eMSP follows the OCPI protocol.
    2. CS communication:
    > To share data with the various CPs, an active, low-latency internet connection is needed. Also is required that the eMSP follows the OCPp protocol.


