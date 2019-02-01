require 'json'
require 'securerandom'
require_relative './user_model'

def handler(event:, context:)
  user = User.find(id: event['pathParameters']['id'])
  return { statusCode: 404 } unless user

  data = JSON.parse(event['body'])
  user_params = data.slice('name', 'age')

  if user.update(user_params)
    {
      statusCode: 200,
      body: JSON.generate(user.to_h)
    }
  else
    {
      statusCode: 403
    }
  end
end
