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
- `PUT /customer_subscriptions {customer_id:, subscription_id:, status: }`  :Updates a cusomter subscription. Must pass a JSON body payload. 

## Database Schema

![Screen Shot 2022-02-23 at 8 23 54 PM](https://user-images.githubusercontent.com/86209646/155453263-f2805c5c-7f31-4c1a-a8f4-843bd3b62a5a.png)
