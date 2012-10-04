FactoryGirl.define do

  factory :course do
    title   "New Course"

    factory :defined_course do
      description   "Hello *World*"
      title_prefix  "12345"
      after(:build) do |course|
        5.times { course.references << build(:reference) }
      end

      factory :course_with_sections do      
        after(:build) do |course|
          3.times { course.sections << build(:section, course_id: course) }
        end
      end

      factory :course_with_sessions_and_sections do
        after(:build) do |course|
          3.times { course.sections << create(:section, course_id: course) }
          course.sections.each do |section|
            3.times { course.sessions << create(:session, course_id: course, 
                                               section_id: section.id) }
          end
        end          
      end

      factory :course_with_sessions do      
        after(:build) do |course|
          9.times { course.sessions << build(:session, section_id: nil, 
                                             course_id: course) }
        end
      end
    end
  end

  factory :section do
    title   "New Section"
    sequence(:number) { |n| n }
    course

    factory :defined_section do
      description "Hello *World*"
    end
  end  

  factory :session do
    title   "New Session"
    sequence(:number) { |n| n }
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
    sequence(:title) { |n| "new article #{n}" }
    date    Time.new(1979)
    medium  "print"
    pages   "100-200"
    publisher
    after(:build) do |reference|
      reference.authors = build_list(:author, 1)
      reference.translators = build_list(:author, 2)
      reference.editors = build_list(:author, 2)
      reference.sessions = build_list(:session, 3)
      reference.site_articles << build_list(:article, 4)
    end
  end

  factory :monograph_reference do
    title   "New Monograph"
    date    Time.new(1960)
    medium  "print"
    publisher
    after(:build) do |reference|
      reference.authors = build_list(:author, 2)
    end
    
    factory :defined_monograph_reference do
      after(:build) do |reference|
        reference.sessions = build_list(:session, 3)
        4.times { reference.site_articles << build(:article) }
        5.times { reference.chapters << build(:chapter_reference) }
      end
    end
  end

  factory :journal_reference do
    title   "New Journal"
    date    Time.new(1960)
    medium  "print"
    publisher
    after(:build) do |reference|
      reference.authors = build_list(:author, 2)
    end
    
    factory :defined_journal_reference do
      after(:build) do |reference|
        reference.sessions = build_list(:session, 3)
        4.times { reference.site_articles << build(:article) }
        5.times { reference.articles << build(:article_reference) }
      end
    end
  end

  factory :chapter_reference do
    title   "New Chapter"
    date    Time.new(1960)
    medium  "print"
    publisher
    after(:build) do |reference|
      reference.authors = build_list(:author, 2)
    end
    monograph { build(:monograph_reference) }

    factory :defined_chapter_reference do
      after(:build) do |reference|
        3.times { reference.sessions << build(:session) }
        4.times { reference.site_articles << build(:article) }
      end
    end
  end

  factory :article_reference do
    title   "New Article"
    date    Time.new(1960)
    medium  "print"
    publisher
    after(:build) do |reference|
      reference.authors = build_list(:author, 2)
    end
    journal { build(:journal_reference) }

    factory :defined_article_reference do
      after(:build) do |reference|
        3.times { reference.sessions << build(:session) }
        4.times { reference.site_articles << build(:article) }
      end
    end
  end

  factory :author do
    first_name  "Jane"
    middle_name "H."
    sequence(:last_name) { |n| "#{n}-Doe" }

    factory :author_with_references do
      after(:build) do |author|
        author.references = build_list(:reference, 5)
      end
    end

    factory :author_with_translations do
      after(:build) do |author|
        author.translations = build_list(:reference, 5)
      end
    end

    factory :author_with_volumes do
      after(:build) do |author|
        author.volumes = build_list(:reference, 5)
      end
    end
  end

  factory :publisher do
    name  "Annoying Publisher"
    sequence(:location) { |n| "Amsterdam-#{n}" }
  end
end