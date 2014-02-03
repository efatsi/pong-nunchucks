##Arduino Nunchucks

Ruby code for parsing Serial data from Arduinos, and pushing them to a ZMQ port.

##Setup

This requires two separate Arduinos with solo_nunchuck.ino loaded and running on them, and Wii Nunchucks "plugged in" to your Arduinos as described in the setup comment block of solo_nunchuck.ino.

You'll also need a few gems

    gem install zmq
    gem install json
    gem install serialport

With your gems installed, and your Arduinos plugged in, then just run either `listen.rb` or `zmq_publish.rb` with the appropriate port number. `listen.rb` will simply spit out the firehose of Nunchuck data, `zmq_publish.rb` will do the same but also publish to a local ZMQ port.

    ruby listen.rb 1
