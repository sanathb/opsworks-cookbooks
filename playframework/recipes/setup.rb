
package 'unzip' do
  action :install
end

template '/etc/init.d/playframework' do
  source 'playframework.erb'
  owner 'root'
  group 'root'
  mode 0755
end

directory node['playframework']['path'] do
  owner 'root'
  group 'root'
  mode 0755
  recursive true
end
