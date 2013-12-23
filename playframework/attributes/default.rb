
default['playframework']['name'] = 'playframework'
default['playframework']['path'] = '/var/' + default['playframework']['name']

default['playframework']['java']['option'] = '-Dhttp.port=9200 -J-Xms1024m -J-Xmx1024m -J-server'
default['playframework']['app']['name'] = 'app'
default['playframework']['app']['version'] = '1.0'