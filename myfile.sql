create table drivers(
  id serial primary key,
  name text,
  hourly_rate money
);
insert into drivers (name, hourly_rate) values ('Nader', 25.50);
insert into drivers (name, hourly_rate) values ('Tom', 26.50);

create table taxis(
  id serial primary key,
  registration text,
  model text,
  year int
);
insert into taxis(registration, model, year) values ('CBB220', 'Holden', 2006);
insert into taxis(registration, model, year) values ('VDA445', 'Ford', 2010);
insert into taxis(registration, model, year) values ('AMX208', 'Mazda', 2011);

create table fares(
  driver_id int references drivers(id),
  taxis_id int references taxis(id),
  id serial primary key,
  trip_date timestamp,
  amount money
);
insert into fares(driver_id, taxis_id, amount) values (2, 1, 50.00);
insert into fares(driver_id, taxis_id, amount) values (1, 3, 45.00);
insert into fares(driver_id, taxis_id, amount) values (1, 2, 35.50);

create table passengers(
  fare_id int references fares(id),
  id serial primary key,
  name text,
  address text,
  phone text
);
insert into passengers(fare_id, name, address, phone) values (1, 'Nathan', '20 Dale Ave, Pagewood', '+61296677888');

create table complaints(
  driver_id int references drivers(id),
  passenger_id int references passengers(id),
  fare_id int references to fares(id),
  id serial primary key,
  fare money
);
insert into complaints(driver_id, passenger_id, fares_id, trip_date, fare) values (2, 1, 1, '2015-05-23', 55.00);
