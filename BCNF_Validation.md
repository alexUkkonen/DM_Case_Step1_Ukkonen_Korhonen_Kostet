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
artist_id → stage_name, email, phone, catering_requests, notes  
name → artist_id (since name is unique)

**Candidate keys:** artist_id 

**BCNF:** Satisfied.

---

### Event
**Functional dependencies:**  
event_id → event_date, event_type, event_description, venue_id, artist_id

**Candidate key:** event_id  

**BCNF:** Satisfied – all non-trivial dependencies are from the primary key.

---

### Booking
**Functional dependencies:**  
booking_nr → event_id, phone_nr, ticket_amount, status, price  

**Candidate keys:** booking_nr

**BCNF:** Satisfied – all attributes depend on candidate keys.

---

### TicketStatus
**Functional dependencies:**  
status_id → availability, status
status → availability

**Candidate keys:** status_id, status

**BCNF:** Satisfied – all attributes depend on candidate keys.
