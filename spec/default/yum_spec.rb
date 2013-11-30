require 'spec_helper'

%w{epel remi}.each do |repo|
  describe yumrepo(repo) do
    it { should exist }
  end
end

