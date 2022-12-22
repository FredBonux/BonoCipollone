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
    4. The system validates the data and grants access to the user 
    5. The system redirect the admin to the main page

- Exit condition:
    The admin is logged in 
- Exeptions:
    1. The form data are incomplite or not valid 
    2. The system cannot process the data

### View information about energy price 
- Actior :
    CPO admin 
- Entry condition:
    - The admin is logged in 
- Event flow:
    1. The admin taps on the "View energy prices" button 
    2. The system shows the list of prices proposed by the various DSOs, also indicating the type of energy
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

### Start a charging session


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
    1. The charging session has started
    2. The charging session has been denied
- Exeptions:
    1. The charging station is unreachable
    2. The CPMS does not confirm the reservation
    3. The charging point does not confirm activation







## 3.3 Sequence diagrams 
Here are presented the sequence diagrams for the most important use cases.


    