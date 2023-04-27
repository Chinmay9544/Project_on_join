----- QUESTION-1 Write a SQL query to count the number of characters except for the spaces for each actor. Return the first 10 actors' name lengths along with their names. --

use mavenmovies;

select concat(first_name,last_name) as Full_name,
length(concat(first_name,last_name)) as Length_Of_Full_Name
from actor
limit 10;

---- QUESTION-2 List all Oscar awardees(Actors who received the Oscar award) with their full names and the length of their names. -----


select concat(first_name,last_name) as Full_Name,
length(concat(first_name,last_name)) as Length_Of_Full_Name,awards
from actor_award
where actor_award.awards like '%oscar%';


----- QUESTION-3 Find the actors who have acted in the film ‘Frost Head.’ -------

select concat(a.first_name,' ',a.last_name) as Actor_Name,f.title
from actor a join film_actor fa
on a.actor_id = fa.actor_id
join film f
on f.film_id = fa.film_id
where title = 'frost head';


---- QUESTION-4 Pull all the films acted by the actor ‘Will Wilson.’ ---


select concat(a.first_name,' ',a.last_name) as Actor_Name,f.title
from actor a join film_actor fa
on a.actor_id = fa.actor_id
join film f
on f.film_id = fa.film_id
where concat(a.first_name,' ',a.last_name) = 'will wilson';



---- QUESTION-5 Pull all the films which were rented and return them in the month of May. --


select f.title,r.rental_date,r.return_date
from film f join inventory i
on f.film_id = i.film_id
join rental r
on r.inventory_id = i.inventory_id
where month(r.rental_date) = 5 and month(r.return_date) = 5;


-- QUESTION 6 Pull all the films with ‘Comedy’ category. ---------------


select f.title,c.name
from film f join film_category fc 
on f.film_id = fc.film_id
join category c
on c.category_id = fc.category_id
where c.name = 'comedy';
