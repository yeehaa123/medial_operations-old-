FactoryGirl.define do

  factory :course do
    title   "New Course"

    factory :defined_course do
      description   "Hello *World*"
      title_prefix  "12345"
      after(:build) do |course|
        5.times { course.references << build(:reference) }
      end
    end
  end

  factory :section do
    title   "New Section"
    number  1
    course
    
    factory :defined_section do
      description "Hello *World*"
    end
  end  

  factory :session do
    title   "New Session"
    number  1
    section
    course { section.course }

    factory :defined_session do
      description "Hello *World*"
      location    "Bungehuis 4.01"
      start_time  Time.new
      end_time    Time.new
    end
  end

  factory :article do
    title      "New Article"
    content    "Interesting Stuff"

    factory :defined_article do
      content  "# New Title"
      after(:build) do |article|
        5.times { article.references << build(:reference) }
      end
    end
  end

  factory :reference do
    title   "New Article"
    date    Time.new(1979)
    medium  "print"
    
    factory :defined_reference do
      after(:build) do |reference|
        2.times { reference.authors << build(:author) }
        3.times { reference.sessions << build(:session) }
        4.times { reference.site_articles << build(:article) }
      end
    end
  end

  factory :author do
    first_name  "Jane"
    last_name   "Doe"
    
    factory :author_with_references do
      after(:build) do |author|
        5.times { author.references << build(:reference) }
      end
    end
  end
end