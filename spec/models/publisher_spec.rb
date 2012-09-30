require 'spec_helper'

describe Publisher do
  let(:publisher) { create(:publisher) }

  subject { publisher }

  it { should respond_to(:references) }
  it { should respond_to(:name) }
  it { should respond_to(:location) }

  it { should be_valid } 

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }
  it { should validate_uniqueness_of(:location).scoped_to(:name) }

  its(:to_s) do
    name = publisher.name.titleize
    location = publisher.location.titleize
    should == "#{ location }: #{ name }"
  end
end