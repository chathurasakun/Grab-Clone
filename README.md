# 🚀 Project Name

![300x0w](https://github.com/user-attachments/assets/cd646539-6030-4905-85f8-924bf7a3ef94)


This is a clone for existing Grab app. It is a modularized iOS project written in Swift using Xcode. This project follows a scalable architecture by separating features and shared utilities into independent modules.

---

## 📦 Features

- Modular architecture using Xcode frameworks
- Separation of concerns for better maintainability (MVVM+Clean architecture)
- Scalable codebase structure
- Dependency injection friendly
- Swinject manages dependecies acting as dependecy container
- Coordinator Pattern decouple navigation logic from view controllers

---

## 📁 Project Structure

<img width="348" alt="Screenshot 2025-04-21 at 11 20 22 PM" src="https://github.com/user-attachments/assets/bc9712ec-288b-4884-b78e-201920766ac9" />

- each framework follows MVVM with clean architure.
- We have Auth / ServiceItem and Common modules.
- Common module includes sharable logic for all other framework including network logic, App colors, data persistence with core data

<img width="329" alt="Screenshot 2025-04-21 at 11 49 33 PM" src="https://github.com/user-attachments/assets/c8f0d5ee-0160-4c51-847a-bead6faab0df" />

---

## ▶️ Run the Project

To run the project locally:

### 💻 Prerequisites
- Xcode 15+ will be better
- macOS Ventura or later

### 🛠 Setup

1. **Clone the repository:**
   ```bash
   git clone git@github.com:chathurasakun/Grab-Clone.git
   cd Grab-Clone
   pod install (If M series try this ---> arch -x86_64 pod install)
   open TestApp.xcworkspace

### 🧭 What is next 🤔💡📈📈

- Setup CICD pipeline
- Improve the build effiency without building each module manually
- Write more test cases that cover view models / usecases and repository / Mock API calls
- Complete order module 



