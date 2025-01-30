# 📌 Boardroom Booking App

Welcome to the **Boardroom Booking App**, a SwiftUI-based application designed to facilitate boardroom reservations with an intuitive and user-friendly interface. This app integrates with an external API for real-time boardroom availability, bookings, and employee management.

## 📖 Table of Contents
- [Features](#features)
- [API Integration](#api-integration)
- [Implementation](#implementation)
- [Methodology](#methodology)
- [Tools & Technologies Used](#tools--technologies-used)
- [Screenshots](#screenshots)


---

## 🎯 Features
- **User Authentication**: Secure login for employees using API authentication.
- **Boardroom Listing**: Display all available boardrooms with details and images.
- **Booking System**: Users can reserve boardrooms and manage their bookings.
- **Custom Calendar**: View all boardroom bookings in a visually structured manner.
- **Boardroom Details**: Detailed view of each boardroom, including amenities and seat availability.
- **Success Confirmation**: Feedback on successful bookings.

---

## 🌐 API Integration
This app integrates with the **Airtable API** to fetch and manage data. The following endpoints are used:

### **Boardrooms**
- **GET** `/boardrooms` - Fetch all boardrooms
- **GET** `/boardrooms/{id}` - Get details of a specific boardroom

### **Bookings**
- **GET** `/bookings` - Fetch all bookings
- **POST** `/bookings` - Create a new booking
- **DELETE** `/bookings/{id}` - Cancel a booking

### **Employees**
- **GET** `/employees` - Fetch all employees
- **POST** `/login` - Authenticate an employee

Each request requires an **Authorization Token** for secure access.

---

## 🏗️ Implementation
This project follows a **MVVM (Model-View-ViewModel)** architecture for separation of concerns and scalability.

### **Project Structure:**
📂 BoardroomBookingApp
- 📂 Model *(Defines boardrooms, bookings, and employees)*
- 📂 View *(SwiftUI screens and UI components)*
- 📂 ViewModel *(Handles API calls and business logic)*
- 📂 Networking *(API service and URLSession calls)*
- 📂 Assets *(Images)*

---

## ⚙️ Methodology
1. **Planning & UI Design**: Created UI wireframes using **Figma**.
2. **API Integration**: Connected the app with **Airtable API** using `URLSession`.
3. **MVVM Implementation**: Ensured separation of concerns and clean data handling.
4. **Custom UI Components**: Designed a calendar, booking confirmation, and boardroom cards.
5. **Testing & Debugging**: Verified API responses and UI interactions.
6. **Deployment & Version Control**: Managed with **GitHub** for version control.

---

## 🛠 Tools & Technologies Used
- **SwiftUI** - Declarative UI framework
- **Combine** - Data binding and state management
- **URLSession** - API networking
- **Airtable API** - Backend service for managing data
- **Figma** - UI/UX design
- **GitHub** - Version control and collaboration

---

## 📸 Screenshots
| Login Screen | Boardroom List | Booking Confirmation |
|-------------|---------------|------------------|

![Login screen](https://github.com/user-attachments/assets/0861b424-e25b-4f3b-8ee8-54513c79a2a2)



![Main screen](https://github.com/user-attachments/assets/c93a782e-4a53-44ce-ae37-651d332a5ab2)



![Success screen](https://github.com/user-attachments/assets/59bdd269-3822-4022-a5af-9cd99aca1349)


---

**Developed with ❤️ using SwiftUI & Airtable API**

