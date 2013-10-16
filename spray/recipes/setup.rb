include_recipe 'spray::service'

package 'unzip' do
  action :install
end

template '/etc/init.d/spray' do
  source 'spray.erb'
  owner 'root'
  group 'root'
  mode 0755
  notifies :enable, "service[spray]"
end

directory node[:spray][:path] + '/logs' do
  owner 'root'
  group 'root'
  mode 0755
  action :create
  recursive true
end
