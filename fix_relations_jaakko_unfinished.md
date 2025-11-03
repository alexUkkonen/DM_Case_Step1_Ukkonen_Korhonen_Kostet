# Relational Diagram – Greenwood Cultural Association (Step 1)

## Venue
**Venue(venue_id, venue_name, address, capacity)**
- PK: (venue_id)
- UNIQUE: (venue_name, address)
- CHECK: capacity > 0

## Artist
**Artist(artist_id, name, email, phone, catering_requests, notes)**
- PK: (artist_id)
- UNIQUE: (name)  -- esiintymisnimi (esim. "Taylor Swift"). Halutessa voi pitää given_name/surname erikseen.

## Event
**Event(event_id, title, event_date, event_type, event_description, venue_id, price, status, category)**
- PK: (event_id)
- FK: (venue_id) → Venue(venue_id)
- CHECK: price >= 0
- CHECK: status IN ('scheduled','cancelled')

## EventArtist  -- M:N Artist⇄Event
**EventArtist(event_id, artist_id)**
- PK: (event_id, artist_id)
- FK: (event_id) → Event(event_id)
- FK: (artist_id) → Artist(artist_id)

## Booking
**Booking(booking_nr, event_id, phone_nr, ticket_qty, status, booking_date, purchase_date, booking_code)**
- PK: (booking_nr)
- AK/UNIQUE: (booking_code) -- asiakkaille annettava koodi
- FK: (event_id) → Event(event_id)
- CHECK: ticket_qty >= 1
- CHECK: status IN ('booked','sold','cancelled')
- CHECK: ( (status='sold' AND purchase_date IS NOT NULL)
        OR (status IN ('booked','cancelled') AND purchase_date IS NULL) )

---
## Suhteet (kardinaliteetit)
- Venue **1:N** Event  (yksi venue, monta eventtiä)
- Event **M:N** Artist  (EventArtist-liitostaulu)
- Event **1:N** Booking (yhdellä eventillä monta varausta)
