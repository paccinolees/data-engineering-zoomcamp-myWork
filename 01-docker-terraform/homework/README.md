3. ANS: 8007
spin up pg docker then ingest green_taxi_data.parquet to it using the script 'ingest_data_qs3.py' then query for the answer using pgcli(or pgadmin) with query: 
"
SELECT COUNT(1) FROM green_taxi_trips WHERE lpep_pickup_datetime >= '2025-11-01'
AND lpep_pickup_datetime < '2025-12-01'
AND trip_distance <= 1
"

4. ANS: 2025-11-14 15:36:27
"
select lpep_pickup_datetime from green_taxi_trips 
where trip_distance<100 
order by trip_distance desc 
limit 1
"

5. ANS: zone 74:East Harlem North 
"select "PULocationID", sum(total_amount) from green_taxi_trips where lpep_pickup_datetime>='2025-11-18' and lpep_pickup_datetime<'2025-11-19' group by "PULocationID" order by sum(total_amount) desc limit(1)"

6. ANS: zone 263:Yorkville West
"
select "DOLocationID", "tip_amount" from green_taxi_trips where lpep_pickup_datetime>='2025-11-01' and lpep_pickup_datetime<'2025-12-01' and "PULocationID" = 74 order by "tip_amount" desc limit(1)
"

7. terraform init, terraform apply -auto-approve, terraform destroy