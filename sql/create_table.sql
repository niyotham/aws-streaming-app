DROP TABLE IF EXISTS vehicle_latitude;

CREATE TABLE vehicle_latitude (
    ID VARCHAR(25) NOT NULL,
    vendorId INT NOT NULL,
    pickupDate DATE NOT NULL,
    dropoffDate DATE NOT NULL,
    passengerCount INT NOT NULL,
    pickupLongitude NUMERIC(10,8) NOT NULL,
    pickupLatitude NUMERIC(10,8) NOT NULL,
    dropoffLongitude NUMERIC(10,8) NOT NULL,
    dropoffLatitude NUMERIC(10,8)NOT NULL,
    storeAndFwdFlag CHAR(1) NOT NULL,
    gcDistance INT NOT NULL,
    tripDuration TIMESTAMP NOT NULL,
    googleDistance INT NOT NULL,
    googleDuration TIMESTAMP NOT NULL
);

--- external schema for kinesis ---
CREATE EXTERNAL SCHEMA streamdataschema
FROM KINESIS
IAM_ROLE 'arn:aws:iam::533267024701:role/redshiftkinesisrole';

---- create materialized view ----

CREATE MATERIALIZED VIEW devicedataview AS
    SELECT approximate_arrival_timestamp,
    partition_key,
    shard_id,
    sequence_number,
    json_parse(from_varbyte(kinesis_data, 'utf-8')) as payload    
    FROM streamdataschema."d2d-app-kinesis-stream";
	
---- refresh view ----

REFRESH MATERIALIZED VIEW <VIEW_NAME>;

--- select data from view ----

select * from <VIEW_NAME>