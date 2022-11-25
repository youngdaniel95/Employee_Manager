
create user reimbursementAPI with password 'password';
create database reimbursementAPI with template=template0 owner=reimbursementAPI;
alter default privileges grant all on tables to reimbursementAPI;
alter default privileges grant all on sequences to reimbursementAPI;

create table r_users(
    user_id integer primary key not null,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    email varchar(30) not null,
    password text not null
);

create table r_categories(
    category_id integer primary key not null,
    user_id integer not null,
    title varchar(20) not null,
    description varchar(50) not null
);
alter table r_categories add constraint cat_users_fk
foreign key (user_id) references r_users(user_id);

create table r_transactions(
    transaction_id integer primary key not null,
    category_id integer not null,
    user_id integer not null,
    amount numeric(10,2) not null,
    note varchar(50) not null,
    transaction_date bigint not null
);
alter table r_transactions add constraint trans_cat_fk
foreign key (category_id) references r_categories(category_id);
alter table r_transactions add constraint trans_users_fk
foreign key (user_id) references r_users(user_id);

create sequence r_users_seq increment 1 start 1;
create sequence r_categories_seq increment 1 start 1;
create sequence r_transactions_seq increment 1 start 1000;