# 20160323 SQL실습
# 유저를 첫번 째 렌탈일을 기준으로 나누기 (쿼리1)


DROP TEMPORARY TABLE IF EXISTS first_rental;
CREATE TEMPORARY TABLE first_rental
SELECT 
		rental.customer_id,
		MIN(rental_date) first_time

FROM rental

GROUP BY 1
;

SELECT *
FROM first_rental
;



# 각각의 cohort에 포함된 유저 수를 구한다 (쿼리2)

DROP TEMPORARY TABLE IF EXISTS cohort_size;
CREATE TEMPORARY TABLE cohort_size
SELECT 
		left(first_time, 7) month,
		COUNT(*) num
		
FROM first_rental

GROUP BY 1
;

SELECT *
FROM cohort_size
;


# 각각의 cohort, 월에 대해서 매출을 구한다 (쿼리3)


SELECT 
		rental.*,
		left(first_rental.first_time,7) cohort,
		payment.amount
		
FROM rental, first_rental, cohort_size, payment

WHERE 
		rental.customer_id = first_rental.customer_id
		AND cohort_size.month = LEFT(first_rental.first_time, 7)
		AND payment.rental_id = rental.rental_id
;
