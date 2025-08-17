# Task 7 – Creating Views

## 🎯 Objective
Learn how to create, use, and manage **SQL Views** for data abstraction and reusable queries.

## 📂 Tables Created
1. **Customers**
   - `customer_id` (Primary Key)
   - `name`
   - `city`
2. **Orders**
   - `order_id` (Primary Key)
   - `customer_id` (Foreign Key → Customers.customer_id)
   - `amount`
   - `product`

## 📊 Sample Data
- Customers: Alice, Bob, Charlie, David
- Orders: Laptop, Mouse, Keyboard, Phone, Charger

## 🔗 Views Implemented
1. **CustomerOrderSummary** – Total orders & amount spent per customer  
2. **HighValueOrders** – Orders with amount > 10,000  
3. **CityCustomers** – Groups customers by city  

## ✅ Usage Examples
- `SELECT * FROM CustomerOrderSummary;` → See order summary of each customer  
- `SELECT * FROM HighValueOrders;` → Get all expensive orders  
- `SELECT * FROM CityCustomers;` → Show customers grouped by city  

## ⚡ Tools Used
- DB Browser for SQLite / MySQL Workbench

---

📤 After running queries, push `.sql` + screenshots + this README to GitHub.
