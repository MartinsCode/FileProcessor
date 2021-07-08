# frozen_string_literal: true

require 'socket'
require 'time'

##
# Class Carbon connects to a carbon database and sends your measurement
class Carbon
  ##
  # initialize new CarbonConnection
  def initialize(socket = TCPSocket.new)
    @socket = socket
    @host = 'localhost'
    @port = 2003
  end

  ##
  # send a message via socket
  def send(topic, value, timestamp)
    message = Carbon.format_message(topic, value, timestamp)
    send_socket(message)
  end

  ##
  # handle sending on tcp layer
  def send_socket(message)
    @socket.open(@host, @port)
    @socket.print message
    @socket.close
  end

  ##
  # formats a message to a single string which then can be sent to carbon in plain text format
  # convert timestamp to unix epoch format on the way
  def self.format_message(topic, value, timestamp)
    "#{topic} #{value} #{format_time(timestamp)}"
  end

  ##
  # convert timestamp to unix epoch time
  def self.format_time(timestamp)
    Time.parse(timestamp).to_i.to_s
  rescue ArgumentError
    # seems to be already unix epoch time, so leave it alone
    timestamp
  end
end
