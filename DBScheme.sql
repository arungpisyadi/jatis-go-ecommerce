CREATE TABLE `customers` (
  `ID` bigint NOT NULL,
  `companyName` varchar(50) NOT NULL,
  `firstName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `billingAddress` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `email` varchar(75) NOT NULL,
  `companyWebsite` varchar(200) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `fax` varchar(30) NOT NULL,
  `shipAddress` varchar(255) NOT NULL,
  `shipCity` varchar(50) NOT NULL,
  `shipState` varchar(50) NOT NULL,
  `shipZip` varchar(20) NOT NULL,
  `shipPhone` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `employees` (
  `ID` bigint NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `phone` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `orders` (
  `ID` bigint NOT NULL,
  `customerID` bigint NOT NULL,
  `employeeID` bigint NOT NULL,
  `orderDate` date NOT NULL,
  `purchaseOrderNumber` varchar(30) NOT NULL,
  `shipDate` date NOT NULL,
  `shippingMethodID` bigint NOT NULL,
  `freightCharge` float NOT NULL,
  `taxes` float NOT NULL,
  `paymentReceived` tinyint(1) NOT NULL,
  `comment` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `products` (
  `ID` bigint NOT NULL,
  `name` varchar(250) NOT NULL,
  `unitPrice` float NOT NULL,
  `inStock` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `shipping_methods` (
  `ID` bigint NOT NULL,
  `method` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE `customers`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `employees`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ForeignKey` (`comment`,`customerID`,`employeeID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `employeeID` (`employeeID`),
  ADD KEY `shippingMethodID` (`shippingMethodID`);

ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `customers`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `employees`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `orders`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `products`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `shipping_methods`
  MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customers` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`shippingMethodID`) REFERENCES `shipping_methods` (`ID`) ON DELETE CASCADE;
COMMIT;
