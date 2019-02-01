require 'json'
require 'securerandom'
require_relative './user_model'

def handler(event:, context:)
  users = User.scan

  {
    statusCode: 200,
    body: JSON.generate(users.to_a.map(&:to_h))
  }
end
