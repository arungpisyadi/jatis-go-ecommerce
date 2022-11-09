--
-- Table structure for table `customers`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
    `ID` bigint NOT NULL,
    `firstName` varchar(50) NOT NULL,
    `lastName` varchar(50) NOT NULL,
    `title` varchar(50) NOT NULL,
    `phone` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
    `ID` bigint NOT NULL,
    `orderID` bigint NOT NULL,
    `productID` bigint NOT NULL,
    `quantity` int NOT NULL,
    `price` float NOT NULL,
    `discount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
    `ID` bigint NOT NULL,
    `name` varchar(250) NOT NULL,
    `unitPrice` float NOT NULL,
    `inStock` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
    `ID` bigint NOT NULL,
    `method` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Indexes for table `customers`
--
ALTER TABLE `customers`
    ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
    ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
    ADD PRIMARY KEY (`ID`),
    ADD KEY `ForeignKey` (`comment`,`customerID`,`employeeID`),
    ADD KEY `customerID` (`customerID`),
    ADD KEY `employeeID` (`employeeID`),
    ADD KEY `shippingMethodID` (`shippingMethodID`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
    ADD PRIMARY KEY (`ID`),
    ADD KEY `orderID` (`orderID`,`productID`),
    ADD KEY `productID` (`productID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
    ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
    ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
    MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
    MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
    MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
    MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
    MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
    MODIFY `ID` bigint NOT NULL AUTO_INCREMENT;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
    ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customers` (`ID`) ON DELETE CASCADE,
    ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`ID`) ON DELETE CASCADE,
    ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`shippingMethodID`) REFERENCES `shipping_methods` (`ID`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
    ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`ID`) ON DELETE CASCADE,
    ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products` (`ID`) ON DELETE CASCADE;
COMMIT;