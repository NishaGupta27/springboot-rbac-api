# Spring Boot RBAC API

A comprehensive Spring Boot REST API with Role-Based Access Control (RBAC), PostgreSQL database, and JWT authentication.

## Features

- ✅ User Authentication with JWT
- ✅ Role-Based Access Control (RBAC)
- ✅ PostgreSQL Integration
- ✅ Spring Security Implementation
- ✅ Admin and User Roles
- ✅ RESTful API Endpoints
- ✅ User Registration and Login
- ✅ User Management (Admin Only)

## Prerequisites

- Java 17 or higher
- Maven 3.6+
- PostgreSQL 12 or higher
- Git

## Project Structure

```
src/main/java/com/rbac/
├── controller/
│   ├── AuthController.java
│   ├── AdminController.java
│   ├── UserController.java
│   └── PublicController.java
├── entity/
│   ├── User.java
│   └── Role.java
├── repository/
│   ├── UserRepository.java
│   └── RoleRepository.java
├── security/
│   ├── JwtTokenProvider.java
│   ├── JwtAuthenticationFilter.java
│   └── UserDetailsServiceImpl.java
├── config/
│   ├── SecurityConfig.java
│   └── DataInitializer.java
├── dto/
│   ├── LoginRequest.java
│   ├── SignupRequest.java
│   └── JwtAuthenticationResponse.java
└── SpringBootRbacApiApplication.java
```

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/NishaGupta27/springboot-rbac-api.git
cd springboot-rbac-api
```

### 2. Create PostgreSQL Database

```sql
CREATE DATABASE rbac_db;
```

### 3. Configure Database Connection

Update `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/rbac_db
spring.datasource.username=postgres
spring.datasource.password=your_password
```

### 4. Build and Run

```bash
# Clean build
mvn clean install

# Run the application
mvn spring-boot:run
```

The application will start at `http://localhost:8080/api`

## Default Credentials

### Admin User
- **Username:** admin
- **Password:** admin123
- **Email:** admin@example.com

### Regular User
- **Username:** user
- **Password:** user123
- **Email:** user@example.com

## API Endpoints

### Authentication Endpoints (`/api/auth`)

#### Login
```http
POST /api/auth/login
Content-Type: application/json

{
  "username": "admin",
  "password": "admin123"
}
```

**Response:**
```json
{
  "accessToken": "eyJhbGciOiJIUzUxMiJ9...",
  "tokenType": "Bearer",
  "expiresIn": 86400,
  "username": "admin"
}
```

#### Sign Up
```http
POST /api/auth/signup
Content-Type: application/json

{
  "username": "newuser",
  "email": "newuser@example.com",
  "password": "password123",
  "roles": ["USER"]
}
```

### Admin Endpoints (`/api/admin`) - Requires ADMIN Role

#### Dashboard
```http
GET /api/admin/dashboard
Authorization: Bearer {token}
```

#### Get All Users
```http
GET /api/admin/users
Authorization: Bearer {token}
```

#### Get User by ID
```http
GET /api/admin/users/{id}
Authorization: Bearer {token}
```

#### Update User Status
```http
PUT /api/admin/users/{id}/status?isActive=true
Authorization: Bearer {token}
```

#### Delete User
```http
DELETE /api/admin/users/{id}
Authorization: Bearer {token}
```

### User Endpoints (`/api/user`) - Requires USER or ADMIN Role

#### User Home
```http
GET /api/user/home
Authorization: Bearer {token}
```

#### Get Profile
```http
GET /api/user/profile
Authorization: Bearer {token}
```

### Public Endpoints (`/api/public`) - No Authentication Required

#### Welcome
```http
GET /api/public/welcome
```

#### Health Check
```http
GET /api/public/health
```

## Testing with cURL

### 1. Login
```bash
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"admin123"}'
```

### 2. Access Admin Endpoint
```bash
curl -X GET http://localhost:8080/api/admin/users \
  -H "Authorization: Bearer <your_token_here>"
```

### 3. Access User Endpoint
```bash
curl -X GET http://localhost:8080/api/user/home \
  -H "Authorization: Bearer <your_token_here>"
```

### 4. Access Public Endpoint
```bash
curl -X GET http://localhost:8080/api/public/welcome
```

## Database Schema

### Roles Table
```sql
CREATE TABLE roles (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description VARCHAR(500)
);
```

### Users Table
```sql
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255),
    password VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT true
);
```

### User Roles Join Table
```sql
CREATE TABLE user_roles (
    user_id BIGINT REFERENCES users(id),
    role_id BIGINT REFERENCES roles(id),
    PRIMARY KEY (user_id, role_id)
);
```

## Technologies Used

- **Spring Boot 3.1.5** - Framework
- **Spring Security** - Authentication & Authorization
- **Spring Data JPA** - ORM
- **PostgreSQL** - Database
- **JWT (JJWT)** - Token-based authentication
- **Lombok** - Code generation
- **Maven** - Build tool

## Security Features

- ✅ Password encryption with BCrypt
- ✅ JWT token-based authentication
- ✅ Role-based authorization
- ✅ CORS protection
- ✅ CSRF protection
- ✅ Method-level security with @PreAuthorize
- ✅ Stateless session management

## Contributing

Feel free to fork this repository and submit pull requests for any improvements.

## License

This project is open source and available under the MIT License.

## Contact

For questions or suggestions, please reach out to the repository owner.
