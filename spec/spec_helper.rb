require 'rake'
require './lib/seed_ext'

ENV["DB"] ||= 'sqlite3'
puts "Using #{ENV["DB"]} to run the tests."
require File.dirname(__FILE__) + "/connections/#{ENV["DB"]}.rb"

ActiveRecord::Schema.define :version => 0 do
  create_table :users, :force => true do |t|
    t.column :name, :string
    t.column :sex, :integer
    t.timestamp
  end
end

class User < ActiveRecord::Base
end

