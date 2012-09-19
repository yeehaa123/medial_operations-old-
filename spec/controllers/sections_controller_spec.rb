require 'spec_helper'

describe SectionsController do
  let(:section) { FactoryGirl.create(:section) }

  describe "making an index request" do
    
    before { get :index, course_id: 1 }   

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should_not set_the_flash }
  end

  describe "making a show request" do

    before  { get :show, course_id: 1, id: section }   

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should_not set_the_flash }
  end
end
