require 'spec_helper'

describe SessionDecorator do
  let(:session) { SessionDecorator.new(build(:session)) }
  
  subject { session }

  it { should respond_to(:session) }
  it { should respond_to(:course) }
  it { should respond_to(:section) }
  it { should respond_to(:description) }
  it { should respond_to(:heading) }
  it { should respond_to(:date) }
  it { should respond_to(:time) }
  it { should respond_to(:location) }

  describe "undefined session" do
    its(:description) { should be_nil }
    its(:date)        { should be_nil }
    its(:time)        { should be_nil }
    its(:location)    { should be_nil }
    its(:heading) do
      should == "#{ session.number } - #{ session.title.titleize }"
    end
  end

  describe "defined session" do
    let(:session) do
      SessionDecorator.new(build(:defined_session)) 
    end

    subject { session }

    its(:description) {should == "<p><p>Hello <em>World</em></p>\n</p>" }
    its(:date) {should == "Date: #{ session.start_time.strftime("%A, %B %d") }" }
    its(:location) { should == "Location: #{ session.session.location }" }
    its(:time) do
      start_time  = session.start_time.strftime("%H:%M")
      end_time    = session.end_time.strftime("%H:%M")
      should == "Time: #{ start_time } - #{ end_time }"
    end
  end
end