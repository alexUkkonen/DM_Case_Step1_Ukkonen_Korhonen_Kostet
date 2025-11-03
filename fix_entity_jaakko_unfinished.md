fix entity

# Entity Type Definitions – Greenwood Cultural Association

## Venue
**Description:** Tapahtumapaikka ja sen kapasiteetti.
**Attributes:**
- venue_id (PK)
- venue_name (NOT NULL)
- address (NOT NULL)
- capacity (INT, > 0)
**Constraints:** UNIQUE(venue_name, address), CHECK(capacity > 0)
**Relationships:** Venue **1:N** Event

---

## Artist
**Description:** Yksittäinen esiintyjä tai yhtye.
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
**Description:** Yleisötapahtuma, jossa voi esiintyä useita artisteja ja joka järjestetään yhdessä tietyssä paikassa.
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
**Description:** Varauksen yhteenveto yhdelle eventille; sisältää lippujen lukumäärän, ei yksittäisiä lippuja.
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

## Poistetut/korvatut käsitteet
- **Ticket**: poistettu. Yksittäisiä lippuja ei tallenneta (tehtävän vaatimus). Liput mallinnetaan varauksen **määränä** (Booking.ticket_qty). Kaikille lipuille **sama hinta** tulee Event.price:sta.
