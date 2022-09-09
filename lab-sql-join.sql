use sakila;
select * from film;
select * from film_category;
select * from category;

#1.List the number of films per category.
 
 SELECT 
    c.name, COUNT(f.title) AS number_of_films
FROM
    category c
        LEFT JOIN
    film_category fc ON c.category_id = fc.category_id
        JOIN
    film AS f ON f.film_id = fc.film_id
GROUP BY name;


#2.Display the first and the last names, as well as the address, of each staff member.
select * from staff;

SELECT 
    s.first_name, s.last_name, a.address
FROM
    staff AS s
        JOIN
    address AS a ON a.address_id = s.address_id;

#3.Display the total amount rung up by each staff member in August 2005
select * from staff;
select * from payment;

SELECT 
    s.first_name, s.last_name, SUM(p.amount)
FROM
    staff s
        LEFT JOIN
    payment p ON s.staff_id = p.staff_id
WHERE
    MONTH(payment_date) = 08
        AND YEAR(payment_date) = 2005
GROUP BY first_name , last_name
ORDER BY last_name ASC;

#4.List all films and the number of actors who are listed for each film.
select * from film;
select * from sakila.film_actor;

SELECT 
    f.title AS films, COUNT(a.actor_id) AS actors
FROM
    film f
        JOIN
    film_actor a ON f.film_id = a.film_id
GROUP BY title;

#5.Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
# List the customers alphabetically by their last names.
select * from payment;
select * from customer;

SELECT 
    c.first_name, c.last_name, SUM(p.amount) total_amount
FROM
    customer AS c
        LEFT JOIN
    payment AS p ON p.customer_id = c.customer_id
GROUP BY first_name , last_name
ORDER BY last_name ASC;

