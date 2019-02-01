require 'aws-record'

class User
  include Aws::Record

  set_table_name ENV['DYNAMODB_TABLE']

  string_attr :id, hash_key: true
  string_attr :name
  integer_attr :age
end
