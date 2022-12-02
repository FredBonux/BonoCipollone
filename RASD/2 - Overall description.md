# 2.1 - Product perspective
Effort: 1h + 1h per class_diagram on lucid chart + 1h

## 2.1.1 - Scenarios

### 1. User wants to start using the platform
Bob has bought a new electric car and wants to start using the eMall network to charge it.
Bob goes to the app store to download the official application, opens it and taps on the "Signup" button to initiate the user registration flow. He enters all the necessary information
and, after submitting the form, he's granted access to the system.

### 2. User wants to check for charging station availabilities
Bob wants to charge his car, he opens the eMall app and, using the integrated map view
starts looking for a nearby charging station. After tapping on one of the available Charging Points,
the application displays the status of the station, the available charging docks and their connectors
as well as the price rates applied.

### 3. User wants to book a charge for a certain time frame 
Bob opens the app, searches for an available station and, after opening the station details, he taps on the "book" button to start the booking process.
The application asks for a time frame and a connector type, and after checking for availability, it books the connector and returns the booking reference to Bob.

### 4. User wants to start a charge at the station
Bob goes to a station and wants to start charging his vehicle, with a booking for that time frame, 
he simply needs to park the car in the correct spot, connect it with the correct plug and enable the charge
flow via the app. Without a booking, he needs to look for an available spot via the app and start a booking
process for it.

### 5. User wants to be notified at the end of the charge
Bob started the charging process a couple of hours ago for a 2 hours time frame. The system checks the booking time-frame and sends a notification to Bob's smartphone with the details of the charging process (e.g. cost and battery status)

### 6. User wants to pay for the service
Bob goes to retrieve his car from the station, he uses the app to complete the charging process and the system automatically
bills his credit card / Paypal account with the required amount.


## 2.1.2 - Class diagram

TODO: insert diagram

## 2.2 - Product functions

Basic requirement: as the system acts as a middleware between the user and the Charging Point, a structured communication protocol is needed. This system will be design to communicate using the Open Charge Point Interface (OCPI) standard. 

Pricing requirement: as OCPI enables a very complex pricing system, to keep the scope of the project simple, the system will set a per-KW price based on the pricing of the various charing point. The prices are automatially synced with the prices of the CP

### 2.2.1 Nearby charging points overview
The users want to quickly find nearby charging points and see their status, the available slots, their connectors and the tariffs, this will allow them to decide where to charge their vehicles.
To achieve this, the system should act as an aggregator for multiple CPMS, collect the data in real-time and display all the information on a map.

### 2.2.2 Booking a charging slot
When a user has decided where to charge his vehicle, he can use the same system to book the slot for a specific time frame.
As for the OCPI standard booking is managed by the CPMS, the system will need to require booking confirmation from the CPMS.

### 2.2.3 Unlocking a charging slot and starting a charge session
When a user arrives at the charging station he can use the app to review the booking details and check to which slot to connect the vehicle. He connects the car via the correct plug provided by the charging station and, afterward, he uses the app to authenticate into the system and start charging. Even if OCPI standard allows for other types of session initialization, our system will not deal with them.

### 2.2.4 Checking the status of the charge session
After initiating the charge the user will be able to view the status of the session (charge level and estimated time remaining) from the app.
The system automatically retrieves the needed information from the CPMS and eventually notifies the user about any problem that can occur (e.g. charge session is interupted by the Charge Point)

### 2.2.5 Completing the charge session and paying for the service
A user can complete the charge session when the booked time frame is passed or even before the end of the charge. 
To complete a charge session the user can use the app to stop the charging process and detach the plug from the vehicle.
As stated above, the payment request is automatically triggered and the payment service provider will charge the user the right amount and send the invoice via email.


## 2.3 User characteristics
For the scope of the document, we can identify a single actor / user type for the eMall system, but to allow us to better define some details later on, we've split the user
based on his possible states

### 1. Unregistered user / guest
A person who is not already registered to the system

### 2. Registered user waiting for email verification
A person who is registered to the system but has yet to confirm the email address used in the signup form.

### 3. Registered user waiting for payment method registration
A person who is registered to the system, has his email verified but needs to add a payment method to start using the app.

### 4. eMall active user
A person who is registered to the system, has a verified email address and an active and valid payment method. Payment method verification is handled by the Payment Service Provider.

### 5. eMall disabled user
An active user that has been flagged for deactivation by the system admin. Could be for security reasons, for direct request from the customer or for terms of service violation.


## 2.4 Assumptions, dependencies and constraints

### 2.4.1 Assumptions
D1 - There is a system admin that does the initial setup of the system and manages it
D2 - The system admin adds the necessary information about charging point, slots and CPMS to the database
D3 - Users accept the contract and terms of service when signing up into the system
