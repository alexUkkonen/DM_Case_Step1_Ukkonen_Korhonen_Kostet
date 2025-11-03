Primary & Foreign Keys

* Event.venue_id → Venue.venue_id

* EventArtist.event_id → Event.event_id, EventArtist.artist_id → Artist.artist_id

* Booking.event_id → Event.event_id

UNIQUE

* Venue(venue_name, address)

* Artist(name)

* Booking(booking_code)