/* Database schema to keep the structure of entire database. */

CREATE DATABASE clinic_db;

-- \c clinic_db;

CREATE TABLE patients(
    id INT NOT NULL generated always as identity,
    name varchar(100) NOT NULL,
    date_of_birth date,
    primary key(id)
);

CREATE TABLE medical_histories(
    id INT NOT NULL generated always as identity,
    admitted_at timestamp,
    patient_id int NOT NULL,
    status varchar(100) NOT NULL,
    primary key(id),
    foreign key(patient_id) references patients(id)
);

CREATE TABLE treatments(
    id INT NOT NULL generated always as identity,
    type varchar(100) NOT NULL,
    name varchar(100) not null,
    primary key(id)
);

CREATE TABLE invoices(
    id INT NOT NULL generated always as identity,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history__id int, 
    primary key(id),
    foreign key(medical_history__id) references medical_histories(id)
);

CREATE TABLE invoice_items(
    id INT NOT NULL generated always as identity,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int,
    treatment_id int,
    primary key(id),
    foreign key(invoice_id) references invoices(id),
    foreign key(treatment_id) references treatments(id)
);

CREATE TABLE diagnostic(
    treat_id INT NOT NULL,
    med_hist_id INT NOT NULL,
    PRIMARY KEY(treat_id, med_hist_id)
    foreign key(treat_id) references treatments(id),
    foreign key(med_hist_id) references medical_historie(id),
);
