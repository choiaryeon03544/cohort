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


#

SELECT 
		rental.*,
		LEFT(first_rental.first_time,7) Month 

FROM 
		rental, first_rental, cohort_size, payment 


WHERE
		rental.customer_id = first_rental.customer_id
		AND cohort_size.month = LEFT(first_rental.first_time,7)
		AND payment.rental_id = rental.rental_id

;



# WHERE 을 JOIN으로 

SELECT 
		rental.*,
		LEFT(first_rental.first_time,7) Month 

FROM 
		rental

			JOIN first_rental
			ON rental.customer_id = first_rental.customer_id
			
			JOIN cohort_size 
			ON cohort_szie.month = LEFT(first_rental.fitst_time,7)
			
			JOIN payment
			ON payment.rental_id = rental.rental_id

;