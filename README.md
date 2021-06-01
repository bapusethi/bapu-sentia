# README

## Sentia assignment. Supports following
 * Importing user CSV to add users
 * Searching users first name, last name, vehicle, weapons
 * Does not support sorting by columns

## System dependencies
  Please run 
  ```bash
    bundle install
    yarn install
  ```

## How to run the test suite
  Please run
  ```bash
     rspec spec/
  ```

## Development Step
  Setup DB
  
  ```bash
    rake db:setup
  ```

  Start server: 
  ```bash
    rails s
  ```
  Start webpacker:
  ```bash
   ./bin/webpack-dev-server
  ```