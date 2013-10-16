execute 'unzip spray' do
  cwd node[:spray][:path]
  command 'unzip -o ' + node[:spray][:app][:name] + '.zip'
  action :run
end

file node[:spray][:path] + '/' + node[:spray][:app][:name] + '.zip' do
  action :delete
end

service 'spray' do
  action :restart
end