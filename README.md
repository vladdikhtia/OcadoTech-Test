# 🛒 OcadoTest

A simple shopping app built with SwiftUI for iOS 16 and above. Created as a recruitment task.

## ✅ Features Implemented

### 🧾 General
- Written in **SwiftUI**, supports **iOS 16 +**
- Layout adjusts smoothly to different screen sizes and **orientation changes**
- Functional and testable **MVVM** architecture
- Organized, modular code structure
- Local parsing of product list from **items.json**

---

### 🛍️ **Browse Tab**
- Displays product list loaded from `items.json`
- All products initially have quantity set to **0**
- Each product card includes:
  - **Image**, **description**, **price**
  - Favorite icon (using SF Symbols) toggled via tap
  - Increment/decrement quantity buttons
- Quantity cannot exceed available **inStock** value ✅ *(bonus task implemented)*

---

### 💼 **Checkout Tab**
- Shows only selected products (quantity > 0)
- Scrollable list with product details and quantities
- **"Checkout"** button at the bottom:
  - **Visible only** when basket is not empty
  - Triggers **alert** with comma-separated list of product IDs on press

---

### 💡 **Bonus Tasks Completed**
- ✅ Quantity limited to **inStock**
- ✅ Basket value displayed in **navigation bar** (on both tabs)

---

## 📱 UI & Accessibility
- SF Symbols for icons
- System fonts and font styles
- Supports both **Light** and **Dark Mode**
