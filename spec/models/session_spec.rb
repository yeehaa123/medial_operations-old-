require 'spec_helper'

describe Session do
  let(:section) { FactoryGirl.create(:section) }
  let(:session) { FactoryGirl.create(:session) }

  subject { session }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:number) }
  it { should respond_to(:course) }
  it { should respond_to(:section) }

  it { should be_valid }
  it { should validate_presence_of(:course_id) }

  describe "only assign sections belonging to right course" do
    let(:other_course) { FactoryGirl.create(:course, title: "Other Course") }
    before do 
      other_course.save!
      session.course_id   = other_course.id
      session.section_id  = section.id
    end

    it { should_not be_valid }
    it { should have(1).error_on(:section) }
  end

  it { "#{ session }".should == "#{ session.number } - #{ session.title }" }
end