
-- 1. VENUE Table
INSERT INTO Venue (venue_name, capacity, address) VALUES
('Greenwood Studio', 60, '101 Maple Ave, Greenwood'),      -- Small
('Greenwood Community Hall', 250, '102 Maple Ave, Greenwood'), -- Medium
('Greenwood Grand Auditorium', 600, '105 Maple Ave, Greenwood'); -- Large

-- 2. ARTIST Table
INSERT INTO Artist (email, stage_name, catering_requests, notes) VALUES
('jazz@quartet.com', 'The Smooth Jazz Quartet', 'Sparkling water, fruit platter', 'Local favorites, often book the studio.'),
('magic.mike@performer.net', 'Mystic Mike', 'Sandwiches (no crusts), Coffee', 'Childrens magician. Needs backstage prep area.'),
('rock.legends@band.com', 'Granite Hills', 'Beer (Local IPA), Pizza, Towels', 'Popular regional rock band. Loud.'),
('theater.group@greenwood.org', 'Greenwood Players', 'Tea, throat lozenges', 'Local theater troupe doing Shakespeare.'),
('symphony@city.com', 'City Chamber Orchestra', 'Bottled water (room temp)', 'Requires 20 chairs on stage.');


-- 3. TICKETSTATUS Table
INSERT INTO TicketStatus (status, availability) VALUES
('Booked (Unpaid)', 1), -- Booking made, waiting for payment
('Paid', 1),            -- Ticket purchased (cannot be changed/refunded unless event cancelled)
('Client Cancelled', 1),-- Booking cancelled by client before payment
('Event Cancelled', 0), -- Event cancelled (Refunds applicable)
('Completed', 0);       -- Event finished

-- 4. EVENT Table
INSERT INTO Event (event_date, event_type, event_description, venue_id, artist_id, status_id) VALUES
('2025-05-10 19:30:00', 'Jazz Concert', 'Intimate evening with The Smooth Jazz Quartet', 1, 1, 1), -- Studio
('2025-06-15 14:00:00', 'Magic Show', 'Mystic Mike: Magic for all ages', 2, 2, 1),              -- Hall
('2025-07-20 20:00:00', 'Rock Concert', 'Granite Hills Summer Bash', 3, 3, 1),                    -- Auditorium
('2025-08-05 18:00:00', 'Theater', 'Hamlet in the Park (Indoors)', 2, 4, 1),                      -- Hall
('2025-09-01 19:00:00', 'Classical', 'Fall Overture', 3, 5, 4);                                   -- Auditorium, CANCELLED

-- 5. BOOKING Table
INSERT INTO Booking (price, event_id, phone_nr, ticket_amount, status_id) VALUES
-- Event 1: Small Venue, Price 25.00€
(25.00, 1, '555-0101', 2, 2), -- Paid
(25.00, 1, '555-0102', 4, 1), -- Booked (Unpaid)
(25.00, 1, '555-0103', 2, 2), -- Paid

-- Event 2: Medium Venue, Price 15.00€
(15.00, 2, '555-0201', 10, 2), -- Large group, Paid
(15.00, 2, '555-0202', 3, 3),  -- Cancelled by client

-- Event 3: Large Venue, Price 50.00
(50.00, 3, '555-0301', 2, 2),
(50.00, 3, '555-0302', 5, 2),
(50.00, 3, '555-0303', 2, 1), -- Unpaid

-- Event 5: Cancelled Event, Price 40.00€
(40.00, 5, '555-0501', 2, 4), -- Event Cancelled status
(40.00, 5, '555-0502', 4, 4); -- Event Cancelled status

GO