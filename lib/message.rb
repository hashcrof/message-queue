class Message
  include Mongoid::Document
  field :message_value, type: String
  field :job_status, type: String  #TODO: switch to enum
  field :retry, type: Integer

  store_in collection: "messages"

  # def conn
  #   Mongoid.configure do |config|
  #     config.clients.default = {
  #       hosts: ['localhost:27017'],
  #       database: 'my_db',
  #     }
  #
  #     config.log_level = :warn
  #   end
  # end
end
