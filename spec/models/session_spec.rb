require 'spec_helper'

describe Session do
  let(:course)  { Course.create(title: "New Course") }
  let(:section) do 
    CourseSection.create(title: "New Section", number: 1, course_id: course.id)
  end
  let(:session) do 
    Session.new(title: "New Session", number: 1, course_id: course.id) 
  end

  subject { session }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:number) }
  it { should respond_to(:course) }
  it { should respond_to(:section) }

  it { should be_valid }
  it { should validate_presence_of(:course_id) }

  describe "only assign sections belonging to right course" do
    let(:other_course) { Course.new(title: "Other Course") }
    before do 
      other_course.save!
      session.course_id   = other_course.id
      session.section_id  = section.id
    end

    it { should_not be_valid }
    it { should have(1).error_on(:section) }
  end
end