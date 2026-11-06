# Blood Donation Management System cental

## Overview
The Blood Donation Management System is a comprehensive web application built with Spring Boot and **Java 21**. It serves as a centralized platform to connect blood donors, blood requesters, hospitals, and administrators. The system facilitates the efficient management of blood donations, blood requests, inventory tracking, and user notifications this is centralized system.

## Tech Stack
- **Backend:** Java 21, Spring Boot 3.2.4
- **Modules:** 
  - Spring Web (MVC)
  - Spring Data JPA (Hibernate)
  - Spring Security (Authentication & Authorization)
  - Spring Boot Mail (Email Notifications)
  - Spring Validation
- **Database:** MySQL
- **Frontend:** JSP (JavaServer Pages), JSTL, Bootstrap 5, FontAwesome
- **Build Tool:** Maven

## User Roles & Feature

### 1. Admin module
- Dashboard with overall system statistics.
- Manage users (Donors, Requesters, Hospitals).
- Approve or reject hospital registrations.
- Oversee all donation and blood requests.
- View audit logs and system notifications.

### 2. Blood Donor 
- Register and maintain a personal profile (Blood Group, Age, Weight, Contact Info).
- Submit blood donation requests.
- View donation history and status (Pending, Approved, Completed).
- Receive email notifications for donation schedules.

### 3. Blood Requester
- Register and maintain a profile.
- Submit blood requests (specifying Blood Group, Units required, and Urgency).
- Track the status of blood requests.
- Receive updates when blood is arranged.

### 4. Hospital
- Register as an authorized hospital (Requires Admin Approval).
- Manage blood inventory.
- Process and fulfill blood requests assigned to them.
- Facilitate blood donations from donors assigned to their hospital.

## System Entities & Architecture
- **Users & Auth:** `User`, `Role` (Handles Spring Security auth).
- **Profiles:** `Donor`, `Requester`, `Hospital` (Linked to User).
- **Core Domain:** 
  - `BloodRequest`: Tracks requests made by patients/requesters.
  - `DonationRequest`: Tracks intent to donate by donors.
  - `BloodInventory`: Tracks available blood units per hospital.
  - `BloodGroup`: Enum for blood types (A+, O-, etc.).
- **System Utilities:** `AuditLog`, `Notification`.

## Setup & Installation

### Prerequisites
- Java Development Kit (JDK) 21
- Maven
- MySQL Server (Port 3306)

### Configuration
Update the `src/main/resources/application.properties` file with your database and email credentials:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/blood_donation_db?createDatabaseIfNotExist=true
spring.datasource.username=root
spring.datasource.password=your_password

# Email config
spring.mail.username=your_email@gmail.com
spring.mail.password=your_app_password
```

### Running the Application
To compile and run the application via Maven:
```bash
mvn clean install
mvn spring-boot:run
```
The application will start on `http://localhost:8083` (or the port specified in `application.properties`).

## Security
The application uses Spring Security for role-based access control (RBAC). 
- Public endpoints: `/`, `/login`, `/register`
- Secured endpoints: `/admin/**`, `/donor/**`, `/requester/**`, `/hospital/**`

Passwords are encrypted before saving to the database, and session management is handled automatically by Spring Security.
