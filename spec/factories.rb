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
        article.references = build_list(:reference, 5)
      end
    end
  end

  factory :reference do
    sequence(:title) { |n| "New Article #{n}" }
    date    Time.new(1979)
    medium  "print"
    author
    publisher
    after(:build) do |reference|
      reference.coauthors = build_list(:author, 2)
    end

    factory :defined_reference do
      after(:build) do |reference|
        3.times { reference.sessions << build(:session) }
        4.times { reference.site_articles << build(:article) }
      end
    end
  end

  factory :monograph_reference do
    title   "New Monograph"
    date    Time.new(1960)
    medium  "print"
    publisher
    author

    factory :defined_monograph_reference do
      after(:build) do |reference|
        3.times { reference.sessions << build(:session) }
        4.times { reference.site_articles << build(:article) }
        5.times { reference.chapters << build(:chapter_reference) }
      end
    end
  end

  factory :chapter_reference do
    title   "New Chapter"
    date    Time.new(1960)
    medium  "print"
    publisher
    author
    after(:build) do |reference|
      reference.coauthors = build_list(:author, 2)
    end
    monograph { build(:monograph_reference) }

    factory :defined_chapter_reference do
      after(:build) do |reference|
        3.times { reference.sessions << build(:session) }
        4.times { reference.site_articles << build(:article) }
      end
    end
  end

  factory :author do
    first_name  "Jane"
    middle_name "H."
    sequence(:last_name) { |n| "#{n} Doe" }

    factory :author_with_references do
      after(:build) do |author|
        5.times { author.references << build(:reference) }
      end
    end
  end

  factory :publisher do
    name  "Annoying Publisher"
    sequence(:location) { |n| "Amsterdam-#{n}" }
  end
end