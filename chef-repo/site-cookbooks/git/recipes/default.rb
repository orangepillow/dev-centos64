#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright 2013, orangepillow
#
# All rights reserved - Do Not Redistribute
#
%w{git}.each do |pkg|
  package pkg do
    action :install
  end
end

