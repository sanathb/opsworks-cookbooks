
default['spray']['name'] = 'spray'
default['spray']['path'] = '/var/' + default['spray']['name']

default['spray']['java']['option'] = '-Dfile.encoding=UTF-8 -J-server -J-Xmx1024m -J–Xms1024m -J-XX:MaxPermSize=128m'
default['spray']['app']['name'] = 'app'
default['spray']['app']['version'] = '1.0.0'