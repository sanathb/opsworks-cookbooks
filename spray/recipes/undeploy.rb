include_recipe 'spray::service'

service 'spray' do
  action :stop
end