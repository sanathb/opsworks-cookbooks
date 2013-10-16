package 'unzip' do
  action :install
end

template '/etc/init.d/spray' do
  source 'spray.erb'
  owner 'root'
  group 'root'
  mode 0755
end

directory node[:spray][:path] + '/logs' do
  owner 'root'
  group 'root'
  mode 0755
  action :create
  recursive true
end
