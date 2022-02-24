# Stall Card Back-End Application

Stall Card Back-End is a Ruby on Rails Application that exposes data to the Stall Card Front-End Application.  The data from the databases are exposed using GraphQL. 

This application uses Ruby 2.7.2 and Rails 5.2.6.

## Application Setup 

Follow these steps from terminal:
```
cd into desired directory
git clone git@github.com:Stall-Card-App/stall_card_be.git
cd stall_card_be
bundle install
rails db:{create,migrate}
bundle exec rspec
rails server
```

## API Key Requests:

- [MapQuest Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/)
- [Open Weather API](https://openweathermap.org/api/one-call-api)

Navigate to the browser:
```
localhost:3000
```

## Requesting Database Endpoint Items

- `GET /api/v1/forecast?location=`                 :uses location parameter to consume and expose the forecast for the location
- `POST /graphql`                                  :exposes requested data for barns, employees, horses, owners, vets, farriers

## Database Schema

<img width="601" alt="Screen Shot 2022-02-14 at 9 28 54 AM" src="https://user-images.githubusercontent.com/81917337/153910131-dee749ad-32e3-47e4-b44b-c148c8d3a120.png">
