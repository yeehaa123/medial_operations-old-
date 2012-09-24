require 'spec_helper'

describe Publisher do
  let(:publisher) { build(:publisher) }

  subject { publisher }

  it { should respond_to(:references) }
  it { should respond_to(:name) }
  it { should respond_to(:location) }

  it { should be_valid } 
end
