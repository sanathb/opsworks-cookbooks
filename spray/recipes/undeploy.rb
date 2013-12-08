bash 'spray service stop' do
  code <<-EOH
  /etc/init.d #{node['spray']['name']} stop
  EOH
end