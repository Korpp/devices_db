CREATE TABLE devices(
device_id SERIAL PRIMARY KEY NOT NULL,
	laptop_id INTEGER REFERENCES laptops(laptop_id) NOT NULL,
	device_name VARCHAR(100) UNIQUE NOT NULL,
	device_status VARCHAR(100) NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
);