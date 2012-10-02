require 'spec_helper'

describe "Static pages" do
  let(:base_title) { "Medial Operations"}
  
  before { visit root_path }

  subject { page }
  
  context "Home Page" do
    
    it { should have_selector('title', text: "#{ base_title } || Home") }
    it { should have_content('Medial Operations') }

  end
end