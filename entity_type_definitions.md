### Booking
Description: 

Collection of tickets booked. Once ticekts are booked corresponding amount is reduced from slots.

Attributes:

* booking_nr (Primary key)
* price
* event_id (Foreign key)
* phone_nr
* status
* availability
* ticekt_amount

Relationship:

Booking is in  a **N:1** relationship with Event

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
* slots (FK)

Relationship:

Event is in a **N:M** relationship with Venue & Artist and **1:1** relationship with Booking & Ticket.

Event **N:1** Venue

Event **N:M** Artist

Event **1:N** Booking

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
