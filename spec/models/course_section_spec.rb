require 'spec_helper'

describe CourseSection do

  let(:section) { FactoryGirl.create(:course_section) }

  subject { section }

  it { should respond_to(:course) }
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:number) }

  it { should be_valid }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:number) }

  it { "#{ section }".should == section.title }
end