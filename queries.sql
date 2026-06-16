-- Create Locations Table
CREATE TABLE Locations (
    LocationID INT PRIMARY KEY,
    AreaName VARCHAR(100),
    ZoneType VARCHAR(50)
);

-- Create Riders Table (Upgraded with personal and fleet details)
CREATE TABLE Riders (
    RiderID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    LicenseNumber VARCHAR(20),
    PhoneNumber VARCHAR(15),
    VehicleType VARCHAR(50),  
    Status VARCHAR(20)        
);

-- Create Bottlenecks Table
CREATE TABLE Bottlenecks (
    BottleneckID INT PRIMARY KEY,
    FrictionType VARCHAR(100),
    SeverityLevel VARCHAR(20),
    Description VARCHAR(255)
);

-- Create Trips Master Fact Table
CREATE TABLE Trips_Logistics_Orders (
    OrderID INT PRIMARY KEY,
    RiderID INT,
    PickupLocationID INT,
    DropoffLocationID INT,
    BottleneckID INT NULL, 
    RequestedTime DATETIME,
    EstimatedDeliveryTime_Min INT,
    ActualDeliveryTime_Min INT,
    Fare_Naira DECIMAL(10,2),
    TripStatus VARCHAR(30),
    -- Relationships
    FOREIGN KEY (RiderID) REFERENCES Riders(RiderID),
    FOREIGN KEY (PickupLocationID) REFERENCES Locations(LocationID),
    FOREIGN KEY (DropoffLocationID) REFERENCES Locations(LocationID),
    FOREIGN KEY (BottleneckID) REFERENCES Bottlenecks(BottleneckID)
);


-- ========================================================
-- 3. POPULATE THE DATASETS (DML)
-- ========================================================

-- Insert Ibadan Locations Hubs
INSERT INTO Locations (LocationID, AreaName, ZoneType) VALUES
(1, 'Challenge Junction', 'Commercial Hub'),
(2, 'Iwo Road', 'Transit Corridor'),
(3, 'Mokola Roundabout', 'Commercial Hub'),
(4, 'Bodija', 'Residential & Market'),
(5, 'Ojoo Motor Park', 'Transit Corridor');

-- Insert Your 40-Row Rider Expansion Dataset
INSERT INTO Riders (RiderID, FirstName, LastName, DateOfBirth, LicenseNumber, PhoneNumber, VehicleType, Status) VALUES
(101, 'Olumide', 'Akinyemi', '1995-04-12', 'LA-2354-AA', '+2347054985627', 'Motorcycle', 'Active'),
(102, 'Chinelo', 'Okafor', '1992-08-23', 'LA-2355-BB', '+2348054985628', 'Bicycle', 'Active'),
(103, 'Emeka', 'Nwosu', '1988-11-05', 'LA-2356-CC', '+2349054985629', 'Tricycle', 'Offline'),
(104, 'Aisha', 'Abdullahi', '1990-02-14', 'LA-2357-DD', '+2347054985630', 'Motorcycle', 'Active'),
(105, 'Tunde', 'Ogunleye', '1993-06-30', 'LA-2358-EE', '+2348054985631', 'Bicycle', 'Offline'),
(106, 'Sade', 'Balogun', '1994-09-18', 'LA-2359-FF', '+2349054985632', 'Car', 'Active'),
(107, 'Kemi', 'Adebayo', '1991-12-25', 'LA-2360-GG', '+2347054985633', 'Motorcycle', 'Inactive'),
(108, 'Bola', 'Ojo', '1989-03-10', 'LA-2361-HH', '+2348054985634', 'Bicycle', 'Offline'),
(109, 'Femi', 'Adesina', '1996-07-15', 'LA-2362-II', '+2349054985635', 'Car', 'Active'),
(110, 'Yemi', 'Adewale', '1990-10-20', 'LA-2363-JJ', '+2347054985636', 'Motorcycle', 'Active'),
(111, 'Nkechi', 'Eze', '1992-01-05', 'LA-2364-KK', '+2348054985637', 'Bicycle', 'Active'),
(112, 'Chinedu', 'Okeke', '1987-05-18', 'LA-2365-LL', '+2349054985638', 'Car', 'Offline'),
(113, 'Funmi', 'Akinola', '1993-09-12', 'LA-2366-MM', '+2347054985639', 'Motorcycle', 'Active'),
(114, 'Segun', 'Ogunbiyi', '1989-12-30', 'LA-2367-NN', '+2348054985640', 'Bicycle', 'Active'),
(115, 'Zainab', 'Abubakar', '1991-04-22', 'LA-2368-OO', '+2349054985641', 'Car', 'Offline'),
(116, 'Bayo', 'Adewumi', '1994-11-11', 'LA-2369-PP', '+2347054985642', 'Motorcycle', 'Active'),
(117, 'Kemi', 'Ogunleye', '1990-03-15', 'LA-2370-QQ', '+2348054985643', 'Bicycle', 'Offline'),
(118, 'Emeka', 'Nwosu', '1988-11-05', 'LA-2371-RR', '+2349054985644', 'Car', 'Active'),
(119, 'Aisha', 'Abdullahi', '1990-02-14', 'LA-2372-SS', '+2347054985645', 'Motorcycle', 'Inactive'),
(120, 'Tunde', 'Ogunleye', '1993-06-30', 'LA-2373-TT', '+2348054985646', 'Bicycle', 'Offline'),
(121, 'Sade', 'Balogun', '1994-09-18', 'LA-2374-UU', '+2349054985647', 'Car', 'Active'),
(122, 'Kemi', 'Adebayo', '1991-12-25', 'LA-2375-VV', '+2347054985648', 'Motorcycle', 'Active'),
(123, 'Bola', 'Ojo', '1989-03-10', 'LA-2376-WW', '+2348054985649', 'Bicycle', 'Inactive'),
(124, 'Femi', 'Adesina', '1996-07-15', 'LA-2377-XX', '+2349054985650', 'Car', 'Active'),
(125, 'Yemi', 'Adewale', '1990-10-20', 'LA-2378-YY', '+2347054985651', 'Motorcycle', 'Active'),
(126, 'Nkechi', 'Eze', '1992-01-05', 'LA-2379-ZZ', '+2348054985652', 'Bicycle', 'Active'),
(127, 'Chinedu', 'Okeke', '1987-05-18', 'LA-2380-AA1', '+2349054985653', 'Car', 'Offline'),
(128, 'Funmi', 'Akinola', '1993-09-12', 'LA-2381-BB1', '+2347054985654', 'Motorcycle', 'Inactive'),
(129, 'Segun', 'Ogunbiyi', '1989-12-30', 'LA-2382-CC1', '+2348054985655', 'Bicycle', 'Active'),
(130, 'Zainab', 'Abubakar', '1991-04-22', 'LA-2383-DD1', '+2349054985656', 'Car', 'Offline'),
(131, 'Bayo', 'Adewumi', '1994-11-11', 'LA-2384-EE1', '+2347054985657', 'Motorcycle', 'Active'),
(132, 'Kemi', 'Ogunleye', '1990-03-15', 'LA-2385-FF1', '+2348054985658', 'Bicycle', 'Offline'),
(133, 'Emeka', 'Nwosu', '1988-11-05', 'LA-2386-GG1', '+2349054985659', 'Car', 'Active'),
(134, 'Aisha', 'Abdullahi', '1990-02-14', 'LA-2387-HH1', '+2347054985660', 'Motorcycle', 'Inactive'),
(135, 'Tunde', 'Ogunleye', '1993-06-30', 'LA-2388-II1', '+2348054985661', 'Bicycle', 'Offline'),
(136, 'Sade', 'Balogun', '1994-09-18', 'LA-2389-JJ1', '+2349054985662', 'Car', 'Active'),
(137, 'Kemi', 'Adebayo', '1991-12-25', 'LA-2390-KK1', '+2347054985663', 'Motorcycle', 'Active'),
(138, 'Bola', 'Ojo', '1989-03-10', 'LA-2391-LL1', '+2348054985664', 'Bicycle', 'Inactive'),
(139, 'Femi', 'Adesina', '1996-07-15', 'LA-2392-MM1', '+2349054985665', 'Car', 'Active'),
(140, 'Yemi', 'Adewale', '1990-10-20', 'LA-2393-NN1', '+2347054985666', 'Motorcycle', 'Active');

-- Insert Ibadan Operational Bottleneck Lookup Catalog
INSERT INTO Bottlenecks (BottleneckID, FrictionType, SeverityLevel, Description) VALUES
(201, 'Traffic Gridlock', 'High', 'Severe congestion at major roundabouts/junctions like Iwo Road or Challenge during peak hours.'),
(202, 'Fuel Scarcity Delay', 'Critical', 'Long queues at filling stations forcing riders offline or causing long transit delays.'),
(203, 'Network / GPS Blackout', 'Medium', 'Poor internet connectivity resulting in lost tracking or inability to accept incoming orders.'),
(204, 'Local Authority / Task Force Hold', 'High', 'Delays caused by local traffic management or municipal task force checks on vehicle papers.'),
(205, 'Cash / Change Friction', 'Low', 'Delays at point of delivery due to customers paying with large denominations or network issues with bank transfers.');

-- Insert Massive Combined Trip Fact Data Logs
INSERT INTO Trips_Logistics_Orders (OrderID, RiderID, PickupLocationID, DropoffLocationID, BottleneckID, RequestedTime, EstimatedDeliveryTime_Min, ActualDeliveryTime_Min, Fare_Naira, TripStatus) VALUES
(5001, 101, 1, 4, 201, '2026-06-12 08:15:00', 25, 55, 3500.00, 'Completed'), 
(5002, 102, 2, 3, NULL, '2026-06-12 09:00:00', 20, 22, 2200.00, 'Completed'), 
(5003, 104, 3, 5, 204, '2026-06-12 09:45:00', 30, NULL, 0.00, 'Cancelled'), 
(5004, 106, 5, 1, 201, '2026-06-12 17:30:00', 40, 95, 5500.00, 'Completed'), 
(5005, 110, 4, 2, 205, '2026-06-12 11:15:00', 15, 30, 1800.00, 'Completed'), 
(5006, 113, 2, 1, 202, '2026-06-12 12:00:00', 35, 80, 4000.00, 'Completed'), 
(5007, 116, 1, 5, NULL, '2026-06-12 13:30:00', 35, 33, 3800.00, 'Completed'), 
(5008, 121, 3, 2, 203, '2026-06-12 14:15:00', 18, 45, 2000.00, 'Completed'), 
(5009, 125, 4, 1, NULL, '2026-06-12 15:00:00', 22, 25, 2400.00, 'Completed'), 
(5010, 131, 2, 4, 201, '2026-06-12 18:00:00', 25, 70, 3200.00, 'Completed'), 
(5011, 133, 5, 3, 204, '2026-06-12 10:30:00', 28, 65, 3000.00, 'Completed'), 
(5012, 136, 1, 2, 202, '2026-06-12 11:45:00', 45, NULL, 0.00, 'Cancelled'), 
(5013, 137, 3, 4, NULL, '2026-06-12 13:00:00', 12, 14, 1500.00, 'Completed'), 
(5014, 139, 2, 5, 203, '2026-06-12 16:20:00', 20, NULL, 0.00, 'Cancelled'), 
(5015, 140, 4, 3, 205, '2026-06-12 16:45:00', 15, 28, 1700.00, 'Completed'), 
(5016, 141, 1, 2, NULL, '2026-06-12 17:00:00', 25, 27, 2800.00, 'Completed'), 
(5017, 142, 2, 4, 201, '2026-06-12 18:30:00', 25, 65, 3200.00, 'Completed'), 
(5018, 143, 3, 1, NULL, '2026-06-12 19:00:00', 30, 32, 3400.00, 'Completed'), 
(5019, 144, 4, 2, 202, '2026-06-12 20:00:00', 35, 85, 4200.00, 'Completed'), 
(5020, 145, 5, 3, 204, '2026-06-12 21:00:00', 40, 90, 5000.00, 'Completed'), 
(5021, 146, 1, 4, NULL, '2026-06-12 22:00:00', 25, 28, 3000.00, 'Completed'), 
(5022, 147, 2, 5, 205, '2026-06-12 23:00:00', 15, 35, 1900.00, 'Completed'), 
(5023, 148, 3, 1, NULL, '2026-06-12 23:30:00', 30, 32, 3400.00, 'Completed'), 
(5024, 149, 4, 2, 201, '2026-06-12 23:45:00', 25, 75, 3300.00, 'Completed'), 
(5025, 150, 5, 4, NULL, '2026-06-12 23:59:00', 20, 25, 2400.00, 'Completed'), 
(5026, 151, 1, 3, 202, '2026-06-13 00:15:00', 35, 85, 4200.00, 'Completed'), 
(5027, 152, 2, 4, 201, '2026-06-13 01:00:00', 25, 65, 3200.00, 'Completed'), 
(5028, 153, 3, 5, NULL, '2026-06-13 02:00:00', 20, 22, 2400.00, 'Completed'), 
(5029, 154, 4, 1, 202, '2026-06-13 03:00:00', 35, 85, 4200.00, 'Completed'), 
(5030, 155, 5, 2, 204, '2026-06-13 04:00:00', 40, 90, 5000.00, 'Completed'), 
(5031, 156, 1, 4, NULL, '2026-06-13 05:00:00', 25, 28, 3000.00, 'Completed'), 
(5032, 157, 2, 5, 205, '2026-06-13 06:00:00', 15, 35, 1900.00, 'Completed'), 
(5033, 158, 3, 1, NULL, '2026-06-13 07:00:00', 30, 32, 3400.00, 'Completed'), 
(5034, 159, 4, 2, 201, '2026-06-13 08:00:00', 25, 75, 3300.00, 'Completed'), 
(5035, 160, 5, 4, NULL, '2026-06-13 09:00:00', 20, 25, 2400.00, 'Completed'), 
(5036, 161, 1, 3, 202, '2026-06-13 10:00:00', 35, 85, 4200.00, 'Completed'), 
(5037, 162, 2, 4, 201, '2026-06-13 11:00:00', 25, 65, 3200.00, 'Completed'), 
(5038, 163, 3, 5, NULL, '2026-06-13 12:00:00', 20, 22, 2400.00, 'Completed'), 
(5039, 164, 4, 1, 202, '2026-06-13 13:00:00', 35, 85, 4200.00, 'Completed'), 
(5040, 165, 5, 2, 204, '2026-06-13 14:00:00', 40, 90, 5000.00, 'Completed'), 
(5041, 166, 1, 4, NULL, '2026-06-13 15:00:00', 25, 28, 3000.00, 'Completed'), 
(5042, 167, 2, 5, 205, '2026-06-13 16:00:00', 15, 35, 1900.00, 'Completed'), 
(5043, 168, 3, 1, NULL, '2026-06-13 17:00:00', 30, 32, 3400.00, 'Completed'), 
(5044, 169, 4, 2, 201, '2026-06-13 18:00:00', 25, 75, 3300.00, 'Completed'), 
(5045, 170, 5, 4, NULL, '2026-06-13 19:00:00', 20, 25, 2400.00, 'Completed'), 
(5046, 171, 1, 3, 202, '2026-06-13 20:00:00', 35, NULL, NULL, 'Cancelled'), 
(5047, 172, 2, 4, 201, '2026-06-13 21:00:00', 25, 65, 3200.00, 'Completed'), 
(5048, 173, 3, 5, NULL, '2026-06-13 22:00:00', 20, 22, 2400.00, 'Completed'), 
(5049, 174, 4, 1, 202, '2026-06-13 23:00:00', 35, 85, 4200.00, 'Completed'), 
(5050, 175, 5, 2, 204, '2026-06-14 00:00:00', 40, NULL, NULL, 'Cancelled'), 
(5051, 176, 1, 4, NULL, '2026-06-14 01:00:00', 25, 28, 3000.00, 'Completed'), 
(5052, 177, 2, 5, 205, '2026-06-14 02:00:00', 15, 35, 1900.00, 'Completed'), 
(5053, 178, 3, 1, NULL, '2026-06-14 03:00:00', 30, 32, 3400.00, 'Completed'), 
(5054, 179, 4, 2, 201, '2026-06-14 04:00:00', 25, 75, 3300.00, 'Completed'), 
(5055, 180, 5, 4, NULL, '2026-06-14 05:00:00', 20, 25, 2400.00, 'Completed'), 
(5056, 181, 1, 3, 202, '2026-06-14 06:00:00', 35, 85, 4200.00, 'Completed');


-- ========================================================
-- 4. THE CORE DATA ANALYSIS METRIC DIAGNOSTIC QUERY
-- ========================================================
SELECT 
    b.FrictionType,
    COUNT(t.OrderID) AS Total_Incidents,
    AVG(t.ActualDeliveryTime_Min - t.EstimatedDeliveryTime_Min) AS Avg_Extra_Delay_Minutes,
    SUM(CASE WHEN t.TripStatus LIKE 'Cancelled%' THEN 1 ELSE 0 END) AS Total_Cancellations
FROM Trips_Logistics_Orders t
JOIN Bottlenecks b ON t.BottleneckID = b.BottleneckID
GROUP BY b.FrictionType
ORDER BY Avg_Extra_Delay_Minutes DESC;
