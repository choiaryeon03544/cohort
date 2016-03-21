# Customer's First Rental 

DROP TEMPORARY TABLE IF EXISTS first_rental;
CREATE TEMPORARY TABLE first_rental

SELECT customer_id, MIN(rental_date) first_time

FROM rental

GROUP BY customer_id

;

SELECT * FROM first_rental

;

# Cohort Size

DROP TEMPORARY TABLE IF EXISTS cohort_size;
CREATE TEMPORARY TABLE cohort_size

SELECT 
		LEFT(first_time,7)Month,
		COUNT(*) num

FROM first_rental

GROUP BY 1
;