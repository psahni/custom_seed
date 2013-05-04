# CustomSeed

With The help of custom seed, we are able to maintain seeds versions, just like rails migrations.

You insert some seed data into database, later on you wish insert new data with out running old seeds.


## Installation

Add it to your Gemfile:

```ruby
gem 'custom_seed', :git => 'https://github.com/psahni/custom_seed.git'
```

Run the following command to install it:

```console
bundle install
```

Run the generator:

```console
rails generate custom_seed:install
```

Create a seed file:

```console
 rails generate custom_seed <file_name>.rb
```
## Usage


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
