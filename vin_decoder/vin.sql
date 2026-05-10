

create table VIN_components
	(id int IDENTITY(1, 1) NOT NULL,
	manufacturer_id int NOT NULL,
	component_name varchar(30) NOT NULL,
	CONSTRAINT PK_VIN_components PRIMARY KEY CLUSTERED (id))
drop TABLE dbo.VIN_component_values
CREATE TABLE dbo.VIN_component_values
	(id int IDENTITY(1, 1) NOT NULL,
	vin_component_id int NOT NULL,
	component_code varchar(10) NOT NULL,
	component_value varchar(100) NULL,
	year_start int NULL,
	year_end int NULL,
	division_code varchar(10) NULL,
	CONSTRAINT PK_VIN_component_values PRIMARY KEY CLUSTERED (id))

SELECT * FROM dbo.manufacturer

INSERT INTO dbo.VIN_components
	(manufacturer_id, component_name)
VALUES (1, 'Division'),
	(1, 'Series'),
	(1, 'Body Style'),
	(1, 'Engine Type'),
	(1, 'Model Year'),
	(1, 'Assembly Plant'),
	(1, 'Production Sequence')

create table dbo.notes
	(id int IDENTITY(1, 1),
	note varchar(max) NOT NULL,
	resolved bit NOT NULL,
	resolution varchar(max) NULL,
	CONSTRAINT PK_notes PRIMARY KEY CLUSTERED (id))

INSERT INTO dbo.VIN_component_values
	(vin_component_id, component_code, component_value, year_start, year_end, division_code)
VALUES (1, '1', 'Chevrolet', NULL, NULL, NULL),
	(2, 'E', 'Corvette', 1953, 1957, '1'),
	(2, 'J', 'Corvette', 1958, 1959, '1'),
	(2, '08', 'Corvette', 1960, 1964, '1'),
	(2, '9', 'Corvette', 1965, 1971, '1'),
	(2, 'Z', 'Corvette', 1972, 1980, '1'),
	(2, '38', 'Monte Carlo', 1970, 1971, '1'),
	(2, 'H', 'Monte Carlo', 1972, NULL, '1'),
	--(2, '01', 'Chevy II 100 4', 1960, 1965, '1'),
	--(2, '02', 'Chevy II 100 6', 1960, 1965, '1'),
	--(2, '03', 'Chevy II 300 4 Cyl.', 1960, 1965, '1'),
	--(2, '04', 'Chevy II 300, Nova 400 6 Cyl.', 1960, 1965, '1'),
	--(2, '05', 'Corvair 500', 1960, 1965, '1'),
	--(2, '07', 'Corvair 700', 1960, 1965, '1'),
	--(2, '09', 'Corvair Monza', 1960, 1965, '1'),
	--(2, '11', 'Biscayne L6', 1960, 1965, '1'),
	--(2, '12', 'Biscayne V8', 1960, 1965, '1'),
	--(2, '13', 'Biscayne Fleetmaster L6', 1960, 1961, '1'),
	--(2, '13', 'Impala SS L6', 1964, 1964, '1'),
	--(2, '14', 'Biscayne Fleetmaster V8', 1960, 1961, '1'),
	--(2, '14', 'Impala SS V8', 1964, 1964, '1'),
	--(2, '15', 'Bel Air L6', 1960, 1965, '1'),
	--(2, '16', 'Bel Air V8', 1960, 1965, '1'),
	--(2, '17', 'Impala L6', 1960, 1965, '1'),
	--(2, '18', 'Impala V8', 1960, 1965, '1'),
	
	--(2, '0', 'Corvair', 1966, 1969, '1'), 
	--(2, '1', 'Chevy II, Nova', 1966, 1968, '1'), 
	--(2, '1', 'Nova', 1969, 1971, '1'), 
	--(2, '2', 'Camaro', 1967, 1971, '1'), 
	--(2, '3', 'Chevelle, Malibu', 1966, 1971, '1'), 
	--(2, '4', 'Vega', 1970, 1971, '1'), 
	--(2, '5', 'Biscayne, Bel Air', 1966, 1971, '1'), 
	--(2, '6', 'Impala', 1966, 1968, '1'), 
	--(2, '6', 'Impala, Caprice', 1969, 1971, '1'), 

	(4, 'V', 'V8 Engine', 1955, 1955, '1'),
	(4, '2', 'V8 Engine (all types)', 1965, 1971, NULL),
	(4, '4', 'V8 Engine (all types)', 1965, 1971, NULL),
	(4, '6', 'V8 Engine (all types)', 1965, 1971, NULL),
	(4, '8', 'V8 Engine (all types)', 1965, 1971, NULL),

	(4, 'L', '350 4bbl V8 RPO LT-1', 1972, 1972, '1'),
	(4, 'W', '454 4bbl V8 RPO LS-5, Dual Exhaust', 1972, 1972, '1'),
	(4, 'J', '350 4bbl V8 RPO L48', 1972, 1975, '1'),
	(4, 'T', '350 4bbl V8 RPO L82', 1973, 1975, '1'),
	(4, 'Z', '454 4bbl V8 RPO LS-4', 1973, 1975, '1'),
	(4, 'L', '350 4bbl V8', 1976, 1979, '1'),
	(4, 'X', '350 4bbl V8 RPO L82', 1976, 1979, '1'),
	(4, '8', '350 4bbl V8', 1980, 1980, '1'),
	(4, 'H', '305 4bbl V8 RPO LG4', 1980, 1980, '1'),
	(4, '6', '350 4bbl V8 RPO L82', 1980, 1980, '1'),
	(4, 'H', '350 2bbl V8', 1972, NULL, '1'),

--	(4, 'K', '350 4bbl V8 180 HP', 1972, NULL, '1'),
--	(4, 'M', '350 4bbl V8 200 HP dual exh', 1972, NULL, '1'),
--	(4, 'U', '455 4bbl V8 250 HP dual exh',1972, NULL, '1'),
--	(4, 'V', '455 4bbl V8 270 HP dual exh', 1972, NULL, '1'),
--	(4, 'X', '455 4bbl V8 300 HP', 1972, NULL, '1'),


--A	4	140 cid	1	1972	1977
--B	4	140 cid	1	1972	1977
--D	6	250 cid	1	1972	1975
--F	V8	307 cid	2	1972	1973
--H	V8	350 cid	2	1972	1975
--J	V8	350 cid	4	1972	1975	Base Corvette (1975)
--K	V8	350 cid	4	1972	1972	Base Corvette
--L	V8	350 cid	4	1972	1972	RPO Z28 (1972), Base Corvette (1973-1974)


--R	V8	400 cid	2	1972	1974
--S	V8	402 cid	4	1972	1972	Single
--T	V8	350 cid	4	1973	1975	Z28	(1973, 1975)
--U	V8	402 cid	4	1972	, 1975	Dual exhaust
--V	V8	454 cid	4	1972	1972	Single
--W	V8	454 cid	4	1972	1972	Dual exhaust
--X	V8	454 cid	4	1973	1975	Single
--Y	V8	454 cid	4	1973	1975	Dual exhaust
--Z	V8	454 cid	4	1974	1975	Dual exhaust


	(3, '37', '2 Door Sport Coupe', 1960, 1977, NULL),
	(3, '67', '2 Door Convertible', 1960, 1977, NULL),
	(3, '87', '2 Door Hardtop Coupe', 1970, 1980, NULL),
	(3, '57', '2 Door Sport Coupe', 1970, 1971, NULL),

	(3, '11', '2 Door Sedan', 1960, 1971, NULL),
	(3, '15', '2 Door Station Wagon, 2 Seats', 1960, 1971, NULL),
	(3, '19', '4 Door Sedan', 1960, 1969, NULL),
	(3, '21', '2 Door Utility Sedan', 1960, 1969, NULL),
	(3, '35', '4 Door Station Wagon, 2 Seats – 6 Passenger', 1960, 1969, NULL),
	(3, '36', '4 Door Station Wagon, 2 Seats, Dual Acting Tailgate', 1970, 1971, NULL),
	(3, '39', '4 Door Sport Sedan', 1960, 1971, NULL),
	(3, '45', '4 Door Station Wagon, 3 Seats', 1960, 1969, NULL),
	(3, '46', '4 Door Station Wagon, 3 Seats Dual Acting Tailgate', 1970, 1971, NULL),
	(3, '47', '2 Door Sport Coupe', 1960, 1971, NULL),
	(3, '69', '4 Door Sedan', 1960, 1969, NULL),
	(3, '80', '2 Door Sedan Pickup', 1960, 1969, NULL),

	(3, '07', '2 Door Club Coupe or Sports Coupe', 1965, 1971, NULL),
	(3, '17', '2 Door Sport Coupe', 1965, 1971, NULL),
	(3, '57', '2 Door Sport Coupe', 1965, 1971, NULL),
	(3, '77', '2 Door Sport Coupe', 1965, 1971, NULL),
	(3, '27', '2 Door Club Coupe', 1965, 1971, NULL),
	(3, '55', '4 Door Vista Cruiser', 1965, 1971, NULL),	(3, '56', '4 Door Vista Cruiser', 1965, 1971, NULL),	(3, '65', '4 Door Vista Cruiser', 1965, 1971, NULL),	(3, '66', '4 Door Vista Cruiser', 1965, 1971, NULL),

	(5, '53', '1953', 1953, 1953, NULL),
	(5, '54', '1954', 1954, 1954, NULL),
	(5, '55', '1955', 1955, 1955, NULL),
	(5, '56', '1956', 1956, 1956, NULL),
	(5, '57', '1957', 1957, 1957, NULL),
	(5, '58', '1958', 1958, 1958, NULL),
	(5, '59', '1959', 1959, 1959, NULL),

	(5, '0', '1960', 1960, 1960, NULL),
	(5, '1', '1961', 1961, 1961, NULL),
	(5, '2', '1962', 1962, 1962, NULL),
	(5, '3', '1963', 1963, 1963, NULL),
	(5, '4', '1964', 1964, 1964, NULL),

	(5, '5', '1965', 1965, 1965, NULL),
	(5, '6', '1966', 1966, 1966, NULL),
	(5, '7', '1967', 1967, 1967, NULL),
	(5, '8', '1968', 1968, 1968, NULL),
	(5, '9', '1969', 1969, 1969, NULL),
	(5, '0', '1970', 1970, 1970, NULL),
	(5, '1', '1971', 1971, 1971, NULL),

	(5, '2', '1972', 1972, 1972, NULL),
	(5, '3', '1973', 1973, 1973, NULL),
	(5, '4', '1974', 1974, 1974, NULL),
	(5, '5', '1975', 1975, 1975, NULL),
	(5, '6', '1976', 1976, 1976, NULL),
	(5, '7', '1977', 1977, 1977, NULL),
	(5, '8', '1978', 1978, 1978, NULL),
	(5, '9', '1979', 1979, 1979, NULL),
	(5, 'A', '1980', 1980, 1980, NULL),

	(6, 'F', 'Flint, MI', NULL, NULL, NULL),
	(6, 'S', 'St. Louis, MO', NULL, NULL, NULL),
	(6, 'A', 'Atlanta, GA', NULL, 1971, NULL),
	(6, 'B', 'Baltimore, MD', NULL, NULL, NULL),
	(6, 'C', 'Doraville, GA', NULL, 1965, NULL),
	(6, 'D', 'Doraville, GA', 1966, NULL, NULL),
	(6, 'G', 'Framingham, MA', NULL, NULL, NULL),
	
	(6, 'FRA', 'Framingham, MA', NULL, 1971, NULL),
	
	(6, 'J', 'Janesville, WI', NULL, NULL, NULL),
	(6, 'K', 'Kansas City, MO', NULL, 1971, NULL),
	
	(6, 'X', 'Kansas City, MO', NULL, 1971, NULL),
	
	(6, 'LA', 'Lansing, MI', NULL, 1965, NULL),
	(6, 'LAN', 'Lansing, MI', NULL, 1971, NULL),
	(6, 'L', 'Los Angeles, CA', NULL, 1971, NULL),
	(6, 'L', 'Van Nuys, CA', 1971, NULL, NULL),
	(6, 'N', 'Norwood, OH', NULL, NULL, NULL),
	(6, 'O', 'Oakland, CA', NULL, 1965, NULL),
	(6, 'P', 'Pontiac, MI', 1965, 1968, NULL),
	(6, 'R', 'Arlington, TX', NULL, NULL, NULL),
	(6, 'U', 'Southgate, CA', NULL, 1965, NULL),
	(6, 'S', 'Southgate, CA', NULL, 1965, NULL),
	(6, 'C', 'Southgate, CA', 1966, 1971, NULL),
	(6, 'T', 'Tarrytown, NY', NULL, NULL, NULL),
	(6, 'W', 'Willowrun, MI', NULL, NULL, NULL),
	(6, 'Y', 'Wilmington, DE', NULL, NULL, NULL),
	(6, 'Z', 'Freemont, CA', 1965, NULL, NULL),
	(6, 'BF', 'Freemont, CA', NULL, NULL, NULL),
	(6, 'U', 'Lordstown, OH', 1969, 1971, NULL),
	(6, 'U', 'Hamtramck', 1972, NULL, NULL),
	
	(6, '1', 'Oshawa, Ont., Canada', 1966, NULL, NULL),
	(6, '1', 'Wentzville Canada', 1972, NULL, NULL),
	(6, '2', 'St. Therese, Que., Canada', 1966, NULL, NULL),
	(6, '3', 'St. Eustache', 1972, NULL, NULL),
	(6, '4', 'Scarborough', 1972, NULL, NULL),
	(6, '5', 'London', 1972, NULL, NULL),
	(6, '5', 'Bowling Green, OH', 1972, NULL, NULL),
	(6, '8', 'Shreveport', 1972, NULL, NULL),
	(6, '8', 'Fujisawa (Japan) Luv', 1972, NULL, NULL),
	(6, '9', 'Oshawa, CANADA', 1972, NULL, NULL),
	(6, 'A', 'Lakewood, GA', 1972, NULL, NULL),			
	(6, 'C', 'Lansing, MI', 1972, NULL, NULL),
	
	(6, 'E', 'Linden, NJ', NULL, NULL, NULL),
	
	(6, 'K', 'Leeds, MI', 1972, NULL, NULL),
	(6, 'K', 'Kosai', 1972, NULL, NULL),
	(6, 'M', 'Lansing, MI', 1972, NULL, NULL),
	(6, 'Q', 'Detroit, MI', 1972, NULL, NULL),
	(6, 'S', 'Ramos Arizpe', 1972, NULL, NULL),

	(1, '3', 'Oldsmobile', NULL, NULL, NULL),
	(2, '3', 'F-85', 1965, 1971, '3'),
	(2, '4', 'Cutlass', 1965, 1971, '3'),
	(2, '5', '88', 1965, 1971, '3'),
	(2, '6', 'Starfire', 1965, 1971, '3'),
	(2, '8', '98', 1965, 1971, '3'),
	(2, '9', 'Tornado', 1965, 1971, '3'),

	(2, '8', 'Super 88', 1953, 1963, '3'),
	(2, '7', '88', 1953, 1957, '3'),
	(2, '7', 'Dynamic 88', 1957, 1963, '3'),
	(2, '1', 'F-85/Cutlass', 1961, 1963, '3'),
	(2, '6', 'Starfire', 1961, 1963, '3'),
	(2, '9', '98', 1953, 1963, '3'),

	(2, '87', 'Jetstar 1', 1964, 1964, '3'),
	(2, '83', 'Jetstar 88', 1964, 1964, '3'),
	(2, '84', 'Dynamic 88', 1964, 1964, '3'),
	(2, '82', 'Cutlass', 1964, 1964, '3'),
	(2, '86', 'Starfire', 1964, 1964, '3'),
	(2, '88', '98', 1964, 1964, '3'),
	(2, '61', 'F-85 Deluxe', 1964, 1964, '3'),
	(2, '60', 'F-85', 1964, 1964, '3'),

	--(2, '31', 'F85 or Cutlass L6', 1965, 1971, '3'),
	--(2, '32', 'F85 or Cutlass V8', 1965, 1971, '3'),
	--(2, '33', 'F85 Standard V6 or L6', 1965, 1971, '3'),
	--(2, '34', 'F85 V8', 1965, 1971, '3'),
	--(2, '35', 'F85 Deluxe V6 or L6 or Cutlass L6', 1965, 1971, '3'),
	--(2, '36', 'F85 Deluxe V8 or Cutlass V8', 1965, 1971, '3'),
	--(2, '38', 'F85 Deluxe Vista Cruiser or F85 Cutlass or Cutlass Supreme V8', 1965, 1971, '3'),
	--(2, '42', 'Cutlass Supreme V8', 1965, 1971, '3'),
	--(2, '44', '442', NULL, NULL, '3'),
	--(2, '48', 'Custom Vista Cruiser V8', 1965, 1971, '3'),
	--(2, '52', 'Jetstar Eighty-Eight V8 or Delmont 88 w330 V8', 1965, 1971, '3'),
	--(2, '54', 'Jetstar, Starfire, Delmont 88 or Delta 88 V8', 1965, 1971, '3'),
	--(2, '56', 'Dynamic 88 V8 or Delmont 88 w425 V8', 1965, 1971, '3'),
	--(2, '58', 'Delta Eighty-Eight V8', 1965, 1971, '3'),
	--(2, '64', 'Delta Eighty-Eight V8 Custom', 1965, 1971, '3'),
	--(2, '66', 'Starfire V8 or Delta Eighty-Eight Royale V8', 1965, 1971, '3'),
	--(2, '84', 'Ninety-Eight V8', 1965, 1971, '3'),
	--(2, '86', 'Ninety-Eight V8', 1965, 1971, '3'),
	--(2, '94', 'Toronado V8', 1965, 1971, '3'),
	--(2, '96', 'Toronado V8', 1965, 1971, '3'),

	(2, 'D', 'F-85', 1972, NULL, '3'),
	(2, 'F', 'F-85', 1972, NULL, '3'),
	(2, 'G', 'Cutlass', 1972, NULL, '3'),
	(2, 'J', 'Cutlass Supreme', 1972, NULL, '3'),
	(2, 'K', 'Vista Cruiser', 1972, NULL, '3'),

	(4, 'H', '350 2bbl V8', 1972, NULL, '3'),
	(4, 'J', '350 2bbl V8', 1972, NULL, '3'),
	(4, 'M', '350 4bbl V8', 1972, NULL, '3'),
	(4, 'V', '455 4bbl V8', 1972, NULL, '3'),
	(4, 'X', '455 4bbl V8', 1972, NULL, '3'),

	(4, 'K', '350 4bbl V8', 1972, NULL, '3'),
	(4, 'U', '455 4bbl V8', 1972, NULL, '3'),
	(1, '6', 'Cadillac', NULL, NULL, NULL),
	(2, 'L', 'El Dorado', 1972, 1980, '6')

3J57 U 4 R109510

4th and 5th digits - Body Code. (07) 2d Club coupe or Sports Coupe, (17, 37, 57 or 77) 2d
Holiday coupe, (27 or 77) 2d Club coupe, (35 or 36) 4d Station Wagon, (39) 4d Holiday sedan,
(55, 56, 65 or 66) 4d Vista Cruiser, (67) 2d convertible.
6th digit - Model Year. (5) 1965, (6) 1966, (7) 1967, (8) 1968, (9) 1969, (0) 1970, (1) 1971
7th digit - Assembly plant. (B) Baltimore, MD, (C) Southgate, CA, (D) Doraville, GA, (E) Linden,
NJ, (G or FRA) Framingham, MA, (K or X) Kansas City, KS, (M or LAN) Lansing, MI, (R)
Arlington, TX, (Z or BF) Fremont, CA, (1) Oshawa, ON.

SELECT * FROM dbo.VIN_components

insert into dbo.notes
(note, resolved)
values ('Cleveland, OH was only represented using the COWL TAG code of EP or EUC, 1959-1964 for assembly plant', 0)


/*
chevrolet
1972



engine codes are division specific!
*/

CREATE TABLE dbo.VIN_pattern
	(id int IDENTITY(1, 1) NOT NULL,
	manufacturer_id int NOT NULL,
	division_code varchar(10) NULL,
	year_start int NOT NULL,
	year_end int NOT NULL,
	digits smallint NOT NULL,
	variable_digits bit NOT NULL,
	sample_value varchar(25) NULL,

	CONSTRAINT PK_VIN_pattern PRIMARY KEY CLUSTERED (id))

CREATE TABLE dbo.VIN_pattern_detail
	(id int IDENTITY(1, 1) NOT NULL,
--	division_code varchar(10) NULL,
	VIN_pattern_id int NOT NULL,
	VIN_component_id int NOT NULL,
	sequence_number tinyint NOT NULL,
	position tinyint NOT NULL,
	characters tinyint NOT NULL
	CONSTRAINT PK_VIN_pattern_detail PRIMARY KEY CLUSTERED (id))

SELECT * FROM dbo.VIN_pattern
select * from dbo.VIN_components
--truncate table vin_pattern

INSERT INTO dbo.VIN_pattern
	(manufacturer_id, division_code, year_start, year_end, digits, variable_digits, sample_value)
VALUES (1, '1', 1953, 1954, 10, 0, 'E53F001234'),
	(1, '1', 1955, 1955, 11, 1, 'VE55S001234'),
	(1, '1', 1956, 1959, 10, 0, 'E57S112345'),
	(1, '1', 1960, 1964, 12, 0, '00837S112345'),
	(1, NULL, 1965, 1971, 13, 0, '194675S112345'),
	(1, NULL, 1971, 1980, 13, 0, '1Z37T4S433963'),
	(1, '3', 1953, 1956, 8, 0, '538K7272'),
	(1, '3', 1957, 1963, 9, 0, '611M30847'),
	(1, '3', 1964, 1964, 10, 0, '824M040120')

truncate table dbo.VIN_pattern_detail
INSERT INTO dbo.VIN_pattern_detail
	(VIN_pattern_id, VIN_component_id, sequence_number, position, characters)
VALUES (1, 2, 1, 1, 1),
	(1, 5, 2, 2, 2),
	(1, 6, 3, 4, 1),
	(1, 7, 4, 5, 6),

	(3, 2, 1, 1, 1),
	(3, 5, 2, 2, 2),
	(3, 6, 3, 4, 1),
	(3, 7, 4, 5, 6),

	(4, 5, 1, 1, 1),
	(4, 2, 2, 2, 2),
	(4, 3, 3, 4, 2),
	(4, 6, 4, 6, 1),
	(4, 7, 5, 7, 6),

	(5, 1, 1, 1, 1),
	(5, 2, 2, 2, 1),
	(5, 4, 3, 3, 1),
	(5, 3, 4, 4, 2),
	(5, 5, 5, 6, 1),
	(5, 6, 6, 7, 1),
	(5, 7, 7, 8, 6),

	(6, 1, 1, 1, 1),
	(6, 2, 2, 2, 1),
	(6, 3, 3, 3, 2),
	(6, 4, 4, 5, 1),
	(6, 5, 5, 6, 1),
	(6, 6, 6, 7, 1),
	(6, 7, 7, 8, 6),

	(7, 5, 1, 1, 2),
	(7, 1, 2, 3, 1),
	(7, 6, 3, 4, 1),
	(7, 7, 4, 5, 4),
	(8, 5, 1, 1, 2),
	(8, 1, 2, 3, 1),
	(8, 6, 3, 4, 1),
	(8, 7, 4, 5, 5),
	(9, 2, 1, 1, 2),
	(9, 5, 2, 3, 1),
	(9, 6, 3, 4, 1),
	(9, 7, 4, 5, 6)




select * from VIN_component_values
