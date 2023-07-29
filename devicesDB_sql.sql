CREATE TABLE devices (
device_id SERIAL PRIMARY KEY,
	manufacturer VARCHAR(50),
	model VARCHAR(50),
	processor VARCHAR(50),
	graphics_card VARCHAR(50),
	memory VARCHAR(50),
	screen_size VARCHAR(50),
	resolution VARCHAR(50),
	storage VARCHAR(50),
	operating_system VARCHAR(50)
)