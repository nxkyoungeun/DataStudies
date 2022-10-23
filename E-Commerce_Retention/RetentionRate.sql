-- 고객의 주문 날짜를 월 단위로 환산한 테이블
WITH records_preprocessed AS (
  SELECT r.customer_id
       , r.order_id
       , r.order_date
       , c.first_order_date
       , DATE_FORMAT(r.order_date, '%Y-%m-01') AS order_month
       , DATE_FORMAT(c.first_order_date, '%Y-%m-01') AS first_order_month
  FROM records AS r 
    INNER JOIN customer_stats AS c ON r.customer_id = c.customer_id
)

-- Retention Rate 쿼리
SELECT MONTHNAME(first_order_month) AS first_order_month
     , COUNT(DISTINCT(customer_id)) AS month0
     , ROUND(COUNT(DISTINCT CASE WHEN DATE_ADD(first_order_month, INTERVAL 1 month) = order_month THEN customer_id END) / COUNT(DISTINCT(customer_id)) * 100, 2) month1
     , ROUND(COUNT(DISTINCT CASE WHEN DATE_ADD(first_order_month, INTERVAL 2 month) = order_month THEN customer_id END) / COUNT(DISTINCT(customer_id)) * 100, 2) month2
     , ROUND(COUNT(DISTINCT CASE WHEN DATE_ADD(first_order_month, INTERVAL 3 month) = order_month THEN customer_id END) / COUNT(DISTINCT(customer_id)) * 100, 2) month3
     , ROUND(COUNT(DISTINCT CASE WHEN DATE_ADD(first_order_month, INTERVAL 4 month) = order_month THEN customer_id END) / COUNT(DISTINCT(customer_id)) * 100, 2) month4
     , ROUND(COUNT(DISTINCT CASE WHEN DATE_ADD(first_order_month, INTERVAL 5 month) = order_month THEN customer_id END) / COUNT(DISTINCT(customer_id)) * 100, 2) month5
     , ROUND(COUNT(DISTINCT CASE WHEN DATE_ADD(first_order_month, INTERVAL 6 month) = order_month THEN customer_id END) / COUNT(DISTINCT(customer_id)) * 100, 2) month6
     , ROUND(COUNT(DISTINCT CASE WHEN DATE_ADD(first_order_month, INTERVAL 7 month) = order_month THEN customer_id END) / COUNT(DISTINCT(customer_id)) * 100, 2) month7
     , ROUND(COUNT(DISTINCT CASE WHEN DATE_ADD(first_order_month, INTERVAL 8 month) = order_month THEN customer_id END) / COUNT(DISTINCT(customer_id)) * 100, 2) month8
     , ROUND(COUNT(DISTINCT CASE WHEN DATE_ADD(first_order_month, INTERVAL 9 month) = order_month THEN customer_id END) / COUNT(DISTINCT(customer_id)) * 100, 2) month9
     , ROUND(COUNT(DISTINCT CASE WHEN DATE_ADD(first_order_month, INTERVAL 10 month) = order_month THEN customer_id END) / COUNT(DISTINCT(customer_id)) * 100, 2) month10
     , ROUND(COUNT(DISTINCT CASE WHEN DATE_ADD(first_order_month, INTERVAL 11 month) = order_month THEN customer_id END) / COUNT(DISTINCT(customer_id)) * 100, 2) month11
FROM records_preprocessed
GROUP BY first_order_month