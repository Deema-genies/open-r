CREATE TABLE CountryRegion (
    CountryRegionCode text PRIMARY KEY   -- Example: 'AD',
    Name text                            -- Example: 'Afghanistan',
    ModifiedDate datetime                -- Example: 'ModifiedDate'
);

CREATE TABLE Culture (
    CultureID text PRIMARY KEY           -- Example: '',
    Name text                            -- Example: 'Arabic',
    ModifiedDate datetime                -- Example: '2008-04-30 00:00:00.0'
);

CREATE TABLE Currency (
    CurrencyCode text PRIMARY KEY        -- Example: 'AED',
    Name text                            -- Example: 'Afghani',
    ModifiedDate datetime                -- Example: '2008-04-30 00:00:00.0'
);

CREATE TABLE CountryRegionCurrency (
    CountryRegionCode text               -- Example: 'AE',
    CurrencyCode text                    -- Example: 'AED',
    ModifiedDate datetime                -- Example: '2014-02-08 10:17:21.0',
    PRIMARY KEY (CountryRegionCode, CurrencyCode),
    FOREIGN KEY (CurrencyCode) REFERENCES Currency(CurrencyCode),
    FOREIGN KEY (CountryRegionCode) REFERENCES CountryRegion(CountryRegionCode)
);

CREATE TABLE Person (
    BusinessEntityID integer PRIMARY KEY -- Example: 17331,
    PersonType text                      -- Example: 'SC',
    NameStyle integer                    -- Example: 0,
    Title text                           -- Example: 'Ms.',
    FirstName text                       -- Example: 'Ken',
    MiddleName text                      -- Example: 'J',
    LastName text                        -- Example: 'Sánchez',
    Suffix text                          -- Example: 'III',
    EmailPromotion integer               -- Example: 0,
    AdditionalContactInfo text           -- Example: '<AdditionalContactInfo xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adv',
    Demographics text                    -- Example: '<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventur',
    rowguid text                         -- Example: '0014494A-60B6-47B9-A17C-73D66A3751FE',
    ModifiedDate datetime                -- Example: '2009-01-07 00:00:00.0',
    FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity(BusinessEntityID)
);

CREATE TABLE BusinessEntityContact (
    BusinessEntityID integer             -- Example: 292,
    PersonID integer                     -- Example: 291,
    ContactTypeID integer                -- Example: 11,
    rowguid text                         -- Example: '0022434C-E325-47B0-92A0-7302FFA5046F',
    ModifiedDate datetime                -- Example: '2017-12-13 13:21:02.0',
    PRIMARY KEY (BusinessEntityID, PersonID, ContactTypeID),
    FOREIGN KEY (PersonID) REFERENCES Person(BusinessEntityID),
    FOREIGN KEY (ContactTypeID) REFERENCES ContactType(ContactTypeID),
    FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity(BusinessEntityID)
);

CREATE TABLE EmailAddress (
    BusinessEntityID integer             -- Example: 1,
    EmailAddressID integer               -- Example: 1,
    EmailAddress text                    -- Example: 'ken0@adventure-works.com',
    rowguid text                         -- Example: '8A1901E4-671B-431A-871C-EADB2942E9EE',
    ModifiedDate datetime                -- Example: '2009-01-07 00:00:00.0',
    PRIMARY KEY (BusinessEntityID, EmailAddressID),
    FOREIGN KEY (BusinessEntityID) REFERENCES Person(BusinessEntityID)
);

CREATE TABLE Employee (
    BusinessEntityID integer PRIMARY KEY -- Example: 151,
    NationalIDNumber text                -- Example: '10708100',
    LoginID text                         -- Example: 'adventure-works\alan0',
    OrganizationNode text                -- Example: '/1/',
    OrganizationLevel integer            -- Example: 1,
    JobTitle text                        -- Example: 'Chief Executive Officer',
    BirthDate date                       -- Example: '1969-01-29',
    MaritalStatus text                   -- Example: 'S',
    Gender text                          -- Example: 'M',
    HireDate date                        -- Example: '2009-01-14',
    SalariedFlag integer                 -- Example: 1,
    VacationHours integer                -- Example: 99,
    SickLeaveHours integer               -- Example: 69,
    CurrentFlag integer                  -- Example: 1,
    rowguid text                         -- Example: '00027A8C-C2F8-4A31-ABA8-8A203638B8F1',
    ModifiedDate datetime                -- Example: '2014-06-30 00:00:00.0',
    FOREIGN KEY (BusinessEntityID) REFERENCES Person(BusinessEntityID)
);

CREATE TABLE Password (
    BusinessEntityID integer PRIMARY KEY -- Example: 1,
    PasswordHash text                    -- Example: 'pbFwXWE99vobT6g+vPWFy93NtUU/orrIWafF01hccfM=',
    PasswordSalt text                    -- Example: 'bE3XiWw=',
    rowguid text                         -- Example: '329EACBE-C883-4F48-B8B6-17AA4627EFFF',
    ModifiedDate datetime                -- Example: '2009-01-07 00:00:00.0',
    FOREIGN KEY (BusinessEntityID) REFERENCES Person(BusinessEntityID)
);

CREATE TABLE PersonCreditCard (
    BusinessEntityID integer             -- Example: 293,
    CreditCardID integer                 -- Example: 17038,
    ModifiedDate datetime                -- Example: '2013-07-31 00:00:00.0',
    PRIMARY KEY (BusinessEntityID, CreditCardID),
    FOREIGN KEY (BusinessEntityID) REFERENCES Person(BusinessEntityID),
    FOREIGN KEY (CreditCardID) REFERENCES CreditCard(CreditCardID)
);

CREATE TABLE ProductCategory (
    ProductCategoryID integer PRIMARY KEY -- Example: 3,
    Name text                            -- Example: 'Accessories',
    rowguid text                         -- Example: '10A7C342-CA82-48D4-8A38-46A2EB089B74',
    ModifiedDate datetime                -- Example: '2008-04-30 00:00:00.0'
);

CREATE TABLE ProductDescription (
    ProductDescriptionID integer PRIMARY KEY -- Example: 1954,
    Description text                     -- Example: 'Chromoly steel.',
    rowguid text                         -- Example: '00FFDFAC-0207-4DF0-8051-7D3C884816F3',
    ModifiedDate datetime                -- Example: '2013-04-30 00:00:00.0'
);

CREATE TABLE ProductModel (
    ProductModelID integer PRIMARY KEY   -- Example: 82,
    Name text                            -- Example: 'All-Purpose Bike Stand',
    CatalogDescription text              -- Example: '<?xml-stylesheet href="ProductDescription.xsl" type="text/xsl"?><p1:ProductDescr',
    Instructions text                    -- Example: '<root xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Prod',
    rowguid text                         -- Example: '00CE9171-8944-4D49-BA37-485C1D122F5C',
    ModifiedDate datetime                -- Example: '2013-04-30 00:00:00.0'
);

CREATE TABLE ProductModelProductDescriptionCulture (
    ProductModelID integer               -- Example: 1,
    ProductDescriptionID integer         -- Example: 1199,
    CultureID text                       -- Example: 'en',
    ModifiedDate datetime                -- Example: '2013-04-30 00:00:00.0',
    PRIMARY KEY (ProductModelID, ProductDescriptionID, CultureID),
    FOREIGN KEY (CultureID) REFERENCES Culture(CultureID),
    FOREIGN KEY (ProductDescriptionID) REFERENCES ProductDescription(ProductDescriptionID),
    FOREIGN KEY (ProductModelID) REFERENCES ProductModel(ProductModelID)
);

CREATE TABLE ProductPhoto (
    ProductPhotoID integer PRIMARY KEY   -- Example: 69,
    ThumbNailPhoto blob                  -- Example: '0x47494638396150003100F70000E3E3FCA6ACB3F5F6FE303D47F8FAFDEDEEFE989DA2F6F8FD6C86',
    ThumbnailPhotoFileName text          -- Example: 'racer02_black_f_small.gif',
    LargePhoto blob                      -- Example: '0x474946383961F0009500F70000D3D3FEE2E3FE86878ADBDCFED7D8E7929BA8545659C9CAD8B7C4',
    LargePhotoFileName text              -- Example: 'racer02_black_f_large.gif',
    ModifiedDate datetime                -- Example: '2008-04-30 00:00:00.0'
);

CREATE TABLE ProductSubcategory (
    ProductSubcategoryID integer PRIMARY KEY -- Example: 2,
    ProductCategoryID integer            -- Example: 1,
    Name text                            -- Example: 'Bib-Shorts',
    rowguid text                         -- Example: '000310C0-BCC8-42C4-B0C3-45AE611AF06B',
    ModifiedDate datetime                -- Example: '2008-04-30 00:00:00.0',
    FOREIGN KEY (ProductCategoryID) REFERENCES ProductCategory(ProductCategoryID)
);

CREATE TABLE SalesReason (
    SalesReasonID integer PRIMARY KEY    -- Example: 1,
    Name text                            -- Example: 'Price',
    ReasonType text                      -- Example: 'Other',
    ModifiedDate datetime                -- Example: '2008-04-30 00:00:00.0'
);

CREATE TABLE SalesTerritory (
    TerritoryID integer PRIMARY KEY      -- Example: 2,
    Name text                            -- Example: 'Australia',
    CountryRegionCode text               -- Example: 'US',
    Group text                           -- Example: 'North America',
    SalesYTD real                        -- Example: 7887186.7882,
    SalesLastYear real                   -- Example: 3298694.4938,
    CostYTD real                         -- Example: 0.0,
    CostLastYear real                    -- Example: 0.0,
    rowguid text                         -- Example: '00FB7309-96CC-49E2-8363-0A1BA72486F2',
    ModifiedDate datetime                -- Example: '2008-04-30 00:00:00.0',
    FOREIGN KEY (CountryRegionCode) REFERENCES CountryRegion(CountryRegionCode)
);

CREATE TABLE SalesPerson (
    BusinessEntityID integer PRIMARY KEY -- Example: 288,
    TerritoryID integer                  -- Example: NULL,
    SalesQuota real                      -- Example: 0.0,
    Bonus real                           -- Example: 0.0,
    CommissionPct real                   -- Example: 0.0,
    SalesYTD real                        -- Example: 0.0,
    SalesLastYear real                   -- Example: 0.0,
    rowguid text                         -- Example: '2025',
    ModifiedDate datetime                -- Example: '2025-06-23 02:54:41',
    FOREIGN KEY (TerritoryID) REFERENCES SalesTerritory(TerritoryID),
    FOREIGN KEY (BusinessEntityID) REFERENCES Employee(BusinessEntityID)
);

CREATE TABLE SalesPersonQuotaHistory (
    BusinessEntityID integer             -- Example: 274,
    QuotaDate datetime                   -- Example: '2011-05-31 00:00:00.0',
    SalesQuota real                      -- Example: 28000.0,
    rowguid text                         -- Example: '00F2F9F8-5158-4436-B134-7E0C462289E5',
    ModifiedDate datetime                -- Example: '2011-04-16 00:00:00.0',
    PRIMARY KEY (BusinessEntityID, QuotaDate),
    FOREIGN KEY (BusinessEntityID) REFERENCES SalesPerson(BusinessEntityID)
);

CREATE TABLE SalesTerritoryHistory (
    BusinessEntityID integer             -- Example: 275,
    TerritoryID integer                  -- Example: 2,
    StartDate datetime                   -- Example: '2011-05-31 00:00:00.0',
    EndDate datetime                     -- Example: '2012-11-29 00:00:00.0',
    rowguid text                         -- Example: '009F7660-44A6-4ADF-BD4B-A5D1B79993F5',
    ModifiedDate datetime                -- Example: '2012-11-22 00:00:00.0',
    PRIMARY KEY (BusinessEntityID, TerritoryID, StartDate),
    FOREIGN KEY (TerritoryID) REFERENCES SalesTerritory(TerritoryID),
    FOREIGN KEY (BusinessEntityID) REFERENCES SalesPerson(BusinessEntityID)
);

CREATE TABLE ScrapReason (
    ScrapReasonID integer PRIMARY KEY    -- Example: 1,
    Name text                            -- Example: 'Brake assembly not as ordered',
    ModifiedDate datetime                -- Example: '2008-04-30 00:00:00.0'
);

CREATE TABLE Shift (
    ShiftID integer PRIMARY KEY          -- Example: 1,
    Name text                            -- Example: 'Day',
    StartTime text                       -- Example: '07:00:00',
    EndTime text                         -- Example: '15:00:00',
    ModifiedDate datetime                -- Example: '2008-04-30 00:00:00.0'
);

CREATE TABLE ShipMethod (
    ShipMethodID integer PRIMARY KEY     -- Example: 4,
    Name text                            -- Example: 'CARGO TRANSPORT 5',
    ShipBase real                        -- Example: 3.95,
    ShipRate real                        -- Example: 0.99,
    rowguid text                         -- Example: '107E8356-E7A8-463D-B60C-079FFF467F3F',
    ModifiedDate datetime                -- Example: '2008-04-30 00:00:00.0'
);

CREATE TABLE SpecialOffer (
    SpecialOfferID integer PRIMARY KEY   -- Example: 1,
    Description text                     -- Example: 'No Discount',
    DiscountPct real                     -- Example: 0.0,
    Type text                            -- Example: 'No Discount',
    Category text                        -- Example: 'No Discount',
    StartDate datetime                   -- Example: '2011-05-01 00:00:00.0',
    EndDate datetime                     -- Example: '2014-11-30 00:00:00.0',
    MinQty integer                       -- Example: 0,
    MaxQty integer                       -- Example: 14,
    rowguid text                         -- Example: '0290C4F5-191F-4337-AB6B-0A2DDE03CBF9',
    ModifiedDate datetime                -- Example: '2011-04-01 00:00:00.0'
);

CREATE TABLE BusinessEntityAddress (
    BusinessEntityID integer             -- Example: 1,
    AddressID integer                    -- Example: 249,
    AddressTypeID integer                -- Example: 2,
    rowguid text                         -- Example: '00013363-E32F-4615-9439-AFF156D480AE',
    ModifiedDate datetime                -- Example: '2014-09-12 11:15:06.0',
    PRIMARY KEY (BusinessEntityID, AddressID, AddressTypeID),
    FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity(BusinessEntityID),
    FOREIGN KEY (AddressTypeID) REFERENCES AddressType(AddressTypeID),
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);

CREATE TABLE SalesTaxRate (
    SalesTaxRateID integer PRIMARY KEY   -- Example: 1,
    StateProvinceID integer              -- Example: 1,
    TaxType integer                      -- Example: 1,
    TaxRate real                         -- Example: 14.0,
    Name text                            -- Example: 'Canadian GST + Alberta Provincial Tax',
    rowguid text                         -- Example: '05C4FFDB-4F84-4CDF-ABE5-FDF3216EA74E',
    ModifiedDate datetime                -- Example: '2008-04-30 00:00:00.0',
    FOREIGN KEY (StateProvinceID) REFERENCES StateProvince(StateProvinceID)
);

CREATE TABLE Store (
    BusinessEntityID integer PRIMARY KEY -- Example: 630,
    Name text                            -- Example: 'Next-Door Bike Store',
    SalesPersonID integer                -- Example: 279,
    Demographics text                    -- Example: '<StoreSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-wor',
    rowguid text                         -- Example: '004EA91C-FCD4-4973-87EF-9059C6E20BB5',
    ModifiedDate datetime                -- Example: '2014-09-12 11:15:07.0',
    FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson(BusinessEntityID),
    FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity(BusinessEntityID)
);

CREATE TABLE SalesOrderHeaderSalesReason (
    SalesOrderID integer                 -- Example: 43697,
    SalesReasonID integer                -- Example: 5,
    ModifiedDate datetime                -- Example: '2011-05-31 00:00:00.0',
    PRIMARY KEY (SalesOrderID, SalesReasonID),
    FOREIGN KEY (SalesReasonID) REFERENCES SalesReason(SalesReasonID),
    FOREIGN KEY (SalesOrderID) REFERENCES SalesOrderHeader(SalesOrderID)
);

CREATE TABLE TransactionHistoryArchive (
    TransactionID integer PRIMARY KEY    -- Example: 1,
    ProductID integer                    -- Example: 1,
    ReferenceOrderID integer             -- Example: 1,
    ReferenceOrderLineID integer         -- Example: 1,
    TransactionDate datetime             -- Example: '2011-04-16 00:00:00.0',
    TransactionType text                 -- Example: 'P',
    Quantity integer                     -- Example: 4,
    ActualCost real                      -- Example: 50.0,
    ModifiedDate datetime                -- Example: '2011-04-16 00:00:00.0'
);

CREATE TABLE UnitMeasure (
    UnitMeasureCode text PRIMARY KEY     -- Example: 'BOX',
    Name text                            -- Example: 'Bottle',
    ModifiedDate datetime                -- Example: '2008-04-30 00:00:00.0'
);

CREATE TABLE ProductCostHistory (
    ProductID integer                    -- Example: 707,
    StartDate date                       -- Example: '2011-05-31 00:00:00.0',
    EndDate date                         -- Example: '2012-05-29 00:00:00.0',
    StandardCost real                    -- Example: 12.0278,
    ModifiedDate datetime                -- Example: '2012-05-29 00:00:00.0',
    PRIMARY KEY (ProductID, StartDate),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE ProductDocument (
    ProductID integer                    -- Example: 317,
    DocumentNode text                    -- Example: '/2/1/',
    ModifiedDate datetime                -- Example: '2013-12-29 13:51:58.0',
    PRIMARY KEY (ProductID, DocumentNode),
    FOREIGN KEY (DocumentNode) REFERENCES Document(DocumentNode),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE ProductInventory (
    ProductID integer                    -- Example: 1,
    LocationID integer                   -- Example: 1,
    Shelf text                           -- Example: 'A',
    Bin integer                          -- Example: 1,
    Quantity integer                     -- Example: 408,
    rowguid text                         -- Example: '47A24246-6C43-48EB-968F-025738A8A410',
    ModifiedDate datetime                -- Example: '2014-08-08 00:00:00.0',
    PRIMARY KEY (ProductID, LocationID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE ProductProductPhoto (
    ProductID integer                    -- Example: 1,
    ProductPhotoID integer               -- Example: 1,
    Primary integer                      -- Example: 1,
    ModifiedDate datetime                -- Example: '2008-03-31 00:00:00.0',
    PRIMARY KEY (ProductID, ProductPhotoID),
    FOREIGN KEY (ProductPhotoID) REFERENCES ProductPhoto(ProductPhotoID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE ProductReview (
    ProductReviewID integer PRIMARY KEY  -- Example: 1,
    ProductID integer                    -- Example: 709,
    ReviewerName text                    -- Example: 'John Smith',
    ReviewDate datetime                  -- Example: '2013-09-18 00:00:00.0',
    EmailAddress text                    -- Example: 'john@fourthcoffee.com',
    Rating integer                       -- Example: 5,
    Comments text                        -- Example: 'I can't believe I'm singing the praises of a pair of socks, but I just came back',
    ModifiedDate datetime                -- Example: '2013-09-18 00:00:00.0',
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE ShoppingCartItem (
    ShoppingCartItemID integer PRIMARY KEY -- Example: 2,
    ShoppingCartID text                  -- Example: '14951',
    Quantity integer                     -- Example: 3,
    ProductID integer                    -- Example: 862,
    DateCreated datetime                 -- Example: '2013-11-09 17:54:07.0',
    ModifiedDate datetime                -- Example: '2013-11-09 17:54:07.0',
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE SpecialOfferProduct (
    SpecialOfferID integer               -- Example: 1,
    ProductID integer                    -- Example: 680,
    rowguid text                         -- Example: '0020931C-087C-42F8-B441-EBE3D3B5F51E',
    ModifiedDate datetime                -- Example: '2011-04-01 00:00:00.0',
    PRIMARY KEY (SpecialOfferID, ProductID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (SpecialOfferID) REFERENCES SpecialOffer(SpecialOfferID)
);

CREATE TABLE SalesOrderDetail (
    SalesOrderID integer                 -- Example: 43659,
    SalesOrderDetailID integer PRIMARY KEY -- Example: 54351,
    CarrierTrackingNumber text           -- Example: '4911-403C-98',
    OrderQty integer                     -- Example: 1,
    ProductID integer                    -- Example: 776,
    SpecialOfferID integer               -- Example: 1,
    UnitPrice real                       -- Example: 2025.0,
    UnitPriceDiscount real               -- Example: 0.0,
    LineTotal real                       -- Example: 2025.0,
    rowguid text                         -- Example: '0000C99C-2B71-4885-B976-C1CCAE896EF2',
    ModifiedDate datetime                -- Example: '2011-05-31 00:00:00.0',
    FOREIGN KEY (SpecialOfferID) REFERENCES SpecialOfferProduct(SpecialOfferID),
    FOREIGN KEY (ProductID) REFERENCES SpecialOfferProduct(ProductID),
    FOREIGN KEY (SalesOrderID) REFERENCES SalesOrderHeader(SalesOrderID)
);

CREATE TABLE TransactionHistory (
    TransactionID integer PRIMARY KEY    -- Example: 100000,
    ProductID integer                    -- Example: 784,
    ReferenceOrderID integer             -- Example: 41590,
    ReferenceOrderLineID integer         -- Example: 0,
    TransactionDate datetime             -- Example: '2013-07-31 00:00:00.0',
    TransactionType text                 -- Example: 'W',
    Quantity integer                     -- Example: 2,
    ActualCost real                      -- Example: 0.0,
    ModifiedDate datetime                -- Example: '2013-07-31 00:00:00.0',
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Vendor (
    BusinessEntityID integer PRIMARY KEY -- Example: 1596,
    AccountNumber text                   -- Example: 'ADATUM0001',
    Name text                            -- Example: 'Australia Bike Retailer',
    CreditRating integer                 -- Example: 1,
    PreferredVendorStatus integer        -- Example: 1,
    ActiveFlag integer                   -- Example: 1,
    PurchasingWebServiceURL text         -- Example: 'www.litwareinc.com/',
    ModifiedDate datetime                -- Example: '2011-12-23 00:00:00.0',
    FOREIGN KEY (BusinessEntityID) REFERENCES BusinessEntity(BusinessEntityID)
);

CREATE TABLE ProductVendor (
    ProductID integer                    -- Example: 1,
    BusinessEntityID integer             -- Example: 1580,
    AverageLeadTime integer              -- Example: 17,
    StandardPrice real                   -- Example: 47.87,
    LastReceiptCost real                 -- Example: 50.2635,
    LastReceiptDate datetime             -- Example: '2011-08-29 00:00:00.0',
    MinOrderQty integer                  -- Example: 1,
    MaxOrderQty integer                  -- Example: 5,
    OnOrderQty integer                   -- Example: 3,
    UnitMeasureCode text                 -- Example: 'CS',
    ModifiedDate datetime                -- Example: '2011-08-29 00:00:00.0',
    PRIMARY KEY (ProductID, BusinessEntityID),
    FOREIGN KEY (UnitMeasureCode) REFERENCES UnitMeasure(UnitMeasureCode),
    FOREIGN KEY (BusinessEntityID) REFERENCES Vendor(BusinessEntityID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE PurchaseOrderHeader (
    PurchaseOrderID integer PRIMARY KEY  -- Example: 1,
    RevisionNumber integer               -- Example: 4,
    Status integer                       -- Example: 4,
    EmployeeID integer                   -- Example: 258,
    VendorID integer                     -- Example: 1580,
    ShipMethodID integer                 -- Example: 3,
    OrderDate datetime                   -- Example: '2011-04-16 00:00:00.0',
    ShipDate datetime                    -- Example: '2011-04-25 00:00:00.0',
    SubTotal real                        -- Example: 201.04,
    TaxAmt real                          -- Example: 16.0832,
    Freight real                         -- Example: 5.026,
    TotalDue real                        -- Example: 222.1492,
    ModifiedDate datetime                -- Example: '2011-04-25 00:00:00.0',
    FOREIGN KEY (ShipMethodID) REFERENCES ShipMethod(ShipMethodID),
    FOREIGN KEY (VendorID) REFERENCES Vendor(BusinessEntityID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(BusinessEntityID)
);

CREATE TABLE PurchaseOrderDetail (
    PurchaseOrderID integer              -- Example: 1,
    PurchaseOrderDetailID integer PRIMARY KEY -- Example: 1,
    DueDate datetime                     -- Example: '2011-04-30 00:00:00.0',
    OrderQty integer                     -- Example: 4,
    ProductID integer                    -- Example: 1,
    UnitPrice real                       -- Example: 50.0,
    LineTotal real                       -- Example: 201.0,
    ReceivedQty real                     -- Example: 3.0,
    RejectedQty real                     -- Example: 0.0,
    StockedQty real                      -- Example: 3.0,
    ModifiedDate datetime                -- Example: '2011-04-23 00:00:00.0',
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrderHeader(PurchaseOrderID)
);

CREATE TABLE WorkOrder (
    WorkOrderID integer PRIMARY KEY      -- Example: 1,
    ProductID integer                    -- Example: 722,
    OrderQty integer                     -- Example: 8,
    StockedQty integer                   -- Example: 8,
    ScrappedQty integer                  -- Example: 0,
    StartDate datetime                   -- Example: '2011-06-03 00:00:00.0',
    EndDate datetime                     -- Example: '2011-06-13 00:00:00.0',
    DueDate datetime                     -- Example: '2011-06-14 00:00:00.0',
    ScrapReasonID integer                -- Example: 7,
    ModifiedDate datetime                -- Example: '2011-06-13 00:00:00.0',
    FOREIGN KEY (ScrapReasonID) REFERENCES ScrapReason(ScrapReasonID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE WorkOrderRouting (
    WorkOrderID integer                  -- Example: 13,
    ProductID integer                    -- Example: 747,
    OperationSequence integer            -- Example: 1,
    LocationID integer                   -- Example: 10,
    ScheduledStartDate datetime          -- Example: '2011-06-03 00:00:00.0',
    ScheduledEndDate datetime            -- Example: '2011-06-14 00:00:00.0',
    ActualStartDate datetime             -- Example: '2011-06-03 00:00:00.0',
    ActualEndDate datetime               -- Example: '2011-06-19 00:00:00.0',
    ActualResourceHrs real               -- Example: 4.1,
    PlannedCost real                     -- Example: 92.25,
    ActualCost real                      -- Example: 92.25,
    ModifiedDate datetime                -- Example: '2011-06-19 00:00:00.0',
    PRIMARY KEY (WorkOrderID, ProductID, OperationSequence),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID),
    FOREIGN KEY (WorkOrderID) REFERENCES WorkOrder(WorkOrderID)
);

CREATE TABLE Customer (
    CustomerID integer PRIMARY KEY       -- Example: NULL,
    PersonID integer                     -- Example: NULL,
    StoreID integer                      -- Example: NULL,
    TerritoryID integer                  -- Example: NULL,
    AccountNumber text                   -- Example: NULL,
    rowguid text                         -- Example: NULL,
    ModifiedDate datetime                -- Example: NULL,
    FOREIGN KEY (StoreID) REFERENCES Store(BusinessEntityID),
    FOREIGN KEY (TerritoryID) REFERENCES SalesTerritory(TerritoryID),
    FOREIGN KEY (PersonID) REFERENCES Person(BusinessEntityID)
);

CREATE TABLE ProductListPriceHistory (
    ProductID integer                    -- Example: 707,
    StartDate date                       -- Example: '2011-05-31 00:00:00.0',
    EndDate date                         -- Example: '2012-05-29 00:00:00.0',
    ListPrice real                       -- Example: 33.6442,
    ModifiedDate datetime                -- Example: '2012-05-29 00:00:00.0',
    PRIMARY KEY (ProductID, StartDate),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Address (
    AddressID integer PRIMARY KEY        -- Example: 18089,
    AddressLine1 text                    -- Example: '#500-75 O'Connor Street',
    AddressLine2 text                    -- Example: 'Space 55',
    City text                            -- Example: 'Ottawa',
    StateProvinceID integer              -- Example: 57,
    PostalCode text                      -- Example: 'K4B 1S2',
    SpatialLocation text                 -- Example: '0x00000000010100000067A89189898A5EC0AE8BFC28BCE44740',
    rowguid text                         -- Example: '00093F9C-0487-4723-B376-D90FF565AD6F',
    ModifiedDate datetime                -- Example: '2007-12-04 00:00:00.0'
);

CREATE TABLE AddressType (
    AddressTypeID integer PRIMARY KEY    -- Example: 4,
    Name text                            -- Example: 'Archive',
    rowguid text                         -- Example: '24CB3088-4345-47C4-86C5-17B535133D1E',
    ModifiedDate datetime                -- Example: '2008-04-30 00:00:00.0'
);

CREATE TABLE BillOfMaterials (
    BillOfMaterialsID integer PRIMARY KEY -- Example: 893,
    ProductAssemblyID integer            -- Example: 3,
    ComponentID integer                  -- Example: 749,
    StartDate datetime                   -- Example: '2010-05-26 00:00:00.0',
    EndDate datetime                     -- Example: '2010-05-03 00:00:00.0',
    UnitMeasureCode text                 -- Example: 'EA',
    BOMLevel integer                     -- Example: 2,
    PerAssemblyQty real                  -- Example: 1.0,
    ModifiedDate datetime                -- Example: '2010-02-18 00:00:00.0'
);

CREATE TABLE BusinessEntity (
    BusinessEntityID integer PRIMARY KEY -- Example: 8722,
    rowguid text                         -- Example: '00021813-91EF-4A97-9682-0D2AC8C9EA97',
    ModifiedDate datetime                -- Example: '2017-12-13 13:20:24.0'
);

CREATE TABLE ContactType (
    ContactTypeID integer PRIMARY KEY    -- Example: 1,
    Name text                            -- Example: 'Accounting Manager',
    ModifiedDate datetime                -- Example: '2008-04-30 00:00:00.0'
);

CREATE TABLE CurrencyRate (
    CurrencyRateID integer PRIMARY KEY   -- Example: 1,
    CurrencyRateDate datetime            -- Example: '2011-05-31 00:00:00.0',
    FromCurrencyCode text                -- Example: 'USD',
    ToCurrencyCode text                  -- Example: 'ARS',
    AverageRate real                     -- Example: 1.0,
    EndOfDayRate real                    -- Example: 1.0002,
    ModifiedDate datetime                -- Example: '2011-05-31 00:00:00.0'
);

CREATE TABLE Department (
    DepartmentID integer PRIMARY KEY     -- Example: 12,
    Name text                            -- Example: 'Document Control',
    GroupName text                       -- Example: 'Research and Development',
    ModifiedDate datetime                -- Example: '2008-04-30 00:00:00.0'
);

CREATE TABLE EmployeeDepartmentHistory (
    BusinessEntityID integer             -- Example: 1,
    DepartmentID integer                 -- Example: 16,
    ShiftID integer                      -- Example: 1,
    StartDate date                       -- Example: '2009-01-14',
    EndDate date                         -- Example: '2010-05-30',
    ModifiedDate datetime                -- Example: '2009-01-13 00:00:00.0',
    PRIMARY KEY (BusinessEntityID, DepartmentID, ShiftID, StartDate)
);

CREATE TABLE EmployeePayHistory (
    BusinessEntityID integer             -- Example: 1,
    RateChangeDate datetime              -- Example: '2009-01-14 00:00:00.0',
    Rate real                            -- Example: 125.5,
    PayFrequency integer                 -- Example: 2,
    ModifiedDate datetime                -- Example: '2014-06-30 00:00:00.0',
    PRIMARY KEY (BusinessEntityID, RateChangeDate)
);

CREATE TABLE JobCandidate (
    JobCandidateID integer PRIMARY KEY   -- Example: 2,
    BusinessEntityID integer             -- Example: 274,
    Resume text                          -- Example: '<ns:Resume xmlns:ns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-wo',
    ModifiedDate datetime                -- Example: '2007-06-23 00:00:00.0'
);

CREATE TABLE Location (
    LocationID integer PRIMARY KEY       -- Example: 30,
    Name text                            -- Example: 'Debur and Polish',
    CostRate real                        -- Example: 0.0,
    Availability real                    -- Example: 0.0,
    ModifiedDate datetime                -- Example: '2008-04-30 00:00:00.0'
);

CREATE TABLE PhoneNumberType (
    PhoneNumberTypeID integer PRIMARY KEY -- Example: 1,
    Name text                            -- Example: 'Cell',
    ModifiedDate datetime                -- Example: '2017-12-13 13:19:22.0'
);

CREATE TABLE Product (
    ProductID integer PRIMARY KEY        -- Example: 921,
    Name text                            -- Example: 'AWC Logo Cap',
    ProductNumber text                   -- Example: 'AR-5381',
    MakeFlag integer                     -- Example: 0,
    FinishedGoodsFlag integer            -- Example: 0,
    Color text                           -- Example: 'Black',
    SafetyStockLevel integer             -- Example: 1000,
    ReorderPoint integer                 -- Example: 750,
    StandardCost real                    -- Example: 0.0,
    ListPrice real                       -- Example: 1000.0,
    Size text                            -- Example: '58',
    SizeUnitMeasureCode text             -- Example: 'CM',
    WeightUnitMeasureCode text           -- Example: 'G',
    Weight real                          -- Example: 435.0,
    DaysToManufacture integer            -- Example: 0,
    ProductLine text                     -- Example: 'R',
    Class text                           -- Example: 'S',
    Style text                           -- Example: 'U',
    ProductSubcategoryID integer         -- Example: 18,
    ProductModelID integer               -- Example: 6,
    SellStartDate datetime               -- Example: '2008-04-30 00:00:00.0',
    SellEndDate datetime                 -- Example: '2012-05-29 00:00:00.0',
    DiscontinuedDate datetime            -- Example: NULL,
    rowguid text                         -- Example: '01A8C3FC-ED52-458E-A634-D5B6E2ACCFED',
    ModifiedDate datetime                -- Example: '2014-02-08 10:01:36.0'
);

CREATE TABLE Document (
    DocumentNode text PRIMARY KEY        -- Example: '/',
    DocumentLevel integer                -- Example: 0,
    Title text                           -- Example: 'Documents',
    Owner integer                        -- Example: 217,
    FolderFlag integer                   -- Example: 1,
    FileName text                        -- Example: 'Documents',
    FileExtension text                   -- Example: '',
    Revision text                        -- Example: '0',
    ChangeNumber integer                 -- Example: 0,
    Status integer                       -- Example: 2,
    DocumentSummary text                 -- Example: 'It is important that you maintain your bicycle and keep it in good repair. Detai',
    Document blob                        -- Example: '0xD0CF11E0A1B11AE1000000000000000000000000000000003E000300FEFF090006000000000000',
    rowguid text                         -- Example: '26A266F1-1D23-40E2-AF48-6AB8D954FE37',
    ModifiedDate datetime                -- Example: '2017-12-13 13:58:03.0'
);

CREATE TABLE StateProvince (
    StateProvinceID integer PRIMARY KEY  -- Example: 103,
    StateProvinceCode text               -- Example: '01',
    CountryRegionCode text               -- Example: 'FR',
    IsOnlyStateProvinceFlag integer      -- Example: 0,
    Name text                            -- Example: 'Ain',
    TerritoryID integer                  -- Example: 6,
    rowguid text                         -- Example: '00723E00-C976-401D-A92B-E582DF3D6E01',
    ModifiedDate datetime                -- Example: '2014-02-08 10:17:21.0'
);

CREATE TABLE CreditCard (
    CreditCardID integer PRIMARY KEY     -- Example: 11935,
    CardType text                        -- Example: 'SuperiorCard',
    CardNumber text                      -- Example: '11111000471254',
    ExpMonth integer                     -- Example: 11,
    ExpYear integer                      -- Example: 2006,
    ModifiedDate datetime                -- Example: '2013-07-29 00:00:00.0'
);

CREATE TABLE SalesOrderHeader (
    SalesOrderID integer PRIMARY KEY     -- Example: 71821,
    RevisionNumber integer               -- Example: 8,
    OrderDate datetime                   -- Example: '2011-05-31 00:00:00.0',
    DueDate datetime                     -- Example: '2011-06-12 00:00:00.0',
    ShipDate datetime                    -- Example: '2011-06-07 00:00:00.0',
    Status integer                       -- Example: 5,
    OnlineOrderFlag integer              -- Example: 0,
    SalesOrderNumber text                -- Example: 'SO43659',
    PurchaseOrderNumber text             -- Example: 'PO522145787',
    AccountNumber text                   -- Example: '10-4020-000676',
    CustomerID integer                   -- Example: 29825,
    SalesPersonID integer                -- Example: 279,
    TerritoryID integer                  -- Example: 5,
    BillToAddressID integer              -- Example: 985,
    ShipToAddressID integer              -- Example: 985,
    ShipMethodID integer                 -- Example: 5,
    CreditCardID integer                 -- Example: 16281,
    CreditCardApprovalCode text          -- Example: '105041Vi84182',
    CurrencyRateID integer               -- Example: 4,
    SubTotal real                        -- Example: 20565.6206,
    TaxAmt real                          -- Example: 1971.5149,
    Freight real                         -- Example: 616.0984,
    TotalDue real                        -- Example: 23153.2339,
    Comment text                         -- Example: NULL,
    rowguid text                         -- Example: '0000DE87-AB3F-4920-AC46-C404834241A0',
    ModifiedDate datetime                -- Example: '2011-06-07 00:00:00.0'
);