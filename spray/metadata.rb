name             'spray'
maintainer       'iwaltgen'
maintainer_email 'iwaltgen@keecon.com'
license          'Apache 2.0'
description      'Installs/Configures spray-server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe "spray::setup", "Installs spray service script"
recipe "spray::deploy", "Download & restart service"
recipe "spray::undeploy", "stop service"

supports "ubuntu"

depends "aws"