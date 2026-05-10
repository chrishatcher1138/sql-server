--13857B067867




create database vin_decoder

use vin_decoder

drop table if exists manufacturer
drop table if exists dbo.vin_detail

create table manufacturer
	(id int identity(1, 1),
	name varchar(30),
	constraint PK_manufacturer primary key clustered (id))

create table vin_header
	(id int identity(1, 1),
	manufacturer_id int,
	year_start varchar(4),
	year_end varchar(4),
	total_digits smallint,
	dynamic_digits bit,
	constraint PK_vin primary key clustered (id))

create table vin_detail
	(id int identity(1, 1),
	vin_header_id int,
	def varchar(30),
	position smallint,
	digits smallint,
	constraint PK_vin_detail primary key clustered (id))

go

insert into dbo.manufacturer
	(name)
values ('GM')

insert into dbo.vin_header
	(manufacturer_id, year_start, year_end, total_digits, dynamic_digits)
values (1, 1972, 1980, 13, 0)

insert into dbo.vin_detail
	(vin_header_id, def, position, digits)
values (1, 1, 1, 1),
	(1, 2, 2, 1),
	(1, 3, 3, 2),
	(1, 4, 5, 1),
	(1, 5, 6, 1),
	(1, 6, 7, 1),
	(1, 7, 8, 6)

select * from dbo.vin_detail

create table dbo.digit_definition
	(id int identity(1, 1),
	definition_name varchar(30),
	manufacturer_id int,
	year_start varchar(4),
	year_end varchar(4),
	constraint PK_digit_definition primary key clustered (id))

drop table if exists dbo.digit_values
create table dbo.digit_values
	(id int identity(1, 1),
	digit_definition_id int,
	code varchar(10),
	val varchar(100),
	year_start varchar(4),
	year_end varchar(4),
	constraint PK_digit_values primary key clustered (id))

insert into dbo.digit_definition
	(definition_name, manufacturer_id, year_start, year_end)
values ('GM Division', 1, '1972', '1980'),
	('Series', 1, '1972', '1980'),
	('Body style', 1, '1972', '1980'),
	('Engine Type', 1, '1972', '1980'),
	('Model Year', 1, '1972', '1980'),
	('Final Assembly Plant', 1, '1972', '1980'),
	('Production Sequence', 1, '1972', '1980')

select * from dbo.digit_definition

truncate table dbo.digit_values

insert into dbo.digit_values
	(digit_definition_id, code, val, year_start, year_end)
values (1, '1', 'Chevrolet', '1972', '1980'),
	(2, 'Z', 'Corvette', '1972', '1980'),
	(3, '37', 'Hardtop Coupe', '1972', '1977'),
	(3, '67', 'Convertible Coupe', '1972', '1977'),
	(3, '87', 'Hardtop Coupe', '1978', '1980'),
	(4, 'J', '8-350 4 Bar. Carb., RPO L48', '1972', '1975'),
	(4, 'L', '8-350 4 Bar. Carb., RPO LT1', '1972', '1972'),
	(4, 'W', '8-454 4 Bar. Carb., RPO LS5, Dual Exhaust', '1972', '1972'),
	(4, 'T', '8-350 4 Bar. Carb., RPO L82', '1973', '1975'),
	(4, 'Z', '8-454 4 Bar. Carb., RPO LS4', '1973', '1975'),
	(4, 'L', '8-350 4 Bar. Carb. Base Engine', '1976', '1979'),
	(4, 'X', '8-350 4 Bar. Carb., RPO L82', '1976', '1979'),
	(4, '8', '8-350 4 Bar. Carb. Base Engine', '1980', '1980'),
	(4, 'H', '8-350 4 Bar. Carb., RPO LG4', '1980', '1980'),
	(4, '6', '8-350 4 Bar. Carb., RPO L82', '1980', '1980'),
	(5, '2', '1972', '1972', '1980'),
	(5, '3', '1973', '1972', '1980'),
	(5, '4', '1974', '1972', '1980'),
	(5, '5', '1975', '1972', '1980'),
	(5, '6', '1976', '1972', '1980'),
	(5, '7', '1977', '1972', '1980'),
	(5, '8', '1978', '1972', '1980'),
	(5, '9', '1979', '1972', '1980'),
	(5, 'A', '1980', '1972', '1980'),
	(6, 'S', 'St. Louis', '1972', '1980'),
corvette (and MC)
	(7, '5', '5XXXXX', '1972', '1972'),
	(7, '4', '4XXXXX', '1973', '1980')

cutlass
	(7, '1', '1XXXXX', '1972', NULL) 74

select * from dbo.digit_definition

select * from manufacturer

select m.name, vh.year_start, vh.year_end, vh.total_digits, vh.dynamic_digits, dd.definition_name, dv.code, dv.val, dv.year_start, dv.year_end --, * 
from dbo.vin_header vh
join dbo.manufacturer m on vh.manufacturer_id = m.id
join dbo.vin_detail vd on vh.id = vd.vin_header_id
join dbo.digit_definition dd on vd.id = dd.id
join dbo.digit_values dv on dd.id = dv.digit_definition_id
order by 1, 2, 3, vd.position, dv.year_start, dv.year_end


vin_template
manufacturer
year range
digits
variable digits
notes
sample

vin_template_detail
vin_component_id
position
characters


vin_components
manufacturer
component name


vin_component_values
vin_component_id
code
value
year range
notes






