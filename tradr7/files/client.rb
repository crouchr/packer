# Chef configuration file used by tradr nodes
# current dir is /etc/chef ?
chef_license "accept"
current_dir = File.dirname(__FILE__)
log_level :info
log_location "/var/log/chef/client.log"
# node_name "crouchr"
client_key "#{current_dir}/crouchr.pem"
validation_key "#{current_dir}/ermin-validation.pem"
chef_server_url "https://chef/organizations/ermin"
# cookbook_path ["#{current_dir}/../cookbooks"]
