Venue(venue_id, venue_name, address, capacity)
FD:t: venue_id → venue_name,address,capacity; (venue_name,address) vaihtoehtoinen luonnollinen avain.
BCNF: OK.

Artist(artist_id, name, email, phone, catering_requests, notes)
FD:t: artist_id → …; (name) UNIQUE -> name → artist_id.
BCNF: OK.

Event(event_id, title, event_date, event_type, event_description, venue_id, price, status, category)
FD:t: event_id → … (kaikki muut).
BCNF: OK.

EventArtist(event_id, artist_id)
FD:t: (event_id,artist_id) → (—) (vain avain).
BCNF: OK.

Booking(booking_nr, booking_code, event_id, phone_nr, ticket_qty, status, booking_date, purchase_date)
FD:t: booking_nr → …; booking_code → … (UNIQUE).
BCNF: OK.