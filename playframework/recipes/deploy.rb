include_recipe "aws"
include_recipe "playframework::setup"

filedir = node['playframework']['app']['name'] +'-' + node['playframework']['app']['version']
filename = node['playframework']['app']['name'] +'-' + node['playframework']['app']['version'] + '.zip'
filepath = node['playframework']['path'] + '/' + filename

aws_s3_file filepath do
  bucket node['aws']['bucket_name']
  remote_path filename
  aws_access_key_id node['aws']['access_key_id']
  aws_secret_access_key node['aws']['secret_access_key']
end

bash 'unzip & restart #{filename}' do
  cwd node['playframework']['path']
  user 'root'
  code <<-EOH
    /etc/init.d/#{node['playframework']['name']} stop
    rm -rf ./#{node['playframework']['app']['name']}
    unzip -o ./#{filename}
    mv ./#{filedir} ./#{node['playframework']['app']['name']}
    /etc/init.d/#{node['playframework']['name']} start
  EOH
end