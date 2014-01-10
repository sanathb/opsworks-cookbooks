include_recipe "aws"
include_recipe "spray::setup"

filename = node['spray']['app']['name'] + '.jar'
filepath = node['spray']['path'] + '/' + filename

bash 'stop #{filename}' do
  cwd node['spray']['path']
  user 'root'
  code <<-EOH
    /etc/init.d/#{node['spray']['name']} stop
  EOH
end

aws_s3_file filepath do
  bucket node['aws']['bucket_name']
  remote_path filename
  aws_access_key_id node['aws']['access_key_id']
  aws_secret_access_key node['aws']['secret_access_key']
end

bash 'start #{filename}' do
  cwd node['spray']['path']
  user 'root'
  code <<-EOH
    /etc/init.d/#{node['spray']['name']} start
  EOH
end