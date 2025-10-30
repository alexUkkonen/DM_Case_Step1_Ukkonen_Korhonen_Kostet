
### Ticket
Description: 

An individual slot that counts towards max capacity

Attributes:

* ticket_id (Primary key)
* price
* event_id (Foreign key)
* availability

Relationship:

Tickets are linked to events in a **N:1** relationship and linked to booking in a **N:1** relationship.

Tickets **N:1** Event

Ticekts **N:1** Booking

### Booking
Description: 

A collection of selected tickets. Once booked tickets with a corresponding ID are no longer availible.

Attributes:

* booking_nr (Primary key)
* price
* event_id (Foreign key)
* phone_nr
* status
* ticket_id (FK)

Relationship:

Booking is in a **1:N** relationship with Tickets and a **N:1** relationship with Event

Booking **1:N** Ticket

Booking **N:1** Event

### Event
Description: 

Performance that takes place in a venue.

Attributes:

* event_id (PK)
* event_date
* event_type
* event_description
* venue_id (FK)
* artist_id (FK)

Relationship:

Event is in a **N:M** relationship with Venue & Artist and **1:1** relationship with Booking & Ticket.

Event **N:M** Venue

Event **N:M** Artist

Event **1:1** Booking

Event **1:1** Ticket

### Venue
Description: 

The location where an event takes place.

Attributes:

* venue_id (Primary Key)
* vanue_name
* capacity
* address

Relationship:

Venue is in a **1:N** relationship with Event

Venue **1:N** Event

### Artist
Description: 

Solo or group performer 

Attributes:

* artist_id (PK)
* email
* given_name
* surname
* catering_requests
* notes

Relationship:

Artist is in **N:M** relationship with Event.

Artist **N:M** Event
