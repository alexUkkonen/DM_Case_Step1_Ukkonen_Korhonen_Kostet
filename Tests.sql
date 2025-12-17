USE GCA;
GO

-- 1. What is Taylor Swift's contact email?
SELECT email 
FROM Artist 
WHERE stage_name = 'Taylor Swift';

-- 2. Which artists are scheduled to perform in the Jazz Night event on 30.11.2025?
SELECT a.stage_name
FROM Artist a
JOIN Event e ON a.artist_id = e.artist_id
WHERE e.event_type = 'Jazz Night' 
  AND CAST(e.event_date AS DATE) = '2025-11-30';

-- 3. What is the venue name and address for Billie Eilish's concert on 25.3.2026?
SELECT v.venue_name, v.address
FROM Venue v
JOIN Event e ON v.venue_id = e.venue_id
JOIN Artist a ON e.artist_id = a.artist_id
WHERE a.stage_name = 'Billie Eilish' 
  AND CAST(e.event_date AS DATE) = '2026-03-25';

-- 4. When is Imagine Dragons' performance in Greenwood, and what are their special requests for catering?
SELECT e.event_date, a.catering_requests
FROM Event e
JOIN Artist a ON e.artist_id = a.artist_id
WHERE a.stage_name = 'Imagine Dragons';

-- 5. What events are coming up this year? (Assuming "This Year" is 2025 based on context)
SELECT e.event_date, e.event_type, a.stage_name
FROM Event e
JOIN Artist a ON e.artist_id = a.artist_id
WHERE YEAR(e.event_date) = 2025; 
-- To make this dynamic for whatever the *current* real-world year is, use: YEAR(GETDATE())

-- 6. What dance performances are coming up this year?
SELECT e.event_date, a.stage_name
FROM Event e
JOIN Artist a ON e.artist_id = a.artist_id
WHERE e.event_type = 'Dance' 
  AND YEAR(e.event_date) = 2025;

-- 7. How many tickets have been sold so far for The Weeknd's concert scheduled for 5.2.2026?
SELECT SUM(b.ticket_amount) AS total_tickets_sold
FROM Booking b
JOIN Event e ON b.event_id = e.event_id
JOIN Artist a ON e.artist_id = a.artist_id
WHERE a.stage_name = 'The Weeknd' 
  AND CAST(e.event_date AS DATE) = '2026-02-05'
  -- Assuming status_id 2 is 'Paid' and 1 is 'Booked'. Both count as "Sold/Reserved".
  AND b.status_id IN (1, 2); 

-- 8. How many tickets remain for Harry Styles' concert on 12.9.2025?
-- Logic: (Venue Capacity) - (Sum of tickets in valid bookings)
SELECT 
    v.venue_name,
    v.capacity AS total_capacity,
    ISNULL((SELECT SUM(b.ticket_amount) 
            FROM Booking b 
            WHERE b.event_id = e.event_id 
            AND b.status_id IN (1, 2)), 0) AS tickets_sold,
    (v.capacity - ISNULL((SELECT SUM(b.ticket_amount) 
                          FROM Booking b 
                          WHERE b.event_id = e.event_id 
                          AND b.status_id IN (1, 2)), 0)) AS tickets_remaining
FROM Event e
JOIN Venue v ON e.venue_id = v.venue_id
JOIN Artist a ON e.artist_id = a.artist_id
WHERE a.stage_name = 'Harry Styles' 
  AND CAST(e.event_date AS DATE) = '2025-09-12';

-- 9. How much revenue has the Greenwood Association generated from ticket sales this year?
-- Logic: Sum of (Price * Ticket_Amount) for all paid bookings in 2025
SELECT SUM(b.price * b.ticket_amount) AS total_revenue_2025
FROM Booking b
JOIN Event e ON b.event_id = e.event_id
JOIN TicketStatus ts ON b.status_id = ts.status_id
WHERE YEAR(e.event_date) = 2025
  AND ts.status = 'Paid'; 

-- testing event types since none apeared
SELECT DISTINCT event_type from Event;
GO
