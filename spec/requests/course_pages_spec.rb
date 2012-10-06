require 'spec_helper'

describe "CoursePages" do
  let(:base_title) { "Medial Operations" }
  let(:course) { create(:defined_course) }
  
  subject { page }

  context "course show page" do 
    
    before { visit course_path(course) }

    it { should have_selector('title', text: "#{ base_title }") }
    it { should show_menu }
    it { should have_selector('hgroup.course_title') }
    it { should have_selector('section.course_description') }
    it { should_not have_selector('section.sections') }
    it { should_not have_selector('section.sessions') }


    describe "course with sections" do
      let(:course)  { create(:course_with_sections) }
      
      it { should have_selector('section.sections', count: 3) }
    end

    describe "course with sessions" do
      let(:course)  { create(:course_with_sessions) }
      
      it { should have_selector('section.sessions', count: 10) }
    end

    describe "course with sessions and sections" do
      let(:course)  { create(:course_with_sessions_and_sections) }

      it { should have_selector('section.sections', count: 3) }      
      it { should have_selector('section.sessions', count: 9) }
    end
  end
end