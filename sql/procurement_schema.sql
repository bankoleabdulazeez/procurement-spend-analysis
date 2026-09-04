-- MySQL DDL for procurement dataset

CREATE TABLE IF NOT EXISTS purchases (
  TransactionID VARCHAR(64) NOT NULL,
  ItemName VARCHAR(255) NOT NULL,
  Category VARCHAR(100) NOT NULL,
  Quantity INT NOT NULL,
  UnitPrice DECIMAL(18,2) NOT NULL,
  TotalCost DECIMAL(18,2) NOT NULL,
  PurchaseDate DATE NOT NULL,
  Supplier VARCHAR(255) NOT NULL,
  Buyer VARCHAR(255),
  PRIMARY KEY (TransactionID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Recommended indexes for common analytical queries
CREATE INDEX idx_purchases_supplier ON purchases (Supplier);
CREATE INDEX idx_purchases_category ON purchases (Category);
CREATE INDEX idx_purchases_purchase_date ON purchases (PurchaseDate);
CREATE INDEX idx_purchases_item ON purchases (ItemName);

-- Optional composite index for supplier-category queries
CREATE INDEX idx_supplier_category ON purchases (Supplier, Category);
