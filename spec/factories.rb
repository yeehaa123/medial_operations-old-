FactoryGirl.define do

  factory :course do
    title "New Course"
    full_title "A New Course"

    factory :defined_course do
      description "Hello *World*"
    end
  end

  factory :section do
    title "New Section"
    number 1
    course
    
    factory :defined_section do
      description "Hello *World*"
    end
  end  

  factory :session do
    title "New Session"
    number 1
    course

    factory :defined_session do
      description "Hello *World*"
      location "Bungehuis 4.01"
      start_time Time.new
      end_time Time.new
    end
  end
end