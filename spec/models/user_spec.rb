require 'spec_helper'

describe User do
  it { should have_many(:tasks) }

  it { should validate_presence_of(:first_name) }
  it { should_not have_valid(:first_name).when(nil, '') }
  it { should validate_presence_of(:last_name) }
  it { should_not have_valid(:last_name).when(nil, '') }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:email) }
  it { should have_valid(:email).when('test@test.com') }
  it { should_not have_valid(:email).when('test@test.', 'test.com') }
end
