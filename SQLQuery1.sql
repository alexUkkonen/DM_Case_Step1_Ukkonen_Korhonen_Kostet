-- 1. Create the Database
CREATE DATABASE GCA;
GO

-- 2. Select the Database to use
USE GCA;
GO

-- 3. Create Venue Table
CREATE TABLE Venue (
    venue_id INT IDENTITY(1,1) PRIMARY KEY,
    venue_name VARCHAR(255) NOT NULL,
    capacity INT,
    address VARCHAR(255)
);

-- 4. Create Artist Table
CREATE TABLE Artist (
    artist_id INT IDENTITY(1,1) PRIMARY KEY,
    email VARCHAR(255),
    stage_name VARCHAR(255) NOT NULL,
    catering_requests VARCHAR(MAX),
    notes VARCHAR(MAX)
);

-- 5. Create TicketStatus Table
CREATE TABLE TicketStatus (
    status_id INT IDENTITY(1,1) PRIMARY KEY,
    status VARCHAR(50) NOT NULL,
    availability BIT
);

-- 6. Create Event Table
CREATE TABLE Event (
    event_id INT IDENTITY(1,1) PRIMARY KEY,
    event_date DATETIME NOT NULL,
    event_type VARCHAR(100),
    event_description VARCHAR(MAX),
    venue_id INT NOT NULL,
    artist_id INT NOT NULL,
    status_id INT NOT NULL,
    
    CONSTRAINT FK_Event_Venue FOREIGN KEY (venue_id) 
        REFERENCES Venue(venue_id),
    CONSTRAINT FK_Event_Artist FOREIGN KEY (artist_id) 
        REFERENCES Artist(artist_id),
    CONSTRAINT FK_Event_Status FOREIGN KEY (status_id) 
        REFERENCES TicketStatus(status_id)
);

-- 7. Create Booking Table
CREATE TABLE Booking (
    booking_nr INT IDENTITY(1,1) PRIMARY KEY,
    price DECIMAL(10, 2) NOT NULL,
    event_id INT NOT NULL,
    phone_nr VARCHAR(20),
    ticket_amount INT NOT NULL,
    status_id INT NOT NULL,

    CONSTRAINT FK_Booking_Event FOREIGN KEY (event_id) 
        REFERENCES Event(event_id),
    CONSTRAINT FK_Booking_Status FOREIGN KEY (status_id) 
        REFERENCES TicketStatus(status_id)
);