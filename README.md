# Koroibos API

[![Build Status](https://travis-ci.com/zacisaacson/koroibos.svg?branch=master)](https://travis-ci.com/zacisaacson/koroibos)

## Introduction

The Koroibos API emulates a take home challenge and utilizes six endpoints using 2016 Olympic data. The endpoints include information about every olympian that competed, the youngest and oldest olympians, every sport and its events, and the medalists for each event.

This API is deployed to Heroku [here](https://pacific-inlet-44351.herokuapp.com/api/v1/olympians).



## Initial Setup

Navigate into a desired directory and execute the following commands to set up the repository:

```
git clone git@github.com:zacisaacson/koroibos.git
cd koroibos_api
bundle install
rake db:{create,migrate}
rake import_events
rake import_olympians
rake import_olympian_events
rails server
```

You can access the API locally by navigating to http://localhost:3000 in your desired browser.


## Running Tests

To make sure the repository is set up correctly, run the test suite with the following command:

```
bundle exec rspec
```


## Endpoints

#### All Olympians: `GET /api/v1/olympians`

This endpoint retrieves all of the olympians that competed in the 2016 Olympics.

Response format:
```
{
  "olympians": [
    {
      "name": "Maha Abdalsalam",
      "team": "Egypt",
      "age": 18,
      "sport": "Diving"
      "total_medals_won": 0
    },
    {
      "name": "Ahmad Abughaush",
      "team": "Jordan",
      "age": 20,
      "sport": "Taekwondo"
      "total_medals_won": 1
    },
    {...}
  ]
}
```

#### Youngest Olympians: `GET /api/v1/olympians?age=youngest`

This endpoint gives back the youngest olympian that competed in the 2016 Olympics.

Response format:
```
{
  "olympians": [
    {
      "name": "Ana Iulia Dascl",
      "team": "Romania",
      "age": 13,
      "sport": "Swimming",
      "total_medals_won": 0
    }
  ]
}
```

#### Oldest Olympians: `GET /api/v1/olympians?age=oldest`

This endpoint gives back the oldest olympian that competed in the 2016 Olympics.

Response format:
```
{
  "olympians": [
    {
      "name": "Julie Brougham",
      "team": "New Zealand",
      "age": 62,
      "sport": "Equestrianism",
      "total_medals_won": 0
    }
  ]
}
```

#### Olympian Statistics: `GET /api/v1/olympian_stats`

This endpoint gives statistics for all olympians that competed.

Response format:
```
{
  "olympian_stats": {
    "total_competing_olympians": 3120
    "average_weight:" {
      "unit": "kg",
      "male_olympians": 75.4,
      "female_olympians": 70.2
    },
    "average_age:" 26.2
  }
}
```

#### All Olympic Events: `GET /api/v1/events`

This endpoint lists all of the events during the 2016 Olympics.

Response format:
```
{
  "events": [
    {
      "sport": "Archery",
      "events": [
        "Archery Men's Individual",
        "Archery Men's Team",
        "Archery Women's Individual",
        "Archery Women's Team"
      ]
    },
    {
      "sport": "Badminton",
      "events": [
        "Badminton Men's Doubles",
        "Badminton Men's Singles",
        "Badminton Mixed Doubles",
        "Badminton Women's Doubles",
        "Badminton Women's Singles"
      ]
    },
    {...}
  ]
}
```

#### Event Medalists: `GET /api/v1/events/:id/medalists`

This endpoint returns all the medalists for a given event.

Response format:
```
{
  "event": "Swimming Men's 200 metres Breaststroke",
  "medalists": [
    {
      "name": "Dmitry Igorevich Balandin",
      "team": "Kazakhstan",
      "age": 21,
      "medal": "Gold"
    },
    {
      "name": "Anton Mikhaylovich Chupkov",
      "team": "Russia",
      "age": 19,
      "medal": "Bronze"
    }
  ]
}
```


## Database Schema

<img width="946" alt="Screen Shot 2020-03-04 at 1 42 34 AM" src="https://user-images.githubusercontent.com/50255174/75860740-3a50d200-5df4-11ea-8338-034127a3bca1.png">


## Tech Stack

- Ruby/Rails
- PostgreSQL
- Travis CI
- RSpec


## Core Contributors

- [Zac Isaacson](https://github.com/zacisaacson)
