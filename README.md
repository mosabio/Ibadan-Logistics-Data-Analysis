# Optimizing Ride-Hailing & Logistics Operations in Ibadan: A Bottleneck Analysis
**Author:** [Your Name]  
**Role:** Junior Data Analyst  
**Tools Used:** SQL (DDL, DML, Joins, Aggregations), Data Visualization  

## 1. Problem Statement
In rapidly expanding secondary markets like Ibadan, Nigeria, logistics and ride-hailing platforms face distinct localized operational challenges. 
Unpredictable transit corridors, regulatory checks, fuel availability, and digital network drops disrupt delivery windows and customer retention. 
This project simulates an operational ecosystem in Ibadan to identify, measure, and analyze which bottlenecks create the most critical threats to business delivery SLAs.

## 2. Relational Database Architecture
To diagnose these issues without relying on unavailable real-world internal datasets, I designed a 4-table relational database model simulating local supply chain interactions:
- **Locations**: Dimensions tracking key transport hubs (Challenge Junction, Iwo Road, Mokola Roundabout, Bodija, Ojoo Motor Park).
- **Riders**: Profiling 40 active/offline fleet operators across multiple vehicle tiers (Motorcycles, Tricycles, Cars, Bicycles).
- **Bottlenecks**: An operational lookup catalog indexing localized delays and severity levels.
- **Trips_Logistics_Orders**: The central fact table linking the entities together and logging actual vs. estimated delivery performance.

## 3. Key Analytical Insights
Running aggregations against our 56 logged operational entries yielded the following metrics:
- 🚨 **Fuel Scarcity Delay**: Represents the single most destructive bottleneck, responsible for adding an average of **49 extra minutes** per trip and accounting for critical order cancellations.
- ⚠️ **Regulatory Friction**: Local authority and task force stops cause extreme operational disruption, capturing an average delay of **46 minutes per incident**.
- 📈 **Traffic Frequency**: Gridlock at major roundabouts (such as Iwo Road during rush hours) is the most frequent friction point (11 occurrences),
- introducing a baseline penalty of **44 minutes** to completed trips.

## 4. Business Recommendations
1. **Fleet Tier Allocation**: Because traffic gridlock is highly frequent, transition high-priority micro-deliveries away from four-wheel
2. vehicles to agile motorcycle fleets during peak commute hours along major transit corridors.
3. **Buffer Time Adjustments**: Integrate an automated 45-minute dynamic buffer into customer-facing ETA calculations when route telemetry indicates active fuel station queues or localized task force checkpoints near transit bottlenecks.
