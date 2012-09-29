require 'spec_helper'

describe AuthorsController do
  let(:author) { FactoryGirl.create(:author) }

  describe "making an index request" do
    
    before { get :index }   

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should_not set_the_flash }
  end

  describe "making a show request" do

    before  { get :show, id: author }   

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should_not set_the_flash }
  end
end
