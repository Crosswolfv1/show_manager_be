# Show Manager Backend
*[Frontend located here](https://github.com/Crosswolfv1/show_manager_fe)*

This repository contains the backend API for the Show Manager application. It is a Ruby on Rails application designed to manage festival schedules, user-specific schedules, and associated shows. The API provides endpoints for retrieving and managing data relevant to music festival scheduling.

## Table of Contents
- [Features](#features)
- [Requirements](#requirements)
- [Setup](#setup)
- [Endpoints](#endpoints)
- [Database Structure](#database-structure)
- [Future Enhancements](#future-enhancements)
- [Contact](#contact_details)

## Features
- Retrieve all festival schedules
- View a user's schedule, including associated shows and other users on the same schedule
- Remove a show from a festival
- Extendable architecture for additional endpoints

## Requirements
This API satisfies the following functional requirements:

1. **Retrieve all festivals**
   - Endpoint to fetch all festivals.
2. **Retrieve a user's schedule**
   - Endpoint to fetch a user's schedule with details about the associated shows and other users sharing the same schedule.
3. **Remove a show from a specific festival**
   - Endpoint to delete a show from a festival.

### Additional Considerations
- The database structure accommodates customizable schedules for users.
- Schedules may also be pre-set options based on interests (e.g., "The Jazz & Blues Itinerary").

## Setup

To run this application locally:

1. Clone the repository:
   ```bash
   git clone https://github.com/Crosswolfv1/show_manager_be.git
   cd show_manager_be
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Set up the database:
   ```bash
   rails db:create db:migrate db:seed
   ```

4. Start the server:
   ```bash
   rails server
   ```

5. The API will be available at `http://localhost:3000`.

## Endpoints

### 1. Get All Festival Schedules
**GET** `/api/v1/festivals` optional `/festivalid` for single result
- **Description:** Retrieves all available festival schedules.
- **Response Example:**
  ```json
  {
    "data": [
        {
            "id": "1",
            "type": "festival",
            "attributes": {
                "name": "Rockin' Valley Fest",
                "location": "Valley Park, New York",
                "start_time": "2025-01-23T17:54:01Z",
                "end_time": "2025-01-24T17:54:01Z",
                "imageURL": "https://i.imgur.com/4TvsNzy.gif"
            },
            "relationships": {
                "attending_artists": {
                    "data": [
                        {
                            "id": "1",
                            "type": "artist"
                        },
                        {
                            "id": "7",
                            "type": "artist"
                        },
                        {
                            "id": "10",
                            "type": "artist"
                        }
                    ]
                },
                "users": {
                    "data": [
                        {
                            "id": "1",
                            "type": "user"
                        },
                        {
                            "id": "2",
                            "type": "user"
                        }
                    ]
                }
            }
        },"..."]}
  ```

### 2. Get a User's Schedule
**GET** `/api/v1/users` optional `/userid` for single result
- **Description:** Retrieves a specific user's schedule, including associated shows and other users on the same schedule.
- **Response Example:**
  ```json
  {
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "first_name": "Alice",
            "last_name": "Smith",
            "email": "alice.smith@example.com"
        },
        "relationships": {
            "festivals": {
                "data": [
                    {
                        "id": "1",
                        "type": "festival"
                    },
                    {
                        "id": "3",
                        "type": "festival"
                    }
                ]
            }
        }
    },
    "included": [
        {
            "id": "1",
            "type": "festival",
            "attributes": {
                "name": "Rockin' Valley Fest",
                "location": "Valley Park, New York",
                "start_time": "2025-01-23T17:54:01Z",
                "end_time": "2025-01-24T17:54:01Z",
                "imageURL": "https://i.imgur.com/4TvsNzy.gif"
            },
            "relationships": {
                "attending_artists": {
                    "data": [
                        {
                            "id": "1",
                            "type": "artist"
                        },
                        {
                            "id": "7",
                            "type": "artist"
                        },
                        {
                            "id": "10",
                            "type": "artist"
                        }
                    ]
                },
                "users": {
                    "data": [
                        {
                            "id": "1",
                            "type": "user"
                        },
                        {
                            "id": "2",
                            "type": "user"
                        }
                    ]
                }
            }
        }"..."]}
  ```

### 3. Remove a Show from a Festival
**DELETE** `/api/v1/festivals/:festival_id/artist/artist_id`
- **Description:** Removes a specific show from a festival's schedule.
- **Response Example**
```json
{
    "message": "Artist successfully removed from festival"
}
```
## Database Structure
The application uses the following data model:

![DB Diagram](./readme%20artifacts/Screenshot%202025-01-22%20at%2012.32.36.png)

## Future Enhancements
- Add user authentication and authorization.
- Implement time conflict checks for user schedules.
- Support bulk operations, such as adding multiple shows to a schedule.

## Contact Details
- [Github](https://github.com/Crosswolfv1) Crosswolfv1
- [LinkedIn](https://www.linkedin.com/in/jeremiahross/) /in/jeremiahross
