require 'json'
require 'securerandom'
require_relative './user_model'

def handler(event:, context:)
  user = User.find(id: event['pathParameters']['id'])
  return { statusCode: 404 } unless user

  user.delete!
  {
    statusCode: 200
  }
end
