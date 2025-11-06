> TicketStatus (***status_id***, status, availability) 

> Booking (***booking_nr***, price, event_id, phone_nr, ticket_amount, status_id)

>> FK (event_id) REFERENCES Event(event_id)

>> FK (status_id) REFERENCES TicketStatus (status_id) 

> Event (***event_id***, event_date, event_type, event_description, venue_id, artist_id, status_id)

>> FK (venue_id) REFERENCES Venue (venue_id)

>> FK (artist_id) REFERENCES Artist (artist_id)

>> FK (status_id) REFERENCES TicketStatus (status_id)

> Venue(***venue_id***, venue_name, capacity, address)

> Artist (***artist_id***, email, stage_name, catering_requests, notes)
