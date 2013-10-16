include_recipe "aws"
aws = data_bag_item("aws", "main")

zip_filename = node[:spray][:app][:name] + '.zip'
zip_filepath = node[:spray][:path] + '/' + zip_filename

aws_s3_file zip_filepath do
  bucket "opsworks.jenkins.apps"
  remote_path zip_filename
  aws_access_key_id aws['aws_access_key_id']
  aws_secret_access_key aws['aws_secret_access_key']
end

bash 'unzip #{zip_filename} file' do
	cwd node[:spray][:path]
	user 'root'
	code <<-EOH
	unzip ./#{zip_filename}
  rm -rf ./#{node[:spray][:app][:name]}
	mv ./#{node[:spray][:app][:name] + '-' + node[:spray][:app][:version]} ./#{node[:spray][:app][:name]}
	/etc/init.d #{node[:spray][:app][:name]} restart
	EOH
end