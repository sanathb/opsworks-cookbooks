include_recipe 'deploy'

zip_filename = node[:spray][:app][:name] + '.zip'
zip_filepath = node[:spray][:path] + '/' + zip_filename

node[:deploy].each do |application, deploy|
  opsworks_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  opsworks_deploy do
    app application
    deploy_data deploy
  end

  bash 'move & unzip #{zip_filename} file' do
  	cwd node[:spray][:path]
  	user 'root'
  	code <<-EOH
  	mv -f ~/home/#{zip_filename} ./
  	unzip -o ./#{zip_filename}
  	mv -rf ./#{node[:spray][:app][:name] + '-' + node[:spray][:app][:version]}/* ./
  	rm -rf ./#{node[:spray][:app][:name] + '-' + node[:spray][:app][:version]}
  	/etc/init.d #{node[:spray][:app][:name]} restart
  	EOH
  	only_if { ::File.exists?('~/home/' + zip_filepath) }
  end
end