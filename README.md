# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of learning Ruby.
Using existing code base, implemented new features and styles as required such as add sold out badge for products with 0 quantity, allow admin to add more categories, enhance empty cart and order details page,implent about route, add admin and user authentication. Tested using Rspec and cypress.

## Screenshots
!['home page'](https://github.com/prashanthk02/jungle-rails/blob/master/docs/home.png?raw=true)
!['sold out badge'](https://github.com/prashanthk02/jungle-rails/blob/master/docs/Sold_out.png?raw=true)
!['login page'](https://github.com/prashanthk02/jungle-rails/blob/master/docs/Login_page.png?raw=true)
!['cart payment'](https://github.com/prashanthk02/jungle-rails/blob/master/docs/Cart_payment.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Testing
* Rspec
* Cypress

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
