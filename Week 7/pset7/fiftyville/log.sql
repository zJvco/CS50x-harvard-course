-- Keep a log of any SQL queries you execute as you solve the mystery.

-- Step 1) Get description of crime report at the scene

/*
Description: Theft of the CS50 duck took place at 10:15am at the Chamberlin Street
courthouse. Interviews were conducted today with three witnesses who were present at
the time — each of their interview transcripts mentions the courthouse.
*/

SELECT *
FROM crime_scene_reports
WHERE day = 28 AND month = 7 AND year = 2020 AND street = "Chamberlin Street";

-- Step 2) View the interviews (transcript) of the three witnesses in scene

/*
Ruth transcription: Sometime within ten minutes of the theft, I saw the thief get into
a car in the courthouse parking lot and drive away. If you have security footage from the
courthouse parking lot, you might want to look for cars that left the parking lot in that time frame.

Eugene transcription: I don't know the thief's name, but it was someone I recognized. Earlier this morning,
before I arrived at the courthouse, I was walking by the ATM on Fifer Street and saw the thief there withdrawing
some money.

Raymond transcription: As the thief was leaving the courthouse, they called someone who talked to them for less
than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of
Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket.
*/

SELECT *
FROM interviews
WHERE day = 28 AND month = 7 AND year = 2020
      AND transcript LIKE "%courthouse%";

-- Step 3) Get the images from the cameras in parking lot

/*
Camera time log: between 10:15am and 10:25am

License_plates: 5P2BI95, 94KL13X, 6P58WS2, 4328GD8, G412CB7, L93JTIZ, 322W7JE, 0NTHK55
*/

SELECT *
FROM courthouse_security_logs
WHERE day = 28 AND month = 7 AND year = 2020
      AND activity = "exit"
      AND hour = 10 AND minute >= 15 AND minute <= 25;

-- Step 4) Check phone calls

/*
id | caller | receiver | year | month | day | duration
221 | (130) 555-0289 | (996) 555-8899 | 2020 | 7 | 28 | 51
224 | (499) 555-9472 | (892) 555-8872 | 2020 | 7 | 28 | 36
233 | (367) 555-5533 | (375) 555-8161 | 2020 | 7 | 28 | 45
234 | (609) 555-5876 | (389) 555-5198 | 2020 | 7 | 28 | 60
251 | (499) 555-9472 | (717) 555-1342 | 2020 | 7 | 28 | 50
254 | (286) 555-6063 | (676) 555-6554 | 2020 | 7 | 28 | 43
255 | (770) 555-1861 | (725) 555-3243 | 2020 | 7 | 28 | 49
261 | (031) 555-6622 | (910) 555-3251 | 2020 | 7 | 28 | 38
279 | (826) 555-1652 | (066) 555-9701 | 2020 | 7 | 28 | 55
281 | (338) 555-6650 | (704) 555-2131 | 2020 | 7 | 28 | 54
*/

SELECT *
FROM phone_calls
WHERE day = 28 AND duration <= 60;

-- Step 5) Check Fifer Street where thief was withdrawing some money from ATM (Caixa Eletrônico)

/*
id | account_number | year | month | day | atm_location | transaction_type | amount
246 | 28500762 | 2020 | 7 | 28 | Fifer Street | withdraw | 48
264 | 28296815 | 2020 | 7 | 28 | Fifer Street | withdraw | 20
266 | 76054385 | 2020 | 7 | 28 | Fifer Street | withdraw | 60
267 | 49610011 | 2020 | 7 | 28 | Fifer Street | withdraw | 50
269 | 16153065 | 2020 | 7 | 28 | Fifer Street | withdraw | 80
288 | 25506511 | 2020 | 7 | 28 | Fifer Street | withdraw | 20
313 | 81061156 | 2020 | 7 | 28 | Fifer Street | withdraw | 30
336 | 26013199 | 2020 | 7 | 28 | Fifer Street | withdraw | 35
*/

SELECT *
FROM atm_transactions
WHERE day = 28 AND transaction_type = "withdraw" AND atm_location = "Fifer Street";

-- Step 6) Check the earliest flight in date 29/7/2020

/*
36 | 7214083635 | 2A | 36 | 8 | 4 | 2020 | 7 | 29 | 8 | 20
36 | 1695452385 | 3B | 36 | 8 | 4 | 2020 | 7 | 29 | 8 | 20
36 | 5773159633 | 4A | 36 | 8 | 4 | 2020 | 7 | 29 | 8 | 20
36 | 1540955065 | 5C | 36 | 8 | 4 | 2020 | 7 | 29 | 8 | 20
36 | 8294398571 | 6C | 36 | 8 | 4 | 2020 | 7 | 29 | 8 | 20
36 | 1988161715 | 6D | 36 | 8 | 4 | 2020 | 7 | 29 | 8 | 20
36 | 9878712108 | 7A | 36 | 8 | 4 | 2020 | 7 | 29 | 8 | 20
36 | 8496433585 | 7B | 36 | 8 | 4 | 2020 | 7 | 29 | 8 | 20
*/

SELECT *
FROM passengers p
JOIN flights f ON p.flight_id = f.id
WHERE p.flight_id IN (SELECT id
                      FROM flights
                      WHERE day = 29 AND origin_airport_id IN (SELECT id
                                                               FROM airports
                                                               WHERE city = "Fiftyville")
                                                               ORDER BY hour, minute
                                                               LIMIT 1);

-- Step 7) Check possible suspects of thief

/*
id | name | phone_number | passport_number | license_plate
398010 | Roger | (130) 555-0289 | 1695452385 | G412CB7
560886 | Evelyn | (499) 555-9472 | 8294398571 | 0NTHK55
686048 | Ernest | (367) 555-5533 | 5773159633 | 94KL13X
*/

SELECT *
FROM people
WHERE passport_number IN (SELECT p.passport_number
                          FROM passengers p
                          JOIN flights f ON p.flight_id = f.id
                          WHERE p.flight_id IN (SELECT id
                                                FROM flights
                                                WHERE day = 29 AND origin_airport_id IN (SELECT id
                                                                                         FROM airports
                                                                                         WHERE city = "Fiftyville")
                                                                                         ORDER BY hour, minute
                                                                                         LIMIT 1)) AND license_plate IN (SELECT license_plate
                                                                                                                         FROM courthouse_security_logs
                                                                                                                         WHERE day = 28 AND month = 7 AND year = 2020 AND activity = "exit" AND hour = 10 AND minute >= 15 AND minute <= 25) AND phone_number IN (SELECT caller
                                                                                                                                                                                                                                                                  FROM phone_calls
                                                                                                                                                                                                                                                                  WHERE day = 28 AND duration <= 60);

-- Step 8) Check account number of the suspects

/*
account_number | person_id | creation_year
49610011 | 686048 | 2010
*/

SELECT *
FROM bank_accounts
WHERE person_id IN (SELECT id
                    FROM people
                    WHERE passport_number IN (SELECT p.passport_number
                                              FROM passengers p
                                              JOIN flights f ON p.flight_id = f.id
                                              WHERE p.flight_id IN (SELECT id
                                                                    FROM flights
                                                                    WHERE day = 29 AND origin_airport_id IN (SELECT id
                                                                                                             FROM airports
                                                                                                             WHERE city = "Fiftyville")
                                                                                                             ORDER BY hour, minute
                                                                                                             LIMIT 1)) AND license_plate IN (SELECT license_plate
                                                                                                                                             FROM courthouse_security_logs
                                                                                                                                             WHERE day = 28 AND month = 7 AND year = 2020 AND activity = "exit" AND hour = 10 AND minute >= 15 AND minute <= 25) AND phone_number IN (SELECT caller
                                                                                                                                                                                                                                                                                      FROM phone_calls
                                                                                                                                                                                                                                                                                      WHERE day = 28 AND duration <= 60));

-- Step 9) Check transactions of the thief (Ernest)

/*
id | account_number | year | month | day | atm_location | transaction_type | amount
267 | 49610011 | 2020 | 7 | 28 | Fifer Street | withdraw | 50
*/

SELECT *
FROM atm_transactions
WHERE day = 28 AND transaction_type = "withdraw" AND atm_location = "Fifer Street" AND account_number IN (SELECT account_number
                                                                                                          FROM bank_accounts
                                                                                                          WHERE person_id IN (SELECT id
                                                                                                                              FROM people
                                                                                                                              WHERE passport_number IN (SELECT p.passport_number
                                                                                                                                                        FROM passengers p
                                                                                                                                                        JOIN flights f ON p.flight_id = f.id
                                                                                                                                                        WHERE p.flight_id IN (SELECT id
                                                                                                                                                                              FROM flights
                                                                                                                                                                              WHERE day = 29 AND origin_airport_id IN (SELECT id
                                                                                                                                                                                                                       FROM airports
                                                                                                                                                                                                                       WHERE city = "Fiftyville")
                                                                                                                                                                                                                       ORDER BY hour, minute
                                                                                                                                                                                                                       LIMIT 1)) AND license_plate IN (SELECT license_plate
                                                                                                                                                                                                                                                       FROM courthouse_security_logs
                                                                                                                                                                                                                                                       WHERE day = 28 AND month = 7 AND year = 2020 AND activity = "exit" AND hour = 10 AND minute >= 15 AND minute <= 25) AND phone_number IN (SELECT caller
                                                                                                                                                                                                                                                                                                                                                                                                FROM phone_calls
                                                                                                                                                                                                                                                                                                                                                                                                WHERE day = 28 AND duration <= 60)));

-- Step 10) Get destination of the flight

/*
id | abbreviation | full_name | city
4 | LHR | Heathrow Airport | London
*/

SELECT *
FROM airports
WHERE id IN (SELECT destination_airport_id
             FROM passengers p
             JOIN flights f ON p.flight_id = f.id
             WHERE p.flight_id IN (SELECT id
                                   FROM flights
                                   WHERE day = 29 AND origin_airport_id IN (SELECT id
                                                                            FROM airports
                                                                            WHERE city = "Fiftyville")
                                                                            ORDER BY hour, minute LIMIT 1));


-- Step 11) Get Accomplice

/*
id | name | phone_number | passport_number | license_plate | id | caller | receiver | year | month | day | duration
864400 | Berthold | (375) 555-8161 |  | 4V16VO0 | 233 | (367) 555-5533 | (375) 555-8161 | 2020 | 7 | 28 | 45
*/

SELECT *
FROM people p
JOIN phone_calls pc ON p.phone_number = pc.receiver
WHERE pc.day = "28" AND pc.month = "7" AND pc.year = "2020" AND pc.duration <= "60" AND pc.caller = (SELECT phone_number
                                                                                                     FROM people
                                                                                                     WHERE name = "Ernest");