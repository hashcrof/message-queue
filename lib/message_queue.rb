#envelope
require 'redis'
require 'message'

class MessageQueue

  def initialize(name: )
    @conn = Redis.new
    @queue_name = name
  end

  def push_message(message)
    msg = Message.find_or_create(message)
    msg.save
    @conn.lpush(@queue_name, msg.id)
  end

  def pop_message
    uuid = @conn.lpop(@queue_name)
    Message.find_by(id: uuid)
  end

  def retry_count(uuid)
    message = Message.find_by(id: uuid)
    message.retry
  end

  def update_message(uuid, message_attrs={})
    message = Message.find_by(id: uuid)
    message.update(message_attrs)
  end
end

#VCR
#testing
