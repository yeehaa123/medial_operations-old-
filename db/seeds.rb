course_description = <<END
Nowadays, computers are literally everywhere. Through heterogeneous interfaces 
- such as sensors, transistors, and servo motors - they are inextricably 
linked our spaces and bodies. For this reason, it is almost impossible to 
analyze cultural object independent of its technological apparatus. 
Nevertheless, the knowledge of scholars in the humanities about the hard-, 
wet-, and software of art, literature, culture, and politics is little or none.

In this course we will modestly attempt to compensate for our discipline's 
technological illiteracy and research the following question:

> What kind of approaches, methods and techniques are needed to analyze the 
technical dimension of contemporary cultural objects?

Nowadays, computers are literally everywhere. Through heterogeneous interfaces 
- such as sensors, transistors, and servo motors - they are inextricably 
linked our spaces and bodies. For this reason, it is almost impossible to 
analyze cultural object independent of its technological apparatus. 
Nevertheless, the knowledge of scholars in the humanities about the hard-, 
wet-, and software of art, literature, culture, and politics is little or none.
END

section_description = <<END
In this course we will modestly attempt to compensate for our discipline's 
technological illiteracy and research the following question:

> What kind of approaches, methods and techniques are needed to analyze the 
technical dimension of contemporary cultural objects?

Nowadays, computers are literally everywhere. Through heterogeneous interfaces 
- such as sensors, transistors, and servo motors - they are inextricably 
linked our spaces and bodies.
END

session_description = <<END
Nowadays, computers are literally everywhere. Through heterogeneous interfaces 
- such as sensors, transistors, and servo motors - they are inextricably 
linked our spaces and bodies.
END

AdminUser.create(email: "admin@example.com", 
                 password: "password", 
                 password_confirmation: "password")

# COURSE

Course.create(full_title: "Art, Science, and Technology: Medial Operations",
              title: "Medial Operations", 
              description: course_description)


# SECTIONS

CourseSection.create(title: "Space Invaders", 
                     course: Course.first,
                     description: section_description,
                     number: 1)
CourseSection.create(title: "War Games", 
                     course: Course.first, 
                     description: section_description,
                     number: 2)
CourseSection.create(title: "Code Matters", 
                     course: Course.first, 
                     description: section_description,
                     number: 3)


# SESSIONS

14.times do |count|
  c = count + 1
  case c
  when 1..5  
    Session.create(title: "Test #{ c }", 
                   section: CourseSection.find(1),
                   course: Course.first,
                   description: session_description,
                   start_time: Time.now + c.weeks,
                   end_time: Time.now + c.weeks + 2.hours,
                   location: "Bungehuis 4.01",
                   number: c)
  when 6..10
    Session.create(title: "Test #{ c }", 
                   section: CourseSection.find(2),
                   course: Course.first,
                   description: session_description,
                   start_time: Time.now + c.weeks,
                   end_time: Time.now + c.weeks + 2.hours,
                   location: "Bungehuis 4.01",
                   number: c)
  when 11..14
    Session.create(title: "Test #{ c }", 
                   section: CourseSection.find(3), 
                   course: Course.first,
                   description: session_description,
                   start_time: Time.now + c.weeks,
                   end_time: Time.now + c.weeks + 2.hours,
                   location: "Bungehuis 4.01",
                   number: c)
  end
end