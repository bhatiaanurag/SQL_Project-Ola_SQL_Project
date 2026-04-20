# ==============================
# CREATE DATABASE OF OLA PROJECT
# ==============================
CREATE DATABASE OLA_SQL_PROJECT;


# ==========================
# USE OF OLA DATASET PROJECT
# ==========================
USE OLA_SQL_PROJECT;


SELECT * FROM ASSEMBLY;
SELECT * FROM DURATION;
SELECT * FROM PAYMENT;
SELECT * FROM TRIP_DETAILS;
SELECT * FROM TRIPS;


# ==============
# 1. TOTAL TRIPS
# ==============
SELECT
	COUNT(DISTINCT TRIPID) AS 'TOTAL TRIPS'
FROM TRIP_DETAILS;


# ================
# 2. TOTAL DRIVERS
# ================
SELECT
	COUNT(DISTINCT DRIVER_ID) AS 'TOTAL DRIVER'
FROM TRIPS;


# =================
# 3. TOTAL EARNINGS
# =================
SELECT
	SUM(FARE) AS 'TOTAL EARNINGS'
FROM TRIPS;


# ========================
# 4. TOTAL COMPLETED TRIPS
# ========================
SELECT
	COUNT(DISTINCT TRIPID) AS 'TOTAL COMPLETED TRIPS'
FROM TRIPS;


# =================
# 5. TOTAL SEARCHES
# =================
SELECT
	SUM(SEARCHES) AS 'TOTAL SEARCHES'
FROM TRIP_DETAILS;


# ====================================
# 6. TOTAL SEARCHES WHICH GOT ESTIMATE
# ====================================
SELECT
	SUM(SEARCHES_GOT_ESTIMATE) AS 'ESTIMATED SEARCHES'
FROM TRIP_DETAILS;


# ============================
# 7. TOTAL SEARCHES FOR QUOTES
# ============================
SELECT
	SUM(SEARCHES_FOR_QUOTES) AS 'SEARCHES FOR QUOTES'
FROM TRIP_DETAILS;


# ==================================
# 8. TOTAL SEARCHES WHICH GOT QUOTES
# ==================================
SELECT
	SUM(SEARCHES_GOT_QUOTES) AS 'QUOTED SEARCHES'
FROM TRIP_DETAILS;


# ========================
# 9. TOTA DRIVER CANCELLED
# ========================
SELECT
	COUNT(*),
    SUM(DRIVER_NOT_CANCELLED)
FROM TRIP_DETAILS;


# =====================
# 10. TOTAL OTP ENTERED
# =====================
SELECT
	SUM(OTP_ENTERED) AS 'OTP ENTERED'
FROM TRIP_DETAILS;


# ==================
# 11. TOTAL END RIDE
# ==================
SELECT
	SUM(END_RIDE) AS 'RIDES END'
FROM TRIP_DETAILS;


# =============================
# 12. AVERAGE DISTANCE PER TRIP
# =============================
SELECT
	AVG(DISTANCE)
FROM TRIPS;


# =========================
# 13. AVERAGE FARE PER TRIP
# =========================
SELECT
	AVG(FARE) AS 'AVERAGE FARE PER TRIP'
FROM TRIPS;


# ======================
# 14. DISTANCE TRAVELLED
# ======================
SELECT
	SUM(DISTANCE) AS 'DISTANCE TRAVELLED'
FROM TRIPS;


# =========================================
# 15. WHICH 2 LOCATIONS HAD THE MOST TRIPS?
# =========================================
SELECT
	LOC_FROM,
    LOC_TO,
    COUNT(DISTINCT TRIPID)
FROM TRIPS
GROUP BY
	LOC_FROM,
    LOC_TO
ORDER BY
	COUNT(DISTINCT TRIPID) DESC;
    
    
# ========================
# 16. TOP 5 EARNING DRIVER
# ========================
SELECT
	DRIVER_ID,
    SUM(FARE) AS 'TOTAL FARE'
FROM TRIPS
GROUP BY
	DRIVER_ID
ORDER BY
	SUM(FARE) DESC LIMIT 5;
    
    
# ==================================
# 17. WHICH DURATION HAD MORE TRIPS?
# ==================================
SELECT *,
	RANK()
    OVER(ORDER BY CNT DESC) RNK
    FROM(SELECT
			DURATION,
            COUNT(DISTINCT TRIPID) CNT
	FROM TRIPS
    GROUP BY
		DURATION) B;
        
# AS YOU CAN SEE THAT RANK HAD BEEN GIVEN ACCORDING TO TRIPS BUT NOW WE WANT TO FILTER OUT THE DATA WHOSE RANK IS 1

SELECT *
FROM (SELECT *,
		RANK()
        OVER(ORDER BY
				CNT DESC) RNK
		FROM (SELECT DURATION,
				COUNT(DISTINCT
						TRIPID) CNT
		FROM TRIPS
			GROUP BY
				DURATION) B) C
					WHERE RNK = 1;

# AS YOU CAN SEE THAT DURATION 1 HAD MOST NUMBER OF TRIPS I.E. 53
        

# ============================
# 18. SEARCH TO ESTIMATE RATES
# ============================
SELECT
	SUM(SEARCHES_GOT_ESTIMATE)*100/
    SUM(SEARCHES) AS 'ESTIMATE RATE'
FROM TRIP_DETAILS;


# ====================================================
# 19. WHICH AREA GOT THE HIGHEST FARES, CANCELLATIONS?
# ====================================================
SELECT *
FROM (SELECT *,
		RANK()
        OVER(ORDER BY
				FARE DESC) RNK
FROM (SELECT
		LOC_FROM,
        SUM(FARE) AS FARE
		FROM TRIPS
        GROUP BY
			LOC_FROM) B) C
				WHERE
					RNK = 1;
                    
# AS WE CAN SEE THAT LOCATION NUMBER 6 HAD THE HIGHEST FARES

SELECT *
FROM (SELECT *,
		RANK()
        OVER(ORDER BY
				CAN DESC) RNK
		FROM (SELECT
				LOC_FROM,
                COUNT(*),
                SUM(DRIVER_NOT_CANCELLED)CAN
		FROM TRIP_DETAILS
        GROUP BY
			LOC_FROM) B) C
				WHERE RNK = 1;
                
# AS YOU CAN SEE THAT LOCATION NUMBER 1 HAD THE HIGHEST CANCELLATION FROM DRIVER SIDE

SELECT *
FROM (SELECT *,
		RANK()
        OVER(ORDER BY
				CAN DESC) RNK
		FROM (SELECT
				LOC_FROM,
                COUNT(*),
                SUM(CUSTOMER_NOT_CANCELLED) CAN
		FROM TRIP_DETAILS
        GROUP BY
			LOC_FROM) B) C
					WHERE RNK = 1;
                    
# AS YOU CAN SEE THAT LOCATION NUMBER 4 HA THE HGHEST CANCELLATION FROM CUSTOMER SIDE