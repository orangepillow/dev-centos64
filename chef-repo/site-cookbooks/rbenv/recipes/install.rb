git "/usr/local/rbenv/plugins/rbenv-default-gems" do
  repository "git://github.com/sstephenson/rbenv-default-gems.git"
  reference "master"
  action :checkout
  user "#{node.user}"
  group "rbenv"
end

template "/usr/local/rbenv/default-gems" do
  owner "#{node.user}"
  group "rbenv"
  mode "0775"
end

execute "ruby install" do
  not_if "source /etc/profile.d/rbenv.sh; rbenv versions | grep #{node.build}"
  command "source /etc/profile.d/rbenv.sh; rbenv install #{node.build}"
  action :run
end

execute "ruby change" do
  command "source /etc/profile.d/rbenv.sh; rbenv global #{node.build}; rbenv rehash; update_rubygems"
  action :run
end

