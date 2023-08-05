CREATE VIEW subs_devices AS 
SELECT leasing.leasing_id, devices.device_name, subscribers.company_name FROM leasing
INNER JOIN devices ON devices.device_id = leasing.device_id
INNER JOIN subscribers ON subscribers.subscriber_id = leasing.subscriber_id;