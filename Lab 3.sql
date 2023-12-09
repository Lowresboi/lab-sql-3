use sakila;

-- Distinct last names of actors
select count(distinct last_name) as distinct_last_names from actor;

-- Different languages of origin for films
select count(distinct language_id) as distinct_languages from film;

-- Number of movies with PG13
select count(*) as pg13 from film where rating = 'PG-13';

-- 10 Longest movies from 2006
select title, length from film where release_year = 2006 order by length desc limit 10;

-- Using datediff
select datediff(now(), min(rental_date)) as operating_days from rental;

-- Rental info, 20 records
select rental_id, rental_date, month(rental_date) as month, dayname(rental_date) as weekday from rental limit 20;

-- Add column day_type
select rental_id, rental date, 
case when dayofweek(rental_date) in (1, 7) then 'weekend' else 'workday' end as day_type from rental limit 20;

-- Rentals in the last month
select count(*) as rentals_last_month from rental where month(rental_date) = month(now()) and year (rental_date) = year(now()); 