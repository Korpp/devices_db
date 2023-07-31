SELECT device_name, model FROM devices
INNER JOIN laptops
ON devices.laptop_id = laptops.laptop_id