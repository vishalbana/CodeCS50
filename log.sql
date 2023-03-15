-- Keep a log of any SQL queries you execute as you solve the mystery.
-- Reading crime scene reports from the day of the theft.
SELECT * FROM crime_scene_reports WHERE DAY = '28' AND month = '7' AND year = '2021';
-- Reading witness testimony. to get clues.
SELECT * FROM interviews WHERE DAY = '28' AND month = '7' AND year = '2021';
-- cLue 1 = within 10 minutes of the theft i.e within 10:15-10:25 AM
-- CLUE 2 = thief called someone and talked less than a minute, taking earliest flight tomorrow, other person purchased flight tickets.
-- clue 3 = thief was withdrawing money on Leggett Street earlier on the same day i.e. 28/07/2021 before 10:15 AM.

-- Possible thiefs zeroed down to 8.
SELECT *  FROM bakery_security_logs WHERE year = 2021 AND month = 7 AND day = 28 AND hour = 10 AND minute < 25 AND minute > 15;

-----------------+
--| 260 | 2021 | 7     | 28  | 10   | 16     | exit     | 5P2BI95       |
--| 261 | 2021 | 7     | 28  | 10   | 18     | exit     | 94KL13X       |
--| 262 | 2021 | 7     | 28  | 10   | 18     | exit     | 6P58WS2       |
--| 263 | 2021 | 7     | 28  | 10   | 19     | exit     | 4328GD8       |
--| 264 | 2021 | 7     | 28  | 10   | 20     | exit     | G412CB7       |
--| 265 | 2021 | 7     | 28  | 10   | 21     | exit     | L93JTIZ       |
--| 266 | 2021 | 7     | 28  | 10   | 23     | exit     | 322W7JE       |
--| 267 | 2021 | 7     | 28  | 10   | 23     | exit     | 0NTHK55

-- Getting name, phone numbers, passport numbers of the suspects
SELECT people.id, people.name, people.phone_number, people.passport_number FROM people JOIN bakery_security_logs
ON people.license_plate = bakery_security_logs.license_plate WHERE people.license_plate IN
(SELECT license_plate FROM bakery_security_logs WHERE year = 2021 AND month = 7 AND day = 28 AND hour = 10 AND minute < 25 AND minute > 15);

-- to zero down out of 8 suspects will have to find which one was at ATM.
SELECT * FROM people JOIN bank_accounts ON people.id = bank_accounts.person_id JOIN atm_transactions ON
 bank_accounts.account_number = atm_transactions.account_number WHERE atm_transactions.day = '28' AND atm_transactions.month = '7'
 AND atm_transactions.year = '2021' AND atm_transactions.atm_location = "Leggett Street" AND atm_transactions.transaction_type = "withdraw";
 -- this got account numbers of the suspects.
-- NO. of suspects are now reduced
-- BRUCE, DIANA, KENNY, TAYLOR AND BENISTA i.e = 5
SELECT * FROM people JOIN phone_calls ON people.phone_number = phone_calls.caller WHERE year = 2021 AND day = 28 AND month = 7 AND duration < 60;

-------+-------+-----+----------------+------------------+--------+
--|   id   |  name   |  phone_number  | passport_number | license_plate | account_number | person_id | creation_year | id  | account_number | year | month | day |  atm_location  | transaction_type | amount |
--+--------+---------+----------------+-----------------+---------------+----------------+-----------+---------------+-----+----------------+------+-------+-----+----------------+------------------+--------+
--| 686048 | Bruce   | (367) 555-5533 | 5773159633      | 94KL13X       | 49610011       | 686048    | 2010          | 267 | 49610011       | 2021 | 7     | 28  | Leggett Street | withdraw         | 50     |
--| 514354 | Diana   | (770) 555-1861 | 3592750733      | 322W7JE       | 26013199       | 514354    | 2012          | 336 | 26013199       | 2021 | 7     | 28  | Leggett Street | withdraw         | 35     |
--| 458378 | Brooke  | (122) 555-4581 | 4408372428      | QX4YZN3       | 16153065       | 458378    | 2012          | 269 | 16153065       | 2021 | 7     | 28  | Leggett Street | withdraw         | 80     |
--| 395717 | Kenny   | (826) 555-1652 | 9878712108      | 30G67EN       | 28296815       | 395717    | 2014          | 264 | 28296815       | 2021 | 7     | 28  | Leggett Street | withdraw         | 20     |
--| 396669 | Iman    | (829) 555-5269 | 7049073643      | L93JTIZ       | 25506511       | 396669    | 2014          | 288 | 25506511       | 2021 | 7     | 28  | Leggett Street | withdraw         | 20     |
--| 467400 | Luca    | (389) 555-5198 | 8496433585      | 4328GD8       | 28500762       | 467400    | 2014          | 246 | 28500762       | 2021 | 7     | 28  | Leggett Street | withdraw         | 48     |
--| 449774 | Taylor  | (286) 555-6063 | 1988161715      | 1106N58       | 76054385       | 449774    | 2015          | 266 | 76054385       | 2021 | 7     | 28  | Leggett Street | withdraw         | 60     |
--| 438727 | Benista | (338) 555-6650 | 9586786673      | 8X428L0       | 81061156       | 438727    | 2018          | 313 | 81061156       | 2021 | 7     | 28  | Leggett Street | withdraw         | 30     |
--+--------+---------+----------------+-----------------+---------------+----------------+-----------+---------------+-----+----------------+

-- THE above table include people who were at the atm on leggett street that day.

--+--------+---------+----------------+-----------------+---------------+-----+----------------+----------------+------+-------+-----+----------+
--|   id   |  name   |  phone_number  | passport_number | license_plate | id  |     caller     |    receiver    | year | month | day | duration |
--+--------+---------+----------------+-----------------+---------------+-----+----------------+----------------+------+-------+-----+----------+
--| 398010 | Sofia   | (130) 555-0289 | 1695452385      | G412CB7       | 221 | (130) 555-0289 | (996) 555-8899 | 2021 | 7     | 28  | 51       |
--| 560886 | Kelsey  | (499) 555-9472 | 8294398571      | 0NTHK55       | 224 | (499) 555-9472 | (892) 555-8872 | 2021 | 7     | 28  | 36       |
--| 686048 | Bruce   | (367) 555-5533 | 5773159633      | 94KL13X       | 233 | (367) 555-5533 | (375) 555-8161 | 2021 | 7     | 28  | 45       |
--| 560886 | Kelsey  | (499) 555-9472 | 8294398571      | 0NTHK55       | 251 | (499) 555-9472 | (717) 555-1342 | 2021 | 7     | 28  | 50       |
--| 449774 | Taylor  | (286) 555-6063 | 1988161715      | 1106N58       | 254 | (286) 555-6063 | (676) 555-6554 | 2021 | 7     | 28  | 43       |
--| 514354 | Diana   | (770) 555-1861 | 3592750733      | 322W7JE       | 255 | (770) 555-1861 | (725) 555-3243 | 2021 | 7     | 28  | 49       |
--| 907148 | Carina  | (031) 555-6622 | 9628244268      | Q12B3Z3       | 261 | (031) 555-6622 | (910) 555-3251 | 2021 | 7     | 28  | 38       |
--| 395717 | Kenny   | (826) 555-1652 | 9878712108      | 30G67EN       | 279 | (826) 555-1652 | (066) 555-9701 | 2021 | 7     | 28  | 55       |
--| 438727 | Benista | (338) 555-6650 | 9586786673      | 8X428L0       | 281 | (338) 555-6650 | (704) 555-2131 | 2021 | 7     | 28  | 54       |
--+--------+---------+----------------+-----------------+---------------+-----+----------------+----------------+------+-------+-----+-------

--THE above two table compared gives us BRUCE, DIANA, KENNY, TAYLOR AND BENISTA as remaining possible suspects. lets check flights now.
-- thiefs accomplice can be known by the reciever id's name after we can zero down on the single suspect.

SELECT * FROM flights WHERE year = 2021 AND day = 29 AND month = 7 ORDER BY hour;
---+----+-------------------+------------------------+------+-------+-----+------+--------+
---| id | origin_airport_id | destination_airport_id | year | month | day | hour | minute |
---+----+-------------------+------------------------+------+-------+-----+------+--------+
---| 36 | 8                 | 4                      | 2021 | 7     | 29  | 8    | 20     |
---| 43 | 8                 | 1                      | 2021 | 7     | 29  | 9    | 30     |
--| 23 | 8                 | 11                     | 2021 | 7     | 29  | 12   | 15     |
--| 53 | 8                 | 9                      | 2021 | 7     | 29  | 15   | 20     |
--| 18 | 8                 | 6                      | 2021 | 7     | 29  | 16   | 0      |
--+----+-------------------+------------------------+------+-------+-----+------+--------+

-- The people who gave witness told that the thief is going to take first flight out of city next morning.
SELECT * FROM airports;
-- by this simple command we can figure out that the origin airport id 8 is of fiftyville and the first flight going next day out of
-- fiftyvilee is to no.4 i.e LaGuardia Airport
---New York City
-- flight id  = 36
SELECT * from people JOIN passengers ON passengers.passport_number = people.passport_number
JOIN flights ON passengers.flight_id = flights.id WHERE flights.id = 36 ORDER BY flights.hour;
-- Now the suspects that we had before can be furthur reduced to BRUCE , KENNY, TAYLOR. (DIANA and BENISTA OUT)
-- to clean some information.
SELECT people.id, people.name, people.phone_number, people.passport_number, people.license_plate
from people JOIN passengers ON passengers.passport_number = people.passport_number JOIN flights
ON passengers.flight_id = flights.id WHERE flights.id = 36 ORDER BY flights.hour;

 ---             id   |  name  |  phone_number  | passport_number | license_plate
 --SUSPECT 1   686048 | Bruce  | (367) 555-5533 | 5773159633      | 94KL13X
 --SUSPECT 2   449774 | Taylor | (286) 555-6063 | 1988161715      | 1106N58
 --SUSPECT 3   395717 | Kenny  | (826) 555-1652 | 9878712108      | 30G67EN

SELECT * FROM bakery_security_logs WHERE bakery_security_logs.license_plate = "94KL13X";

-- By this command we know this person was there at the time and date of the theft.

SELECT * FROM bakery_security_logs WHERE bakery_security_logs.license_plate = "1106N58";
-- by this we know that this person was also there on that day but he left 20 minutes after the robbery so he can't be the one.

SELECT * FROM bakery_security_logs WHERE bakery_security_logs.license_plate = "30G67EN";

-- by this we can conclude that this person was not there on the day of the theft.
SELECT * FROM bakery_security_logs WHERE bakery_security_logs.license_plate = "94KL13X";

-- we can finally say bruce is the one who took CS50 DUCK.

--now lets see who he called that must be his accomplice.

SELECT * FROM phone_calls WHERE caller = '(367) 555-5533' AND  year = '2021' AND  month = '7' AND day = '28' AND duration < 60;

-- this provides the receiver's phone number lets find out his name as well.

SELECT * FROM people WHERE phone_number = "(375) 555-8161";

---  864400 | Robin | (375) 555-8161 |                 | 4V16VO0

-- Robin is the accomplice.
