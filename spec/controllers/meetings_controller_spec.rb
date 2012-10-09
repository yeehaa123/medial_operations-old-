require 'spec_helper'

describe MeetingsController do
  let(:meeting) { FactoryGirl.create(:meeting) }

  describe "making an index request" do
    
    before { get :index, course_id: meeting.course_id }   

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should_not set_the_flash }
  end

  describe "making a show request" do

    before  { get :show, course_id: meeting.course_id, id: meeting }   

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should_not set_the_flash }
  end
end