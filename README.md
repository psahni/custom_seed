# CustomSeed

Rails comes with default utility to run seeds, you write your seed statements and then run rake db:seed to

execute all the statements in the seeds.rb. Whenever you run rake db:seed, it will always execute all the

statements written in seeds.rb file.

With the help of custom seed, we are able to maintain seeds versions, just like rails migrations.

You insert some seed data into database, later on you wish insert new data with out running old seed statements.

In that case this comes out very handy



## Installation

It works with Rails 3 onwards and ruby 1.9

Add it to your Gemfile:

```ruby
gem 'custom_seed', :git => 'https://github.com/psahni/custom_seed.git'
```

Run the following command to install it:

```console
bundle install
```

## Getting Started

Run the generator:

```console
rails generate custom_seed:install
```

Create a seed file:

```console
 rails generate custom_seed <file_name>
```

To execute a seed file

```console
  rake custom_seed:execute
```

## Usage
* rails generate custom_seed:install, will create the table 'custom_seeds' table into database and it will also create a directory custom_seeds inside folder 'db'
* rails generate custom_seed < file_name >, it will generate a file with timestamp prepended to the filename.
  eg: rails generate custom_seed add_users
  We can write out our seed statements and then run them through a rake task rake custom_seed:execute


## Additional Information

If you face any difficulty or confusion regarding using this gem, i request you to put up an issue
or mail me at prashantsahni5@gmail.com. Thanks