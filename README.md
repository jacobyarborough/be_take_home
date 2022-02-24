# Mod 4 BE Take Home

Mod4 BE Take Home is a ruby on rails API that exposes endpoints for a hypothetical frontend. The application exposes data related to customers and their tea subscriptions. This is a RESTful API that returns JSON when a request is sent. 

This application uses Ruby 2.7.2 and Rails 5.2.6.

## Application Setup 

Follow these steps from terminal:
```
cd into desired directory
git clone git@github.com:jacobyarborough/be_take_home.git
cd be_take_home
bundle install
rails db:{create,migrate, seed}
bundle exec rspec
rails server
```

Navigate to the browser:
```
localhost:3000
```

## Requesting Database Endpoint Items

- `GET /subscriptions?customer_id=`  :exposes all subscriptions, both active and canceled, for a particular customer with a customer_id parameter.
- `POST /customer_subscriptions { customer_id:, subscription_id: }`  :Creates a new customer subscription. Must pass a JSON body payload.
- `PUT /customer_subscriptions {customer_id:, subscription_id:, status: }`  :Updates a cusomter subscription. Must pass a JSON body payload.    :

## Database Schema

<img width="601" alt="Screen Shot 2022-02-14 at 9 28 54 AM" src="https://user-images.githubusercontent.com/81917337/153910131-dee749ad-32e3-47e4-b44b-c148c8d3a120.png">
