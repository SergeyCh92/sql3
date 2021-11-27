create table if not exists list_performer(
id serial primary key,
name varchar(30) unique,
alias text not null
);

create table if not exists albums(
id serial primary key,
name_album varchar(30) unique,
year_release integer check(year_release > 0)
);

create table if not exists list_performer_albums(
id serial primary key,
id_performer integer not null references list_performer(id),
id_album integer not null references albums(id)
);

create table if not exists list_tracks(
id serial primary key,
name varchar(30) unique,
duration integer not null,
id_album integer not null references albums(id)
);

create table if not exists list_collections(
id serial primary key,
name varchar(30) unique,
year_release integer not null
);

create table if not exists list_collections_tracks(
id serial primary key,
id_collection integer not null references list_collections(id),
id_track integer not null references list_tracks(id)
);

create table if not exists list_genre(
id serial primary key,
title varchar(30) unique
);


create table if not exists list_genre_performer(
id serial primary key,
id_performer integer not null references list_performer(id),
id_genre integer not null references list_genre(id)
);