# == Schema Information
#
# Table name: meetings
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  number      :integer
#  description :text
#  course_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  section_id  :integer
#  location    :string(255)
#  start_time  :datetime
#  end_time    :datetime
#

require 'spec_helper'

describe Meeting do
  let(:meeting) { build(:meeting) }

  subject { meeting }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to(:number) }
  it { should respond_to(:course) }
  it { should respond_to(:section) }

  it { should be_valid }
  it { should validate_presence_of(:course_id) }

  describe "only assign sections belonging to right course" do
    let(:other_course) { Course.new }
    
    before do 
      meeting.course = other_course
    end

    it { should_not be_valid }
    it { should have(1).error_on(:section) }
  end

  its(:to_s) { should == "#{ meeting.number } - #{ meeting.title.titleize }" }
end
