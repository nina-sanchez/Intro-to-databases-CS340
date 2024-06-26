/*
    TASK 1 - CREATE A CUSTOMER OBJECT TABLE

    ! NOTES !

    Anytime you see [SQUARE BRACKETS] it means something that is optional.

    Anytime you see ... three dots - it means continued iterations of the same thing.
*/



/*
    CREATE THE CUSTOMERS TABLE

    Create the table customers, replace it if it exists, defined by the columns within the parentheses.

    We can use CREATE OR REPLACE instead of putting the usual DROP IF EXISTS statements at the top of the SQL file.

    The general syntax of CREATE [OR REPLACE] (Square brackets indicates its optional) is:

    CREATE [OR REPLACE] tableName 
    (
        columnName datatype constraints,
        ...
        [[PRIMARY KEY (columnName, ...)],
        FOREIGN KEY (columnName) REFERENCES primaryTableName(primaryKey, ...)]
    );
*/


CREATE TABLE Customers (
    CustomerID int NOT NULL AUTO_INCREMENT,
    CustomerName varchar(50),
    AddressLine1 varchar(50),
    AddressLine2 varchar(50),
    City varchar(50),
    State varchar(50),
    PostalCode varchar(50),
    YTDPurchases decimal(19,2),
    PRIMARY KEY (CustomerID)
);

/*
    ADD DATA TO THE TABLE

    The general syntax of an INSERT INTO statement is:

    INSERT INTO tableName (
        column1,
        column2,
        ...
    )
    VALUES
    (
        valueForColumn1,
        valueForColumn2,
        ...
    )

    You can include multiple sets of parentheses containing values after the first set to insert multiple rows as in the code below, they just must be separated with a comma and the last set of parentheses must end with a semi-colon.
*/

INSERT INTO Customers (
    CustomerName,
    AddressLine1,
    City,
    State,
    PostalCode
)
VALUES 
(
    "Bike World",
    "60025 Bollinger Canyon Road",
    "San Ramon",
    "California",
    "94583"
),
(
    "Metro Sports",
    "482505 Warm Springs Blvd.",
    "Fremont",
    "California",
    "94536"
),
(
    "Rally Racks",
    "6500 Burnside St",
    "Hood River",
    "Oregon",
    "97031"
)

/* Table for TermsCode */
CREATE TABLE TermsCode(
    TermsCodeID varchar(50) NOT NULL,
    Description varchar(50),
    PRIMARY KEY (TermsCodeID)
);

INSERT INTO TermsCode (
    TermsCodeID,
    Description
)
VALUES
(
    "NET30",
    "Payment due in 30 days."
),
(
    "NET15",
    "Payment due in 15 days."
),
(
    "210NET30",
    "2% discount in 10 days Net 30"
);


/* Table for Invoice */
CREATE TABLE Invoices(
    InvoiceID int NOT NULL AUTO_INCREMENT,
    CustomerID int,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    InvoiceDate datetime,
    TermsCodeID varchar(50),
    FOREIGN KEY (TermsCodeID) REFERENCES TermsCode(TermsCodeID),
    TotalDue decimal(19,2),
    PRIMARY KEY (InvoiceID)
);

INSERT INTO Invoices
(
    CustomerID,
    InvoiceDate,
    TotalDue,
    TermsCodeID
)
VALUES
(
    "2",
    "20140207",
    "2388.98",
    "NET30"
),
(
    "1",
    "20140202",
    "2443.35",
    "210NET30"
),
(
    "1",
    "20140209",
    "8752.32",
    "NET30"
);
