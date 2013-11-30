require 'spec_helper'

describe group('rbenv') do
  it { should exist }
end

describe user('rbenv') do
  it { should exist }
end

describe file('/usr/local/rbenv') do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'rbenv' }
end

describe command('ruby -v') do
  let(:path) { '/usr/local/rbenv/shims' }
  it { should return_stdout 'ruby 2.0.0p353 (2013-11-22 revision 43784) [x86_64-linux]' }
end

# gem
%w{ bundler pry rbenv-rehash }.each do |pkg|
  describe package(pkg) do
    let(:path) { '/usr/local/rbenv/shims' }
    it { should be_installed.by('gem') }
  end
end
