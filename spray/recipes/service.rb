service 'spray' do
  if platform?('ubuntu') && node[:platform_version].to_f >= 10.04
      provider Chef::Provider::Service::Upstart
  end

  supports :start => true, :stop => true, :restart => true
  action :nothing
end