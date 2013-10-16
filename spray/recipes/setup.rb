package 'unzip' do
  action :install
end

template 'spray setup' do
  path value_for_platform(
    ['centos','redhat','fedora','amazon'] => {'default' => '/etc/init.d/spray'},
    'default' => '/etc/init.d/spray'
  )
  source 'spray.erb'
  backup false
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
