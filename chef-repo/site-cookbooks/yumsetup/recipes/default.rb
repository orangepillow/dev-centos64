yum_package "yum-fastestmirror" do
  action :install
end

template "/etc/yum.repos.d/nginx.repo" do
  owner "root"
  owner "root"
  mode "0644"
end

execute "yum-update" do
  user "root"
  command "yum -y update"
  action :run
end

