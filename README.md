# GameSeek

## Development Setup

* Copy `config/database.sample.yml` to `config/database.yml` and edit accordingly
* Run `bundle` to get dependencies
* Run `bundle exec rake db:create db:schema:load` to setup the database
* Run `bundle exec rake db:seed` to generate the games

## Testing

* Run `bundle exec rake db:test:prepare` to prepare the test database
* Run `bundle exec rspec spec` to run the test suite