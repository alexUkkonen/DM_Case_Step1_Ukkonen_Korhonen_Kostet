# Step 1 – Questions and Notes

## 1. Questions for the Client (Teacher)
1. **3 days vs 4 days rule:**  
   The document mentions removing unpurchased bookings after **3 days**,  
   but tickets must be purchased within **4 days**. Which rule is correct?
2. **Status values:**  
   Are these acceptable and final?  
   - Event: `scheduled`, `cancelled`  
   - Booking: `booked`, `sold`, `cancelled`
3. **Artist name format:**  
   Should we keep only one attribute `name` (stage name),  
   or keep both `given_name` and `surname` separately?
4. **Event type or category:**  
   Should `event_type` be a free-text field (e.g. "dance", "concert"),  
   or should we create a separate lookup table for event categories?
5. **Overbooking enforcement:**  
   Is it acceptable that we prevent overbooking using SQL queries and checks  
   (not triggers or stored procedures), as allowed by the assignment?

---

## 2. Quick Self-Check (Before Step 2)
✅ **No Ticket table** — removed completely.  
✅ **Booking has `ticket_qty`** instead of individual tickets.  
✅ **Booking.price** and `ticket_id` removed.  
✅ **EventArtist** table added for many-to-many relationship between Event and Artist.  
✅ **Event.price** exists at event level; same price for all tickets.  
✅ **Event.status** = `scheduled` / `cancelled`.  
✅ **Booking.status** = `booked` / `sold` / `cancelled`.  
✅ **Venue.capacity** has a check constraint (> 0).  
✅ **All files committed:**  
   - `Relational_diagram.md`  
   - `entity_type_definitions.md`  
   - `BCNF_Validation.md`  
   - `Integrity_Constraints.md`  
✅ Branch pushed to GitHub (`step1-fix-model`).  
✅ Pull request created and marked as unfinished.

---

## 3. ER Diagram (Draw.io) Update Instructions

**Required edits to match the current logical model:**

1. **Remove the `Ticket` entity completely.**  
   - Delete its box and all connecting lines.
2. **Delete the `artist_id` attribute** from `Event`.  
   - Each Event can have multiple Artists (M:N).
3. **Add a new associative entity:**  
   - **Name:** `EventArtist`  
   - **Attributes:** `event_id`, `artist_id` (both FKs)  
   - **Primary Key:** `(event_id, artist_id)`  
   - Connect it to `Event` and `Artist` with 1:N lines on both sides.
4. **In the `Booking` entity:**  
   - Add attribute `ticket_qty` (integer, ≥ 1).  
   - Keep attributes: `booking_nr` (PK), `booking_code` (unique), `event_id` (FK),  
     `phone_nr`, `status`, `booking_date`, `purchase_date`.  
   - Remove `ticket_id` and `price`.
5. **In the `Event` entity:**  
   - Keep attributes: `event_id` (PK), `title`, `event_date`, `event_type`,  
     `event_description`, `venue_id` (FK), `price`, `status`, `category` (optional).  
   - Ensure `status` values are only `scheduled` or `cancelled`.
6. **Relationship lines:**
   - `Venue 1 – N Event`
   - `Event 1 – N Booking`
   - `Event M – N Artist` (via EventArtist)
7. **Optional visual improvements:**
   - Use clear arrowheads for cardinalities (1, N, M).  
   - Align entities in logical order: Venue → Event → Booking (center); Artist → EventArtist (side).  
   - Add note boxes for CHECK constraints if desired.

---

## 4. Next Step (Preview)
After confirmation from the teacher, continue with **Step 2 – Physical Design and SQL Implementation**, which will include:
- Creating SQL scripts to build the database and indexes,  
- Inserting test data,  
- Running and documenting 16 test queries.


# Vaihe 1 – Kysymykset ja muistiinpanot

## 1. Kysymykset asiakkaalle (opettajalle)
1. **3 vai 4 päivän sääntö:**  
   Tehtävässä sanotaan, että ostamattomat varaukset poistetaan **3 päivän** jälkeen,  
   mutta liput pitää ostaa **4 päivän** kuluessa. Kumpi on virallinen sääntö?
2. **Status-arvot:**  
   Ovatko nämä hyväksyttävät ja lopulliset?  
   - Event: `scheduled`, `cancelled`  
   - Booking: `booked`, `sold`, `cancelled`
3. **Artistin nimi:**  
   Riittääkö yksi kenttä `name` (esiintymisnimi),  
   vai pidetäänkö erillisinä `given_name` ja `surname`?
4. **Event-tyyppi / kategoria:**  
   Onko `event_type` vapaateksti (esim. "concert", "dance"),  
   vai halutaanko erillinen kooditaulu tapahtumatyypeille?
5. **Ylivarauksen estäminen:**  
   Riittääkö, että ylivaraus estetään SQL-kyselyillä ja tarkistuksilla  
   (ilman triggereitä tai prosedyyrejä), kuten tehtävä sallii?

---

## 2. Pikatsaus ennen Vaihetta 2
✅ **Ticket-taulu poistettu kokonaan**  
✅ **Booking sisältää `ticket_qty`** (lippujen määrä)  
✅ **Booking.price** ja `ticket_id` poistettu  
✅ **EventArtist**-liitostaulu lisätty Eventin ja Artistin välille (M:N)  
✅ **Event.price** on tapahtumatasolla (sama kaikille lipuille)  
✅ **Event.status** = `scheduled` / `cancelled`  
✅ **Booking.status** = `booked` / `sold` / `cancelled`  
✅ **Venue.capacity**: CHECK (capacity > 0)  
✅ **Kaikki tiedostot repossa:**  
   - `Relational_diagram.md`  
   - `entity_type_definitions.md`  
   - `BCNF_Validation.md`  
   - `Integrity_Constraints.md`  
✅ Branch GitHubissa: `step1-fix-model`  
✅ Pull request luotu ja merkitty keskeneräiseksi (unfinished)

---

## 3. ER-kaavion (Draw.io) päivitysohjeet

**Tee seuraavat muutokset, jotta kaavio vastaa mallia:**

1. **Poista kokonaan `Ticket`-entiteetti.**  
   - Poista laatikko ja siihen liittyvät yhteydet.
2. **Poista `artist_id` attribuutti** `Event`-entiteetistä.  
   - Jokaisella tapahtumalla voi olla useita artisteja (M:N).
3. **Lisää uusi liitostaulu:**  
   - **Nimi:** `EventArtist`  
   - **Attribuutit:** `event_id`, `artist_id` (molemmat FK)  
   - **Primary Key:** `(event_id, artist_id)`  
   - Yhdistä `Event` ja `Artist` tähän tauluun 1:N-suhteilla molemmilta puolilta.
4. **Booking-entiteettiin:**  
   - Lisää `ticket_qty` (kokonaisluku, ≥ 1).  
   - Säilytä: `booking_nr` (PK), `booking_code` (unique), `event_id` (FK),  
     `phone_nr`, `status`, `booking_date`, `purchase_date`.  
   - Poista `ticket_id` ja `price`.
5. **Event-entiteettiin:**  
   - Säilytä: `event_id` (PK), `title`, `event_date`, `event_type`,  
     `event_description`, `venue_id` (FK), `price`, `status`, `category` (valinnainen).  
   - Status-arvot vain: `scheduled` ja `cancelled`.
6. **Relaatioviivat:**  
   - `Venue 1 – N Event`  
   - `Event 1 – N Booking`  
   - `Event M – N Artist` (via EventArtist)
7. **Visuaaliset parannukset:**  
   - Käytä selkeitä nuolia ja merkintöjä (1, N, M).  
   - Aseta entiteetit loogisesti: Venue → Event → Booking (keskelle), Artist → EventArtist (sivulle).  
   - Halutessasi lisää kommenttilaatikoita CHECK-rajoitteille.

---

## 4. Seuraava vaihe
Kun opettaja on hyväksynyt mallin, jatka **Vaiheeseen 2 – Fyysinen suunnittelu ja SQL-toteutus**, joka sisältää:
- SQL-skriptin tietokannan ja taulujen luomiseksi  
- Indeksien luomisen  
- Testidatan lisäämisen  
- 16 testikyselyä (SELECT/UPDATE/DELETE) sekä lyhyen testiraportin
