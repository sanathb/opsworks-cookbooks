include_recipe "aws"
include_recipe "spray::setup"

zip_filename = node['spray']['app']['name'] + '.zip'
zip_filepath = node['spray']['path'] + '/' + zip_filename

aws_s3_file zip_filepath do
  bucket node['aws']['bucket_name']
  remote_path zip_filename
  aws_access_key_id node['aws']['access_key_id']
  aws_secret_access_key node['aws']['secret_access_key']
end

bash 'unzip #{zip_filename} file' do
	cwd node['spray']['path']
	user 'root'
	code <<-EOH
	/etc/init.d/#{node['spray']['name']} stop
  unzip -o ./#{zip_filename}
  mv ./#{node['spray']['app']['name']}/logs ./#{node['spray']['app']['name'] + '-' + node['spray']['app']['version']}/logs
  rm -rf ./#{node['spray']['app']['name']}
  rm -rf ./#{zip_filename}
	mv ./#{node['spray']['app']['name'] + '-' + node['spray']['app']['version']} ./#{node['spray']['app']['name']}
	/etc/init.d/#{node['spray']['name']} start
	EOH
end