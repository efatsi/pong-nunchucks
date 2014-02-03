##Arduino Nunchucks

Ruby code for parsing Serial data from Arduinos, and pushing them to a ZMQ port.

##Setup

This requires two separate Arduinos with [solo_nunchuck.ino](https://github.com/efatsi/pong-nunchucks/blob/master/solo_nunchuck/solo_nunchuck.ino) loaded and running on them, and Wii Nunchucks "plugged in" to your Arduinos as described in the setup comment block of [solo_nunchuck.ino](https://github.com/efatsi/pong-nunchucks/blob/master/solo_nunchuck/solo_nunchuck.ino).

You'll also need a few gems (zmq, json, serialport)

    bundle install

With your gems installed, and your Arduinos plugged in, then just run either `listen.rb` or `zmq_publish.rb` with the appropriate port number (1 or 2). `listen.rb` will simply spit out the firehose of Nunchuck data, `zmq_publish.rb` will do the same but also publish to a local ZMQ port.

    ruby listen.rb 1
