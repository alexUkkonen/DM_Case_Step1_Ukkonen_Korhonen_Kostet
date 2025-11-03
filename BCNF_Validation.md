# BCNF Validation – Greenwood Cultural Association

### Venue
**Functional dependencies:**  
venue_id → venue_name, address, capacity  
(name, address) → venue_id, capacity  

**Candidate keys:** venue_id; (venue_name, address)  
**BCNF:** Satisfied – all non-trivial FDs originate from candidate keys.

---

### Artist
**Functional dependencies:**  
artist_id → name, email, phone, catering_requests, notes  
name → artist_id (since name is unique)

**Candidate keys:** artist_id; name  
**BCNF:** Satisfied.

---

### Event
**Functional dependencies:**  
event_id → title, event_date, event_type, event_description, venue_id, price, status, category

**Candidate key:** event_id  
**BCNF:** Satisfied – all non-trivial dependencies are from the primary key.

---

### EventArtist
**Functional dependencies:**  
(event_id, artist_id) → (—)

**Candidate key:** (event_id, artist_id)  
**BCNF:** Satisfied – the table only consists of its composite key.

---

### Booking
**Functional dependencies:**  
booking_nr → booking_code, event_id, phone_nr, ticket_qty, status, booking_date, purchase_date  
booking_code → booking_nr, event_id, phone_nr, ticket_qty, status, booking_date, purchase_date  

**Candidate keys:** booking_nr; booking_code  
**BCNF:** Satisfied – all attributes depend on candidate keys.

---

### Summary
All relations meet the Boyce-Codd Normal Form (BCNF).  
The model avoids redundancy and update anomalies by removing derived and repeating data (for example, price moved from Booking to Event and Ticket entity removed).
