bash 'spray service stop' do
  code <<-EOH
  /etc/init.d #{node['spray']['app']['name']} stop
  EOH
end