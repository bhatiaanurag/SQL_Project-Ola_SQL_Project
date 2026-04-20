# OLA SQL Project

## 1. Project Overview

The OLA SQL Project is a database design and data analysis project built using SQL, based on a ride-hailing service model. The dataset represents real-world operations such as ride bookings, driver allocation, trip execution, and customer interactions.

This project demonstrates how structured data can be used to analyze transportation services, optimize operations, and generate business insights.

---

## 2. Business Objective

The primary objectives of this project are:

* To analyze ride booking patterns and customer demand
* To evaluate driver performance and ride efficiency
* To track ride completion, cancellations, and delays
* To understand revenue generation across different locations
* To support decision-making for operational improvements

---

## 3. Database Schema

The database consists of multiple interconnected tables representing the ride-hailing ecosystem.

### 3.1 Customers

Stores customer information.

| Column Name | Description                         |
| ----------- | ----------------------------------- |
| customer_id | Unique identifier for each customer |
| name        | Customer name                       |
| phone       | Contact details                     |
| city        | Customer location                   |

---

### 3.2 Drivers

Contains driver details.

| Column Name  | Description                       |
| ------------ | --------------------------------- |
| driver_id    | Unique identifier for each driver |
| name         | Driver name                       |
| vehicle_type | Type of vehicle                   |
| rating       | Driver rating                     |

---

### 3.3 Rides

Represents ride booking information.

| Column Name     | Description                              |
| --------------- | ---------------------------------------- |
| ride_id         | Unique ride identifier                   |
| customer_id     | Associated customer                      |
| driver_id       | Assigned driver                          |
| pickup_location | Pickup point                             |
| drop_location   | Destination                              |
| ride_date       | Date of ride                             |
| fare            | Ride fare                                |
| status          | Ride status (Completed, Cancelled, etc.) |

---

### 3.4 Payments

Stores payment-related details.

| Column Name    | Description               |
| -------------- | ------------------------- |
| payment_id     | Unique payment identifier |
| ride_id        | Associated ride           |
| payment_method | Mode of payment           |
| payment_status | Status of payment         |

---

## 4. Relationships Between Tables

* Customers are linked to Rides via `customer_id`
* Drivers are linked to Rides via `driver_id`
* Payments are linked to Rides via `ride_id`

This relational structure supports efficient querying and analysis of ride operations.

---

## 5. Key Features

* Structured relational database design
* Representation of real-world ride-hailing workflows
* Inclusion of ride status and payment tracking
* Enables analysis of operational efficiency and revenue
* Supports complex SQL queries using joins and aggregations

---

## 6. How to Use

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/ola-sql-project.git
   ```

2. Open your SQL environment (MySQL, PostgreSQL, SQL Server, etc.)

3. Execute the SQL script:

   ```sql
   SOURCE olasqlproject.sql;
   ```

4. Verify that all tables and data are created successfully.

5. Begin querying the dataset for analysis.

---

## 7. Analytical Use Cases

This dataset can be used to perform various analyses, such as:

* Total rides completed vs cancelled
* Revenue generated per city
* Driver performance based on ratings and completed rides
* Most active customers
* Peak ride booking times
* Payment method distribution

---

## 8. Skills Demonstrated

* SQL Database Design
* Data Modeling
* Data Analysis using SQL
* Multi-table Joins
* Aggregation and Filtering
* Business Problem Solving

---

## 9. Project Structure

```id="h72kq1"
OLA-SQL-Project/
│
├── olasqlproject.sql
└── README.md
```

---

## 10. Guidance

This project was developed under the guidance of:

Yash Jain
Future Vision Computer

---

## 11. Acknowledgements

This project is inspired by real-world ride-hailing platforms and is designed for educational and analytical purposes.

---

## 12. Contact

For any feedback, suggestions, or collaboration opportunities, feel free to connect.

---

## 13. Support

If you find this project useful, consider giving it a star on GitHub to support the work.
