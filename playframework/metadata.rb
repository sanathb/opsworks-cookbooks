name             'playframework'
maintainer       'iwaltgen'
maintainer_email 'iwaltgen@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures playframework-server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe "playframework::setup", "Installs playframework service script"
recipe "playframework::deploy", "Download & restart service"
recipe "playframework::undeploy", "stop service"

supports "ubuntu"

depends "aws"