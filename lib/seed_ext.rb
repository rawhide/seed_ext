# encoding: utf-8
require 'active_record'
require 'active_support'
require 'csv'
module Railstar
  module SeedExt
    extend ActiveSupport::Concern

    module ClassMethods
      def truncation(sym=:yml, file_dir='db/seeds', sti_flag=false)
        table_name = self.table_name || self.to_s.underscore.pluralize
        sti_flag ? file_name = "#{name.to_s.underscore.pluralize}.#{sym.to_s}" : file_name = "#{table_name}.#{sym.to_s}"
        file_path = File.join(file_dir, file_name)
        raise "#{file_path} file not found."  unless File.exist?(file_path)
        self.transaction do
          self.truncation!
          self.send("create_from_#{sym.to_s}", file_path)
        end
      end

      def truncation!
        return unless self.symbolized_sti_name == self.symbolized_base_class
        case self.connection.adapter_name
        when "SQLite"
          self.connection.execute("DELETE FROM `#{self.table_name}`")
        else
          self.connection.execute("TRUNCATE TABLE #{self.table_name}")
        end
      end

      def create_from_yml(file_path)
        YAML.load_file(file_path).each do |value|
         self.create value.is_a?(Array) ? value.last : value
        end
      end

      def create_from_csv(file_path)
        CSV.foreach(file_path, :headers => true) {|row| self.create Hash[*row.to_a.flatten] }
      end
    end

    module InstanceMethods; end

    included do
      extend ClassMethods
      include InstanceMethods
    end
  end
end
ActiveRecord::Base.send(:include, Railstar::SeedExt)
