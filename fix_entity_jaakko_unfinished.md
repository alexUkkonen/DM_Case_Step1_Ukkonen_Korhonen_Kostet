fix entity

# Entity Type Definitions – Greenwood Cultural Association

## Venue
**Description:** Event location and capacity.
**Attributes:**
- venue_id (PK)
- venue_name (NOT NULL)
- address (NOT NULL)
- capacity (INT, > 0)
**Constraints:** UNIQUE(venue_name, address), CHECK(capacity > 0)
**Relationships:** Venue **1:N** Event

---

## Artist
**Description:** Single Artist or group.
**Attributes:**
- artist_id (PK)
- name (UNIQUE, esiintymisnimi; vaihtoehtoisesti given_name + surname)
- email (NULL allowed)
- phone (NULL allowed)
- catering_requests (text)
- notes (text)
**Relationships:** Artist **M:N** Event (via **EventArtist**)

---

## Event
**Description:** An event where multiple artists can perform and which is organized in a specific location.
**Attributes:**
- event_id (PK)
- title (NOT NULL)
- event_date (DATE/DATETIME, NOT NULL)
- event_type (esim. concert/theatre/dance)
- event_description (NULL allowed)
- venue_id (FK → Venue.venue_id)
- price (DECIMAL(10,2) >= 0, NOT NULL; kaikille lipuille sama hinta)
- status (ENUM: 'scheduled','cancelled', NOT NULL)
- category (optional)
**Constraints:** CHECK(price >= 0), CHECK(status IN ('scheduled','cancelled'))
**Relationships:**
- Event **N:1** Venue
- Event **M:N** Artist (EventArtist)
- Event **1:N** Booking

---

## EventArtist (associative entity)
**Description:** Liittää esiintyjät tapahtumiin (M:N).
**Attributes:**
- event_id (FK → Event.event_id)
- artist_id (FK → Artist.artist_id)
**Constraints:** PK(event_id, artist_id), molemmille FK:t
**Relationships:** toteuttaa **Event M:N Artist**

---

## Booking
**Description:** A booking summary for a single event. Includes the number of tickets, not individual tickets.
**Attributes:**
- booking_nr (PK)
- booking_code (UNIQUE)  -- asiakkaalle annettava koodi
- event_id (FK → Event.event_id)
- phone_nr (NOT NULL)
- ticket_qty (INT >= 1, NOT NULL)
- status (ENUM: 'booked','sold','cancelled', NOT NULL)
- booking_date (DATE, NOT NULL)
- purchase_date (DATE, NULL; asetetaan kun status='sold')
**Constraints:**
- CHECK(ticket_qty >= 1)
- CHECK(status IN ('booked','sold','cancelled'))
- CHECK( (status='sold' AND purchase_date IS NOT NULL)
      OR (status IN ('booked','cancelled') AND purchase_date IS NULL) )
**Relationships:** Booking **N:1** Event

---

## Removed/Replaced
- **Ticket**: Removed. Individual tickets are not stored (requirement of the task). Tickets are modeled as a quantity in the booking (Booking.ticket_qty). All tickets will have the same price, which comes from Event.price.
