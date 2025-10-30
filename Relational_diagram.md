
> Ticket(***ticket_id***, price, event_id, availibility)

>> FK (event_id) REFERENCES Event(event_id)

> Booking (***booking_nr***, price, event_id, phone_nr, status, ticket_id)

>> FK (event_id) REFERENCES Event(event_id)

>> FK (ticket_id) REFERENCES Ticket(ticekt_id)

> Event (***Event_id***, event_date, event_type, event_description, venue_id, artist_id)

>> FK (venue_id) REFERENCES Venue (venue_id)

>> FK (artist_id) REFERENCES Artist (artist_id)

> Venue(***venue_id***, venue_name, capacity, address)

> Artist (***artist_id***. email, given_name, surname, catering_requests, notes)
