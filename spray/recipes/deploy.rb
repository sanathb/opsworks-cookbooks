include_recipe 'spray::service'

execute 'unzip spray' do
  cwd node[:spray][:path]
  command 'unzip -o ' + node[:spray][:app][:name] + '.zip'
  action :run
  only_if { ::File.exists?(node[:spray][:path] + '/' + node[:spray][:app][:name] + '.zip') }
  notifies :restart, "service[spray]", :immediately
end

file node[:spray][:path] + '/' + node[:spray][:app][:name] + '.zip' do
  action :delete
  only_if { ::File.exists?(node[:spray][:path] + '/' + node[:spray][:app][:name] + '.zip') }
end