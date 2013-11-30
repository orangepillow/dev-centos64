user "rbenv" do
  action :create
end

group "rbenv" do
  action :create
  members "rbenv"
  members "vagrant"
  append true
end

git "/usr/local/rbenv" do
  repository "git://github.com/sstephenson/rbenv.git"
  reference "master"
  action :checkout
  user "#{node.user}"
  group "rbenv"
end

execute "rbenv directory settings" do
  command "chgrp -R rbenv /usr/local/rbenv; chown -R root /usr/local/rbenv; chmod -R 0775 /usr/local/rbenv"
  action :run
end

directory "/usr/local/rbenv/plugins" do
  owner "#{node.user}"
  group "rbenv"
  mode "0775"
  action :create
end

template "/etc/profile.d/rbenv.sh" do
  owner "#{node.user}"
  group "#{node.user}"
  mode 0644
end

git "/usr/local/rbenv/plugins/ruby-build" do
  repository "git://github.com/sstephenson/ruby-build.git"
  reference "master"
  action :checkout
  user "#{node.user}"
  group "rbenv"
end

git "/usr/local/rbenv/plugins/rbenv-binstubs" do
  repository "git://github.com/ianheggie/rbenv-binstubs.git"
  reference "master"
  action :checkout
  user "#{node.user}"
  group "rbenv"
end

