require 'spec_helper'

describe ArticlesController do
  let(:article) { FactoryGirl.create(:article) }

  describe "making an index request" do
    
    before { get :index }   

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should_not set_the_flash }
  end

  describe "making a show request" do

    before  { get :show, id: article }   

    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should_not set_the_flash }
  end
end
