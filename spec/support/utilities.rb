RSpec::Matchers.define :show_menu do
  match do |page|
    page.should have_selector('nav#main_nav')
    page.should have_link('home', href: root_path)
    page.should have_link('course', href: course_path(course))
    page.should have_link('projects')
    page.should have_link('articles', href: articles_path)
  end
end