-- Hospital Management System (javaminipro) schema
-- Run this in MySQL Workbench against a local MySQL server.
-- The application connects to localhost:3306, user root, password pass.

DROP DATABASE IF EXISTS javaminipro;
CREATE DATABASE javaminipro CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE javaminipro;

CREATE TABLE WARDS (
    WRN       INT PRIMARY KEY,
    WName     VARCHAR(100) NOT NULL,
    WardType  VARCHAR(50),
    Capacity  INT
);

CREATE TABLE DOCTORS (
    DRN             INT PRIMARY KEY,
    DName           VARCHAR(100) NOT NULL,
    DAge            INT,
    DPhoneNumber    BIGINT,
    DAddress        VARCHAR(255),
    ADHAARNumber    BIGINT,
    Qualification   VARCHAR(100),
    Specialization  VARCHAR(100),
    Salary          DECIMAL(10, 2),
    Gender          VARCHAR(20),
    Password        VARCHAR(100) NOT NULL
);

CREATE TABLE STAFF (
    SRN             INT PRIMARY KEY,
    SName           VARCHAR(100) NOT NULL,
    SAge            INT,
    SPhoneNumber    BIGINT,
    SAddress        VARCHAR(255),
    Salary          DECIMAL(10, 2),
    Gender          VARCHAR(20),
    AdhaarNumber    BIGINT,
    Qualification   VARCHAR(100),
    `Job Title`     VARCHAR(100),
    Wards_WRN       INT,
    Password        VARCHAR(100) NOT NULL
);

CREATE TABLE PATIENTS (
    PRN                     INT PRIMARY KEY,
    PName                   VARCHAR(100) NOT NULL,
    PAge                    INT,
    PPhoneNumber            BIGINT,
    PAddress                VARCHAR(255),
    PCareTaker              VARCHAR(100),
    PCareTakerPhoneNumber   BIGINT,
    ADHAARNumber            BIGINT,
    Gender                  VARCHAR(20),
    SpecialRemarks          VARCHAR(255),
    Wards_WRN               INT
);

CREATE TABLE TREATMENT (
    TRN               INT PRIMARY KEY,
    Doctors_DRN       INT NOT NULL,
    Patients_PRN      INT NOT NULL,
    Remarks           VARCHAR(255),
    DiseaseIdentified VARCHAR(255)
);

CREATE TABLE TREATMENT_HAS_MEDICINES (
    Treatment_TRN INT NOT NULL,
    Medicines     VARCHAR(100) NOT NULL,
    PRIMARY KEY (Treatment_TRN, Medicines)
);

CREATE TABLE DOCTORS_VISIT_WARDS (
    Doctors_DRN INT NOT NULL,
    Wards_WRN   INT NOT NULL,
    PRIMARY KEY (Doctors_DRN, Wards_WRN)
);

-- ---------------------------------------------------------------
-- Sample data (optional but lets you log in immediately)
-- Doctor login:  DRN 1 / pass
-- Staff login:   SRN 1 / pass
-- ---------------------------------------------------------------

INSERT INTO WARDS (WRN, WName, WardType, Capacity) VALUES
    (1, 'General Ward',   'General',       20),
    (2, 'ICU',            'Intensive Care', 10),
    (3, 'Maternity Ward', 'Maternity',      15);

INSERT INTO DOCTORS
    (DRN, DName, DAge, DPhoneNumber, DAddress, ADHAARNumber,
     Qualification, Specialization, Salary, Gender, Password)
VALUES
    (1, 'Dr. Advaid', 35, 9876543210, 'City Hospital',
     123456789012, 'MBBS', 'General Medicine', 75000.00, 'Male', 'pass');

INSERT INTO STAFF
    (SRN, SName, SAge, SPhoneNumber, SAddress, Salary, Gender,
     AdhaarNumber, Qualification, `Job Title`, Wards_WRN, Password)
VALUES
    (1, 'Staff Aayush', 28, 9876500000, 'City Hospital', 35000.00, 'Male',
     123456789012, 'BSc Nursing', 'Nurse', 1, 'pass');

INSERT INTO DOCTORS_VISIT_WARDS (Doctors_DRN, Wards_WRN) VALUES
    (1, 1),
    (1, 2);

INSERT INTO PATIENTS
    (PRN, PName, PAge, PPhoneNumber, PAddress, PCareTaker,
     PCareTakerPhoneNumber, ADHAARNumber, Gender, SpecialRemarks, Wards_WRN)
VALUES
    (1, 'Patient One', 45, 9876511111, 'Some Address', 'Caretaker Name',
     9876522222, 123456789012, 'Male', 'None', 1);

INSERT INTO TREATMENT
    (TRN, Doctors_DRN, Patients_PRN, Remarks, DiseaseIdentified)
VALUES
    (1, 1, 1, 'General checkup', 'Not identified');

INSERT INTO TREATMENT_HAS_MEDICINES (Treatment_TRN, Medicines) VALUES
    (1, 'Paracetamol');
