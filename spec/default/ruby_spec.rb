require 'spec_helper'

describe group('rbenv') do
  it { should exist }
end

describe user('rbenv') do
  it { should exist }
end

describe file('/usr/local/rbenv') do
  it { should be_directory }
  it { should be_owned_by 'rbenv' }
  it { should be_grouped_into 'rbenv' }
end

