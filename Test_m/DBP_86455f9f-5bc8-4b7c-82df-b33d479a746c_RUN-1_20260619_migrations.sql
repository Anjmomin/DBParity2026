-- ============================================================
-- MIGRATION SCRIPT
-- ============================================================
-- Target: PROD_FUNCTION.CREATE_PROD
-- ============================================================

USE DATABASE PROD_FUNCTION;
USE SCHEMA CREATE_PROD;


-- ------------------------------------------------------------
-- CREATE OBJECTS
-- ------------------------------------------------------------

CREATE OR REPLACE SECURE FUNCTION "CALCULATE_DISCOUNT"("PRICE" NUMBER(38,0) DEFAULT 1000, "DISCOUNT_PERCENT" NUMBER(38,0) DEFAULT 10)
RETURNS NUMBER(38,0)
LANGUAGE PYTHON
IMMUTABLE
RUNTIME_VERSION = '3.11'
ARTIFACT_REPOSITORY = snowflake.snowpark.pypi_shared_repository
PACKAGES = ('snowflake-snowpark-python')
HANDLER = 'calculate_discount'
COMMENT='Calculates discounted price using Python'
AS '
def calculate_discount(price, discount_percent):
    return price - (price * discount_percent / 100)
';


-- ============================================================
-- END - 1 statement(s)
-- ============================================================