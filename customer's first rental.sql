# Customer's First Rental 

DROP TEMPORARY TABLE IF EXISTS first_rental;
CREATE TEMPORARY TABLE first_rental

SELECT customer_id, MIN(rental_date)

FROM rental

GROUP BY customer_id

;