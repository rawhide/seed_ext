# SeedExt

SeedExt can truncate records and seed data from csv/yml file.

## Installation

Add this line to your application's Gemfile:

    gem 'seed_ext', github: rawhide/seed_ext

And then execute:

    $ bundle

## Usage

### In db/seeds/users.yml

    user1:
      id: 1
      name: user1
      sex: 0

    user2:
      id: 2
      name: user2
      sex: 1

### In db/migrate/xxxx_create_users.rb
    class CreateUsers < ActiveRecord::Migration
      def change
        create_table :users do |t|
          t.string :name
          t.integer :sex
          t.timestamps
        end
      end
    end

### In app/models/user.rb

    class User < ActiveRecord::Base
    end

### In db/seeds.rb

    User.truncation

### To load data:

    rake db:create
    rake db:migrate
    rake db:seed

Users table will be truncated and be loaded data from yml file.

## To load from CSV file

### In db/seeds/users.csv

    id,name,sex
    1,user1,0
    2,user2,1

### In db/seeds.rb

    User.truncation(:csv)

## Customizing

### In db/fixures/users.csv

    id,name,sex
    1,user1,0
    2,user2,1

### In db/seeds.rb

    User.truncation(:csv, 'db/fixures')

### If Model is STI
    
    User.truncation(:csv, 'db/fixures', true)

### You can just truncate

    User.truncation!

Users table will be truncated.(supporting for sqlite3/mysql2/postgresql/sqlserver)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
