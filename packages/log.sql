
-- *** The Lost Letter ***

-- 1. Find the id of the address with the street '900 Somerville Avenue'. 
--## JOIN addresses ON packages.from_address_id = addresses.id ##–- Matches the sender's address ID to its actual address
sqlite> SELECT packages.id, packages.contents, packages.to_address_id 
FROM packages 
JOIN addresses ON packages.from_address_id = addresses.id
WHERE addresses.address = '900 Somerville Avenue';


-- -- Tracking the delivery of the lost congratulatory letter (Package ID 384)
sqlite> SELECT scans.action, scans.timestamp, addresses.address, addresses.type
FROM scans
JOIN addresses ON scans.address_id = addresses.id
WHERE scans.package_id = 384
ORDER BY scans.timestamp;


-- *** The Devious Delivery ***
-- Finding the package related to a bath-time item (Rubber Duck)
SELECT id, contents, to_address_id
FROM packages
WHERE (contents LIKE '%duck%' OR contents LIKE '%bath%')
AND from_address_id IS NULL;

-- Tracking the delivery of the Devious Delivery (Package ID 5098)
SELECT scans.action, scans.timestamp, addresses.address, addresses.type
FROM scans
JOIN addresses ON scans.address_id = addresses.id
WHERE scans.package_id = 5098
ORDER BY scans.timestamp;


-- *** The Forgotten Gift ***
-- Finding the package sent from 109 Tileston Street
SELECT packages.id, packages.contents, packages.to_address_id
FROM packages
JOIN addresses ON packages.from_address_id = addresses.id
WHERE addresses.address = '109 Tileston Street';

-- Tracking the Forgotten Gift (Package ID 9523)
SELECT scans.action, scans.timestamp, addresses.address, addresses.type
FROM scans
JOIN addresses ON scans.address_id = addresses.id
WHERE scans.package_id = 9523
ORDER BY scans.timestamp;

