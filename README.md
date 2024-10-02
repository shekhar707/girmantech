# GirmanTech Project Overview

This mobile app was built using **Flutter**, **Dart**, **Firebase**, and **BLoC** for state management. The primary goal is to help users search for employees within an organization by leveraging Firebase to handle data and backend operations. The app adheres to the UI/UX guidelines outlined in the Figma design prototype.

### Screenshots

![Home Screen](screenshots/Screenshot_1.png | width=90)
![Home Screen](screenshots/Screenshot_2.png | width=90)
![Home Screen](screenshots/Screenshot_3.png | width=90)
![Home Screen](screenshots/Screenshot_4.png | width=90)
![Home Screen](screenshots/Screenshot_5.png | width=90)
![Home Screen](screenshots/Screenshot_6.png | width=90)
![Home Screen](screenshots/Screenshot_7.png | width=90)
![Home Screen](screenshots/Screenshot_8.png | width=90)
![Home Screen](screenshots/Screenshot_9.png | width=90)


## Tech Stack

- **Flutter**: For cross-platform app development.
- **Dart**: The programming language used with Flutter.
- **Firebase**: Backend services including Firestore for data storage.
- **BLoC**: Business Logic Component for managing state.
- **Clean Architecture**: Structured code organization for maintainability.

## **Figma Design Reference**
- All screens and layouts are guided by a Figma prototype. For detailed visual and interaction patterns, view the Figma file:  
  [Figma Design](https://www.figma.com/design/rJXNcq9yJAZv6T5pMFA0zh/Girman-Mobile-App-Assignment?node-id=1-180&node-type=frame&t=k3rK9zKADlREQFBH-0).


## Core Features

### 1. **Home Screen**
- The landing screen has a simple and elegant design that aligns with Girman Technologies' branding.
- The app bar includes:
  - **Website**: Opens the [GirmanTech website](https://girmantech.com) within an embedded web view.
  - **LinkedIn**: Opens the [LinkedIn company page](https://www.linkedin.com/company/girmantechnologies).
  - **Contact**: Initiates an email to `contact@girmantech.com` using the user’s default email client.
- **Search Bar**: Enables users to search for employees by name and trigger a query.

### 2. **Search Results Screen**
- Displays results in a **card-based format**.
- Each card contains:
  - **User Information**: Shows the first name, last name, address, and contact number.
  - **Image Placeholder**: A generic image for employee avatars.
  - **"Fetch Details" Button**: Displays a detailed view of the selected person’s information.
- Handles scenarios with no matching results, displaying a **user-friendly empty state** as per design specifications.

### 3. **Data Source**
- Employee information is fetched from **Firestore**.
- The data is dynamically loaded based on user input to filter the list.
- Supports edge cases such as no matching names or invalid inputs.

## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/shekhar707/girmantech.git
cd girmantech

# Add Google-Services.json file in android/app directory

# Initial Firebase with your following parameters.

const FirebaseOptions(
  appId: '<your-app-id>',
  apiKey: '<your-api-key>',
  projectId: '<your-project-id>',
);

# Run following command

flutter pub get
flutter run
