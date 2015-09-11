# production.rb
set :stage, :production
set :unicorn_rack_env, "production"
set :branch, 'master'
set :rails_env, 'production'
set :migration_role, 'db'

set :ssh_options, {
keys: [File.expand_path('~/.ssh/id_rsa')],
forward_agent: true,
auth_methods: %w(publickey)
}


elasticloadbalancing = Aws::ElasticLoadBalancing::Client.new
instance_states = elasticloadbalancing.describe_instance_health(load_balancer_name: 'LB-gameband-prod').instance_states

target_instance_ids = []
instance_states.each do |instance_state|
#  target_instance_ids.push instance_state.instance_id if instance_state.state == 'InService'
  target_instance_ids.push instance_state.instance_id
end

ec2 = Aws::EC2::Client.new
response = ec2.describe_instances instance_ids: target_instance_ids
#ip_addresses = response.reservations.map {|r| r.instances.map {|i| i.public_ip_address } }.flatten
ip_addresses = response.reservations.map {|r| r.instances.map {|i| i.private_ip_address } }.flatten

ip_addresses.each do |ip|
  server ip.to_s, user: 'rails', roles: %w{web app db}
end
