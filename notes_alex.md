
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
