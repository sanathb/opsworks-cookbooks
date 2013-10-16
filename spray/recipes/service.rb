service 'spray' do
  service_name value_for_platform(
    ['centos','redhat','fedora','amazon'] => {'default' => 'spray'},
    'default' => 'spray'
  )
  if platform?('ubuntu') && node[:platform_version].to_f >= 10.04
      provider Chef::Provider::Service::Upstart
  end
  supports :start => true, :stop => true, :restart => true, :status => false
  action :enable
end