# Integrity Constraints – Greenwood Cultural Association

### Primary and Foreign Keys
- Event.venue_id → Venue.venue_id  
- EventArtist.event_id → Event.event_id  
- EventArtist.artist_id → Artist.artist_id  
- Booking.event_id → Event.event_id  

---

### Unique Constraints
- Venue(venue_name, address)  
- Artist(name)  
- Booking(booking_code)

---

### Check Constraints (SQL Server examples)

```sql
ALTER TABLE Venue
  ADD CONSTRAINT CK_Venue_Capacity CHECK (capacity > 0);

ALTER TABLE Event
  ADD CONSTRAINT CK_Event_Price CHECK (price >= 0),
      CONSTRAINT CK_Event_Status CHECK (status IN ('scheduled','cancelled'));

ALTER TABLE Booking
  ADD CONSTRAINT CK_Booking_Qty CHECK (ticket_qty >= 1),
      CONSTRAINT CK_Booking_Status CHECK (status IN ('booked','sold','cancelled')),
      CONSTRAINT CK_Booking_Purchase
        CHECK (
          (status = 'sold' AND purchase_date IS NOT NULL)
          OR (status IN ('booked','cancelled') AND purchase_date IS NULL)
        );
