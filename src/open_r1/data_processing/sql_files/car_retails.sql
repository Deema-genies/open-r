CREATE TABLE offices (
    officeCode text PRIMARY KEY          -- Example: '1',
    city text                            -- Example: 'San Francisco',
    phone text                           -- Example: '+1 650 219 4782',
    addressLine1 text                    -- Example: '100 Market Street',
    addressLine2 text                    -- Example: 'Suite 300',
    state text                           -- Example: 'CA',
    country text                         -- Example: 'USA',
    postalCode text                      -- Example: '94080',
    territory text                       -- Example: 'NA'
);

CREATE TABLE employees (
    employeeNumber integer PRIMARY KEY   -- Example: 1002,
    lastName text                        -- Example: 'Murphy',
    firstName text                       -- Example: 'Diane',
    extension text                       -- Example: 'x5800',
    email text                           -- Example: 'dmurphy@classicmodelcars.com',
    officeCode text                      -- Example: '1',
    reportsTo integer                    -- Example: 1002,
    jobTitle text                        -- Example: 'President',
    FOREIGN KEY (reportsTo) REFERENCES employees(employeeNumber),
    FOREIGN KEY (officeCode) REFERENCES offices(officeCode)
);

CREATE TABLE customers (
    customerNumber integer PRIMARY KEY   -- Example: 103,
    customerName text                    -- Example: 'Atelier graphique',
    contactLastName text                 -- Example: 'Schmitt',
    contactFirstName text                -- Example: 'Carine ',
    phone text                           -- Example: '40.32.2555',
    addressLine1 text                    -- Example: '54, rue Royale',
    addressLine2 text                    -- Example: '',
    city text                            -- Example: 'Nantes',
    state text                           -- Example: 'WI',
    postalCode text                      -- Example: '44000',
    country text                         -- Example: 'France',
    salesRepEmployeeNumber integer       -- Example: 1370,
    creditLimit real                     -- Example: 21000.0,
    FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees(employeeNumber)
);

CREATE TABLE orders (
    orderNumber integer PRIMARY KEY      -- Example: 10100,
    orderDate date                       -- Example: '2003-01-06',
    requiredDate date                    -- Example: '2003-01-13',
    shippedDate date                     -- Example: '2003-01-10',
    status text                          -- Example: 'Shipped',
    comments text                        -- Example: 'Check on availability.',
    customerNumber integer               -- Example: 363,
    FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
);

CREATE TABLE payments (
    customerNumber integer               -- Example: 103,
    checkNumber text                     -- Example: 'HQ336336',
    paymentDate date                     -- Example: '2004-10-19',
    amount real                          -- Example: 6066.78,
    PRIMARY KEY (customerNumber, checkNumber),
    FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber)
);

CREATE TABLE productlines (
    productLine text PRIMARY KEY         -- Example: 'Classic Cars',
    textDescription text                 -- Example: 'Attention car enthusiasts: Make your wildest car ownership dreams come true. Whe',
    htmlDescription text                 -- Example: NULL,
    image blob                           -- Example: NULL
);

CREATE TABLE products (
    productCode text PRIMARY KEY         -- Example: 'S10_1678',
    productName text                     -- Example: '1969 Harley Davidson Ultimate Chopper',
    productLine text                     -- Example: 'Motorcycles',
    productScale text                    -- Example: '1:10',
    productVendor text                   -- Example: 'Min Lin Diecast',
    productDescription text              -- Example: 'This replica features working kickstand, front suspension, gear-shift lever, foo',
    quantityInStock integer              -- Example: 7933,
    buyPrice real                        -- Example: 48.81,
    MSRP real                            -- Example: 95.7,
    FOREIGN KEY (productLine) REFERENCES productlines(productLine)
);

CREATE TABLE orderdetails (
    orderNumber integer                  -- Example: 10100,
    productCode text                     -- Example: 'S18_1749',
    quantityOrdered integer              -- Example: 30,
    priceEach real                       -- Example: 136.0,
    orderLineNumber integer              -- Example: 3,
    PRIMARY KEY (orderNumber, productCode)
);