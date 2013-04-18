# SeedExt

SeedExt can truncate records and seed data from csv/yml file.

## Installation

Add this line to your application's Gemfile:

    gem 'seed_ext', github: rawhide/seed_ext

And then execute:

    $ bundle

## Usage

### In db/seeds/users.yml

    user3:
      id: 3
      name: 担当者3
      sex: 0

    user4:
      id: 4
      name: 担当者4
      sex: 1

### In db/migrate/xxxx_create_users.rb

    create_table :users, :force => true do |t|
      t.column :name, :string
      t.column :sex, :integer
      t.timestamp
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
    1,担当者１,1
    2,担当者２,0

### In db/seeds.rb

    User.truncatio(:csv)

## Customizing

### In db/fixures/users.csv

    id,name,sex
    1,担当者１,1
    2,担当者２,0

### In db/seeds.rb

    User.truncatio(:csv, 'db/fixures')

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
