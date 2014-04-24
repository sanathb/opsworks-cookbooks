include_recipe "aws"

package 'unzip' do
  action :install
end

template '/etc/init.d/spray' do
  source 'spray.erb'
  owner 'root'
  group 'root'
  mode 0755
end

directory node['spray']['path'] do
  owner 'root'
  group 'root'
  mode 0755
  recursive true
end

newrelic_filename = node['spray']['app']['name'] +'-' + 'newrelic-agent.zip'

aws_s3_file '/var/' + newrelic_filename do
  only_if node['spray']['app']['newrelic']
  bucket node['aws']['bucket_name']
  remote_path newrelic_filename
  aws_access_key_id node['aws']['access_key_id']
  aws_secret_access_key node['aws']['secret_access_key']
end

bash 'unzip newrelic ' do
  only_if node['spray']['app']['newrelic']
  cwd '/var'
  user 'root'
  code <<-EOH
    tar -zxvf ./#{newrelic_filename}
  EOH
end