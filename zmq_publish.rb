require 'rubygems'
require 'bundler/setup'

Bundler.require

def kick_it_off!(port)
  context = ZMQ::Context.new
  sender = context.socket ZMQ::PUB
  sender.setsockopt ZMQ::IDENTITY, 'nunchucker'

  port_number = "900#{port - 1}"
  sender.bind "tcp://*:#{port_number}"

  sp = SerialPort.new("/dev/tty.usbmodem14#{port}1", 9600, 8, 1, SerialPort::NONE)

  def map(val, min, high)
    val =  Float(val)
    val -= min
    val =  val * 2 / (high - min)
    val -= 1

    val.abs > 0.1 ? val : 0
  end

  while(true) do
    message = sp.gets.chomp

    x, y, z, c = message.split(" ")

    json = {
      nunchuck: port,
      x: map(x, 21, 227),
      y: map(y, 32, 227),
      z: z,
      c: c
      }.to_json

    puts JSON.parse(json)
    sender.send(json)
  end
end

port = ARGV[0]

if port
  port = port.to_i
  if [1,2].include? port
    kick_it_off!(port)
  else
    puts "That is not a valid port (must be 1 or 2)"
  end
else
  puts "You must pass in a port (1 or 2)"
end
