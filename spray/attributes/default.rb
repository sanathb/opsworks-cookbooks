
default['spray']['name'] = 'spray'
default['spray']['path'] = '/opt/' + default['spray']['name']

default['spray']['java']['option'] = '-server -Xmx1024m –Xms1024m -XX:MaxPermSize=128m'
default['spray']['scala']['version'] = '2.10'

default['spray']['app']['name'] = 'app'
default['spray']['app']['version'] = '1.0.0'