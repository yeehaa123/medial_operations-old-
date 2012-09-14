require 'spec_helper'

describe CourseSection do

  before { @section = CourseSection.new(title: "New Section", number: 1) }

  subject { @section }

  it { should respond_to(:course) }
  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:number) }

  it { should be_valid }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:number) }
end