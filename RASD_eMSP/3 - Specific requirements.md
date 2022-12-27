# 3 Specific Requirements

## 3.1 Use case diagrams
TODO: insert here

## 3.2 Use cases

### 3.2.1 

## 3.3 Functional requirements
TODO: insert here

## 3.4 External Interface Requirements

### 3.4.1 User Interfaces
The user interface for the eMSP system is a mobile application available for both iOS and Android devices.
As this will be a publicly available application, accessibility should be considered a priority when designing the interface.

### 3.4.2 Hardware interfaces
The only hardware required to use the system is a Smartphone running iOS or Android OS, with internet connection capabilities and GPS functionalities.

### 3.4.3 Communication interfaces
As the system needs to communicate with multiple actors, the following communication interfaces are required:

1. CPMS communication: To share data with the various CPMS, an active, low-latency internet connection is needed.
   Also is required that the CPMS follows the OCPI protocol.
   To follow the OCPI protocol, our system is required to expose a "PUSH interface" (e.g. an API endpoint that follows the protocol structure) that enables the CPMS to send newer data in real-time.

2. Payment Service Providers: To process payments a connection with a Payment Service Provider is needed. This connection happens via propertary API, so custom components are required to connect different providers.

## 3.5 Requirements Mapping
TODO: insert here
