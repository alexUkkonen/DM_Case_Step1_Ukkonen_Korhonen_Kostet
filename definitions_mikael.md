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

Many-to-many relationship with Venue & Artist.
One-to-one relationship with Booking & Ticket.

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

Many-to-many relationship with Event through artist_id column.
