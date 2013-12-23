bash 'playframework service stop' do
  code <<-EOH
  /etc/init.d #{node['playframework']['name']} stop
  EOH
end