Use Database Demo_Database;
Create or Replace Table AI_Sales_Data
(   order_id Varchar(40) PRIMARY KEY,
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(30),
    customer_name Varchar(60),
    segment Varchar(30),
    state Varchar(50),
    country Varchar(50),
    market Varchar(20),
    region Varchar(20),
    product_id Varchar(60),
    category Varchar(20),
    sub_category Varchar(20),
    product_name String,
    sales Number(10,0),
    quantity int,
    discount float,
    profit float,
    shipping_cost float, 
    order_priority Varchar(30),
    year Number(10,0)
   );
   
   DESCRIBE TABLE AI_SALES_DATA;
   
   select * FROM AI_SALES_DATA;
   
   CREATE OR REPLACE TABLE AI_SALES_DATA_COPY AS
   SELECT* FROM AI_SALES_DATA;
         
  
   select * FROM AI_SALES_DATA_COPY;
   
   SELECT*,
            CASE WHEN DISCOUNT > '0' THEN 'YES'
            ELSE 'NO'
            END AS DISCOUNT_GIVEN
            FROM AI_SALES_DATA_COPY;
            
     
    
         ALTER TABLE AI_SALES_DATA_COPY
         ADD COLUMN PROCESSING_DAYS NUMBER(10,0);
         
         UPDATE AI_SALES_DATA_COPY
         SET PROCESSING_DAYS= DATEDIFF(DAY,ORDER_DATE,SHIP_DATE);
         
         SELECT*,
                CASE WHEN PROCESSING_DAYS <='3' THEN '5'
                 WHEN PROCESSING_DAYS <='6' AND PROCESSING_DAYS > '3' THEN '4'
                 WHEN PROCESSING_DAYS <'10' AND PROCESSING_DAYS >'6' THEN '3'
                 ELSE '2'
                 END AS RATING
                
          FROM AI_SALES_DATA_COPY;
          

          
           ALTER TABLE AI_SALES_DATA_COPY
           ADD COLUMN ORDER_CODE NUMBER(20,0);
          
          UPDATE AI_SALES_DATA_COPY
          SET ORDER_CODE= SUBSTRING(ORDER_ID,9,8);
         