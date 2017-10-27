USE travel;

-- 1) Select a distinct list of ordered airports codes. Be sure to name the column correctly. Be sure to order the results correctly.

-- SELECT departAirport as Airport FROM flight GROUP BY Airport HAVING count( * ) >1;

-- 2) Provide a list of delayed flights departing from San Francisco (SFO).

-- SELECT name, flightNumber, scheduledDepartDateTime, arriveAirport, status FROM flight INNER JOIN airline ON airline.ID = flight.airlineID WHERE departAirport = 'SFO' AND status = 'delayed';

-- 3) Provide a distinct list of cities that American airlines departs from.

-- SELECT departAirport AS Cities FROM flight INNER JOIN airline ON airline.ID = flight.airlineID WHERE airline.name = 'American' GROUP BY Cities HAVING count(*) >1;

-- 4) Provide a distinct list of airlines that conduct flights departing from ATL.

-- SELECT airline.name AS Airline FROM airline INNER JOIN flight ON airline.ID = flight.airlineID WHERE flight.departAirport = 'ATL' GROUP BY Airline;

-- 5) Provide a list of airlines, flight numbers, departing airports, and arrival airports where flights departed on time.

-- SELECT name, flightNumber, departAirport, arriveAirport FROM flight INNER JOIN airline ON airline.ID = flight.airlineID WHERE scheduledDepartDateTime = actualDepartDateTime;

-- 6) Provide a list of airlines, flight numbers, gates, status, and arrival times arriving into Charlotte (CLT) on 10-30-2017. Order your results by the arrival time.

-- SELECT name AS Airline, flightNumber AS Flight, gate AS Gate, TIME(scheduledArriveDateTime) AS Arrival, status AS Status FROM flight INNER JOIN airline ON airline.ID = flight.airlineID WHERE arriveAirport = 'CLT' AND DATE(scheduledArriveDateTime) = '2017-10-30' ORDER BY Arrival;

-- 7) List the number of reservations by flight number. Order by reservations in descending order.

-- SELECT flightNumber AS Flight, count(reservation.ID) AS Reservations FROM reservation INNER JOIN flight ON flight.ID = reservation.flightID GROUP BY Flight ORDER BY Reservations desc;

-- 8) List the average ticket cost for coach by airline and route. Order by AverageCost in descending order.

-- SELECT airline.name, departAirport, arriveAirport, AVG(reservation.cost) FROM flight  INNER JOIN reservation ON reservation.flightID = flight.ID  INNER JOIN airline ON airline.ID = flight.airlineID  WHERE class = 'coach' GROUP BY flight.departAirport, flight.arriveAirport, airline.name  ORDER BY AVG(reservation.cost) desc;

-- 9) Which route is the longest?

-- SELECT departAirport, arriveAirport, miles FROM flight ORDER BY miles desc LIMIT 1;

-- 10) List the top 5 passengers that have flown the most miles. Order by miles.

-- SELECT firstName, lastName, SUM(miles) FROM flight INNER JOIN reservation ON reservation.flightID = flight.ID INNER JOIN passenger ON passenger.ID = reservation.passengerID GROUP BY passenger.firstName, passenger.lastName ORDER BY SUM(miles) desc LIMIT 5;

-- 11) Provide a list of upcoming scheduled American airline flights ordered by route and arrival date and time.

-- SELECT name AS Name, CONCAT_WS(' --> ', departAirport, arriveAirport) AS Route, DATE(scheduledArriveDateTime) AS 'Arrive Date', TIME(scheduledArriveDateTime) AS 'Arrive Time' FROM airline INNER JOIN flight ON airline.ID = flight.airlineID WHERE Name = 'American' ORDER BY Route;

-- 12) Provide a report that counts the number of reservations and totals the reservation costs (as Revenue) by Airline, flight, and route. Order the report by total revenue in descending order.

-- SELECT name AS Airline, flightNumber AS Flight, CONCAT_WS(' --> ', departAirport, arriveAirport) AS Route, COUNT(reservation.ID) AS 'Reservation Count', SUM(reservation.cost) AS Revenue FROM airline INNER JOIN flight ON airline.ID = flight.airlineID INNER JOIN reservation ON flight.ID = reservation.flightID GROUP BY Airline, Flight, Route ORDER BY COUNT(reservation.ID) desc;

-- 13) List the average cost per reservation by route. Round results down to the dollar.

-- SELECT CONCAT_WS(' --> ', departAirport, arriveAirport) AS Route, FLOOR(AVG(reservation.cost)) AS 'Avg Revenue' FROM flight INNER JOIN reservation ON flight.ID = reservation.flightID GROUP BY Route ORDER BY FLOOR(AVG(reservation.cost)) desc;

-- 14) List the average miles per flight by airline.

-- SELECT airline.name AS Airline, AVG(miles) AS 'Avg Miles Per Flight' FROM airline INNER JOIN flight ON airline.ID = flight.airlineID GROUP BY Airline;

-- 15) Which airlines had flights that arrived early?

-- SELECT airline.name AS Airline FROM airline INNER JOIN flight ON airline.ID = flight.airlineID WHERE (actualArriveDateTime < scheduledArriveDateTime) LIMIT 1;
