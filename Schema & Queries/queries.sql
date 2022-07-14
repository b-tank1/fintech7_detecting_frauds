--count of small transactions by cardholders
create or replace view vw_small_transaction_cardholders as
select h.name, count(*) as count from transaction t
inner join credit_card c
on t.card = c.card
inner join card_holder h
on c.cardholder_id = h.id
where t.amount < 2
group by h.name
order by count(*) desc

--count of all transactions by cardholders with most small transactions
CREATE OR REPLACE VIEW vw_top_small_transaction_cardholders
 AS
 SELECT h.name,
    count(*) AS count
   FROM transaction t
     JOIN credit_card c ON t.card = c.card
     JOIN card_holder h ON c.cardholder_id = h.id
  WHERE (h.name::text IN ( SELECT h_1.name
           FROM transaction t_1
             JOIN credit_card c_1 ON t_1.card = c_1.card
             JOIN card_holder h_1 ON c_1.cardholder_id = h_1.id
          WHERE t_1.amount < 2
          GROUP BY h_1.name
         HAVING count(*) > 20))
  GROUP BY c.cardholder_id, h.name
  ORDER BY (count(*)) DESC;

--top 100 transactions by value between 7 and 9 am
create view vw_early_morning_transactions as
select t.date, t.amount, h.name from transaction t
inner join credit_card c
on t.card = c.card
inner join card_holder h
on c.cardholder_id = h.id
where date_part('hour', t.date) between 7 and 9
order by t.amount desc
limit 100

--number of transactions over 500 during each hour of the day
CREATE OR REPLACE VIEW vw_high_value_transaction_hours AS
 SELECT date_part('hour', date) AS hour, count(*) AS count
   FROM transaction
  WHERE amount >= 500
  GROUP BY date_part('hour', date)
  ORDER BY date_part('hour', date);

--merchants with most small amounts
create view vw_small_transaction_merchants as
select m.name, count(*) from transaction t
inner join merchant m
on t.id_merchant = m.id
where t.amount < 2
group by m.name
order by count(*) desc

select cardholder_id, stddev(amount) from transaction t
inner join credit_card c
on t.card = c.card
group by cardholder_id

        select distinct date_part('month', t.date) as period
        from transaction t 
        inner join credit_card c on t.card = c.card
        where c.cardholder_id = 25 and t.date between '2018-01-01' and '2018-06-30'