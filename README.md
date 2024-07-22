

# Login Form and Cart Application

This is a Flutter application that demonstrates user authentication and cart management using a backend API. The application uses the GetX package for state management and dependency injection.

## Features

- User login
- View cart items


## Video



https://github.com/user-attachments/assets/c6ac9144-c769-4112-98cb-ad7aaad9b5ec



## Installation


1. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Set up your API:**
   - Make sure you have a backend API running that supports user authentication and cart management.
   - Update the `api.dart` file with your API base URL and endpoints.

4. **Run the application:**
   ```bash
   flutter run
   ```



## Usage

1. **Login/Register:**
   - Users can login or register using their email and password.
   - The application will save the user's session for future requests.



2. **View Cart:**
   - Users can view their cart items.
   - The cart items are fetched from the server.



## Code Structure

- `lib/main.dart`: Entry point of the application.
- `lib/controllers/`: Contains GetX controllers for managing state.
- `lib/models/`: Contains data models.
- `lib/screens/`: Contains UI screens for login, registration, and cart.
- `lib/services/`: Contains API service classes for making HTTP requests.

## Dependencies

- [GetX](https://pub.dev/packages/get): State management, dependency injection, and route management.
- [http](https://pub.dev/packages/http): For making HTTP requests.


