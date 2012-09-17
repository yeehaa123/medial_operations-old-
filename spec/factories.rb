FactoryGirl.define do

  factory :course do
    title "New Course"
  end

  factory :section do
    title "New Section"
    number 1
    course
  end  

  factory :session do
    title "New Session"
    number 1
    course
  end
end