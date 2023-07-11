create database music ;
use music ;
select * from album2 ;
# who is senior most employee from job title ?
 select * from employee ;
#1. who is senior most employee based on job title ?
 select*  from employee order by levels desc limit 1 ;
 
 # 2. which countries have the most invoices 

select count(*) as c , billing_country , sum(total)
from invoice
group by billing_country
order by c desc;

# what are top 3 values of total invoice

select  *   from invoice
order by total desc 
limit 3  ;

  
/*
4. Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money.
 Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals
*/

 select billing_city , sum(total)  as c
 from invoice
 group by billing_city 
 order by c desc 
 limit  1 ;
 
 /* 5.
 Who is the best customer? 
 The customer who has spent the most money will be declared the best customer.
 Write a query that returns. the person who has spent the most money.
 */
 select first_name , sum(total) as m from customer as c join invoice as i on (c.customer_id = i.customer_id)
 group by first_name
 order by m desc
 limit 1;
 
 /*6.
 Write query to return the email, first name, last name, & Genre of all Rock Music listeners.
 Return your list ordered alphabetically by email starting with A
 */
SELECT DISTINCT email, first_name, last_name
 FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
JOIN invoice_line l ON i.invoice_id = l. invoice_id
join track t on l.track_id = t.track_id
join genre g on t.genre_id = g.genre_id
WHERE g.name = 'Rock'
ORDER BY email;




