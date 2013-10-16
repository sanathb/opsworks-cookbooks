include_recipe 'service'

zip_filename = node[:spray][:app][:name] + '.zip'
zip_filepath = node[:spray][:path] + '/' + zip_filename

execute 'unzip spray' do
  cwd node[:spray][:path]
  command 'unzip -o ' + zip_filename
  action :run
  only_if { ::File.exists?(zip_filepath) }
  notifies :restart, "service[spray]"
end

file zip_filepath do
  action :delete
  only_if { ::File.exists?(zip_filepath) }
end