require 'spec_helper'

describe MeetingDecorator do
  let(:meeting) { MeetingDecorator.new(build(:meeting)) }
  
  subject { meeting }

  it { should respond_to(:meeting) }
  it { should respond_to(:course) }
  it { should respond_to(:section) }
  it { should respond_to(:description) }
  it { should respond_to(:heading) }
  it { should respond_to(:date) }
  it { should respond_to(:time) }
  it { should respond_to(:location) }

  describe "undefined meeting" do
    its(:description) { should be_nil }
    its(:date)        { should be_nil }
    its(:time)        { should be_nil }
    its(:location)    { should be_nil }
    its(:heading) do
      should == "#{ meeting.number } - #{ meeting.title.titleize }"
    end
  end

  describe "defined meeting" do
    let(:meeting) do
      MeetingDecorator.new(build(:defined_meeting)) 
    end

    its(:description) {should == "<p><p>Hello <em>World</em></p>\n</p>" }
    its(:date) {should == "Date: #{ meeting.start_time.strftime("%A, %B %d") }" }
    its(:location) { should == "Location: #{ meeting.meeting.location }" }
    its(:time) do
      start_time  = meeting.start_time.strftime("%H:%M")
      end_time    = meeting.end_time.strftime("%H:%M")
      should == "Time: #{ start_time } - #{ end_time }"
    end
  end
end