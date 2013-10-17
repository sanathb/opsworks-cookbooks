include_recipe "aws"

zip_filename = node[:spray][:app][:name] + '.zip'
zip_filepath = node[:spray][:path] + '/' + zip_filename

aws_s3_file zip_filepath do
  bucket node['aws']['bucket']['name']
  remote_path node['aws']['bucket']['file_path']
  aws_access_key_id node['aws']['aws_access_key_id']
  aws_secret_access_key node['aws']['aws_secret_access_key']
end

bash 'unzip #{zip_filename} file' do
	cwd node[:spray][:path]
	user 'root'
	code <<-EOH
	/etc/init.d/#{node[:spray][:name]} stop
	chmod 755 ./#{zip_filename}
  unzip ./#{zip_filename}
  rm -rf ./#{node[:spray][:app][:name]}
	mv ./#{node[:spray][:app][:name] + '-' + node[:spray][:app][:version]} ./#{node[:spray][:app][:name]}
	rm -rf ./#{zip_filename}
	/etc/init.d/#{node[:spray][:name]} start
	EOH
end