### Booking
Description: 

Collection of tickets booked. ```SUM(ticket_amount) GROUP BY Event``` is compared to capacity.

Attributes:

* booking_nr (PK)
* price
* event_id (FK)
* phone_nr
* status
* availability
* ticekt_amount
* status_id (FK)

Relationship:

Booking is in  a **N:1** relationship with Event and a **N:1** relationship with TicketStatus

Booking **1:N** Event

Booking **N:1** Event

### TicketStatus
Description: 

The status and availability of tickets for any given event.

Attributes:

* status_id (PK)
* status
* availability

Relationship:

TicketStatus is in a **1:N** relationship with Booking and a **N:1** relationship with Event

TicketStatus **1:N** Booking

TicketStatus **N:1** Event

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

Event is in a **N:M** relationship with Venue & Artist and a **1:N**¨relationship with TicketStatus and **1:1** relationship with Booking & Ticket.

Event **N:1** Venue

Event **N:M** Artist

Event **1:N** Booking

Event **1:N** TicketStatus

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
* stage_name
* catering_requests
* notes

Relationship:

Artist is in **N:M** relationship with Event.

Artist **N:M** Event
