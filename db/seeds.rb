# Authors ---------------------------------------------------------------------

Author.create(first_name: "Chris", last_name: "Anderson")
Author.create(first_name: "Hannah", last_name: "Arendt")
Author.create(first_name: "Walter", last_name: "Benjamin")
Author.create(first_name: "Gilles", last_name: "Deleuze")
Author.create(first_name: "Felix", last_name: "Guattari")
Author.create(first_name: "Martin", last_name: "Heidegger")
Author.create(first_name: "Friedrich", last_name: "Kittler")
Author.create(first_name: "Steven", last_name: "Levy")
Author.create(first_name: "Friedrich", last_name: "Nietzsche")

Author.create(first_name: "Uni", last_name: "Versal")

# Editors

Author.create(first_name: "Bernard", last_name: "Williams")
Author.create(first_name: "Marcus Paul", last_name: "Bullock")
Author.create(first_name: "Michael William", last_name: "Jennings")

# Translators

Author.create(first_name: "Josefine", last_name: "Nauckhoff")
Author.create(first_name: "Adrian", last_name: "Del Caro")
Author.create(first_name: "R. J.", last_name: "Hollingdale")
Author.create(first_name: "William", last_name: "Lovitt")


# Publisher -------------------------------------------------------------------

Publisher.create(name: "Cambridge University Press", location: "Cambridge")
Publisher.create(name: "Harvard University Press", location: "Cambridge, MA")
Publisher.create(name: "The University of Chicago Press", location: "Chicago")

Publisher.create(name: "Annoying", location: "Amsterdam")


# References ------------------------------------------------------------------

# Monographs

MonographReference.create(title: "The Question Concerning Technology",
                          authors: [Author.find_by_last_name("Heidegger")],
                          translators: [Author.find_by_last_name("Lovitt")],
                          date: Time.new(1977),
                          medium: "print",
                          publisher: Publisher.find_by_location("Cambridge"))

MonographReference.create(title: "The Gay Science",
                          authors: [Author.find_by_last_name("Nietzsche")],
                          editors: [Author.find_by_last_name("Williams")],
                          translators: [Author.find_by_last_name("Nauckhoff"),
                                        Author.find_by_last_name("Del Caro")],
                          date: Time.new(2001),
                          medium: "print",
                          publisher: Publisher.find_by_location("Cambridge"))

MonographReference.create(title: "Human, All Too Human",
                          authors: [Author.find_by_last_name("Nietzsche")],
                          translators: [Author.find_by_last_name("Hollingdale")],
                          date: Time.new(1996),
                          medium: "print",
                          publisher: Publisher.find_by_location("Cambridge"))

MonographReference.create(title: "One-Way Street",
                          authors: [Author.find_by_last_name("Benjamin")],
                          editors: [Author.find_by_last_name("Bullock"),
                                    Author.find_by_last_name("Jennings")],
                          date: Time.new(1996),
                          medium: "print",
                          publisher: Publisher.find_by_location("Cambridge, MA"))


MonographReference.create(title: "Everything Ever Written",
                          authors: [Author.find_by_last_name("Versal")],
                          date: Time.new(2012),
                          medium: "print",
                          publisher: Publisher.find_by_name("Annoying"))


# Journals

JournalReference.create(title: "Critical Inquiry",
                        publisher: Publisher.find_by_location("Chicago"))

# Magazines

MagazineReference.create(title: "Wired")

# Magazine Articles

MagazineArticleReference.create(title: "How Google's Algorithm Rules the Web",
                                authors: [Author.find_by_last_name("Levy")],
                                magazine: MagazineReference.find_by_title("Wired"),
                                url: "http://www.wired.com/magazine/2010/02/ff_google_algorithm/",
                                volume: 16,
                                issue:  07,
                                date: Date.new(2010, 2, 22))

MagazineArticleReference.create(title: "The End of Theory: The Data Deluge Makes the Scientific Method Obsolete",
                                authors: [Author.find_by_last_name("Anderson")],
                                magazine: MagazineReference.find_by_title("Wired"),
                                url: "http://www.wired.com/science/discoveries/magazine/16-07/pb_intro",
                                volume: 17,
                                issue:  12,
                                date: Date.new(2008, 8, 23))

# Journal Articles

JournalArticleReference.create(title: "Universities: Wet, Hard, Soft, and Harder",
                        authors: [Author.find_by_last_name("Kittler")],
                        journal: JournalReference.find_by_title("Critical Inquiry"),
                        url: "http://www.jstor.org/stable/10.1086/427310",
                        pages: "244-255",
                        volume: 31,
                        issue: 1,
                        date: Date.new(2004))

# Chapters

ChapterReference.create(title: "The Age of the World Picture", 
                        authors: [Author.find_by_last_name("Heidegger")],
                        monograph: MonographReference.find_by_title("The Question Concerning Technology"),
                        date: Time.new(1938),
                        pages: "115-155")

ChapterReference.create(title: "To the Planetarium", 
                        authors: [Author.find_by_last_name("Benjamin")],
                        monograph: MonographReference.find_by_title("One-Way Street"),
                        date: Time.new(1928),
                        pages: "486-487")

ChapterReference.create(title: "Future of Science", 
                        authors: [Author.find_by_last_name("Nietzsche")],
                        monograph: MonographReference.find_by_title("Human, All Too Human"),
                        date: Time.new(1928),
                        medium: "Print",
                        pages: "119")


ChapterReference.create(title: "What is Metaphyics?", 
                        authors: [Author.find_by_last_name("Heidegger")],
                        monograph: MonographReference.last,
                        publisher: Publisher.first,
                        date: Time.new(1929),
                        medium: "Print")
ChapterReference.create(title: "On Revolution", 
                        authors: [Author.find_by_last_name("Arendt")],
                        monograph: MonographReference.last,
                        publisher: Publisher.first,
                        date: Time.new(1970),
                        medium: "Print")
ChapterReference.create(title: "Vita Activa", 
                        authors: [Author.find_by_last_name("Arendt")],
                        monograph: MonographReference.last,
                        publisher: Publisher.first,
                        date: Time.new(1950),
                        medium: "Print")
ChapterReference.create(title: "Grammophone, Film, Typewriter", 
                        authors: [Author.find_by_last_name("Kittler")],
                        monograph: MonographReference.last,
                        publisher: Publisher.first,
                        date: Time.new(1984),
                        medium: "Print")
ChapterReference.create(title: "A Thousand Plateaus", 
                        authors: [Author.find_by_last_name("Deleuze"),
                                 Author.find_by_last_name("Guattari")],
                        monograph: MonographReference.last,
                        publisher: Publisher.last,
                        date: Time.new(1981),
                        medium: "Print")
ChapterReference.create(title: "Kafka. Towards a Minor Literature", 
                        authors: [Author.find_by_last_name("Deleuze"),
                                 Author.find_by_last_name("Guattari")],
                        monograph: MonographReference.last,
                        publisher: Publisher.first,
                        date: Time.new(1974),
                        medium: "Print")


# USERS -----------------------------------------------------------------------

AdminUser.create(email: "admin@example.com", 
                 password: "password", 
                 password_confirmation: "password")


# Articles --------------------------------------------------------------------

article = <<END
# Towards a New Intellectual
A Shared Dilemma

>> I'm not what I seem. But that's okay.  
>> Artists thrive on contradictions.  
>> - Marvin Gaye

Occasionally, the results of mistakes are much more interesting than those of
hard work. Marvin Gaye's hallmark album *What's Going On* (1971) serves as one
of those miraculous examples of serendipity. During the mixing sessions of the
title song and first single in 1970, a rather fortunate accident occurred. When
the artist asked his sound engineer Ken Sands to play two alternate takes of the
main vocals, the technician unwittingly played both tracks simultaneously. The
unintended result was a duet between the singer and himself. Gaye liked this
side-effect to such an extent that he not only decided to keep it, but even
pushed this mistake to the extremes. Not content with mere duplication, the
artist multiplied his voice several times on the final mix of the album. The
harmonic, multilayered vocals became this record's most recognizable feature.[^fn1]

By the time of the recording of his next solo album, *Let's Get it On* (1973),
Gaye had mastered this technique of overdubbing to perfection. In fact, he used
it so frequently that his 'old-school' producer, Ed Townsend, even openly
wondered if the singer was still capable of singing an entire song in one take.[^fn2]
Nonetheless, it was precisely this extensive use of multitrack recording that
turned his multilayered vocals into more than just a stylistic novelty. On this
album, the singer capitalized on the immanent possibilities of the technical
medium to play out the doubts, discussions and arguments that he had with
himself. As a result, *Let's Get it On* released the dissonant voices from the
isolated existence in Marvin Gaye's head and harmonized them on the multiple
tracks of the recording.[^fn3]

Nevertheless, the album was more than just a therapeutic exercise of a troubled
artist. In my opinion, the accidental duplication and intentional multiplication
of Gaye's voice are not harmless but have enormous philosophical, psychological
and practical ramifications. Multitrack recording irreversibly cut the person
Marvin Gaye up into a wide range of alter egos. The contradicting voices that
were captured on *Let's Get it On* can impossibly be reunited into a single,
coherent one. They are autonomous personae rather than different aspects of a
schizophrenic personality.

Multitrack technology accidently rendered the unified subject obsolete. The
resulting effect of polyphony, however, has often been accused of being of mere
esthetic interest. According to this line of criticism, the multiple voices of
Marvin Gaye's records and other works of art are purely fictitious, not part of
any concrete discursive practices and can therefore impossibly initiate any
social and cultural transformations. In this presentation, I will argue that it
is exactly the other way around. Personae rather than individuals are the
genuine subjects of discourse. Any person is part of multiple, diverse practices
and is therefore incapable of fully identifying with the role that any
particular one of them forces on him. Correspondingly, I suggest a re-
conceptualization of the post-human subject as an arena in which the
confrontation between different roles takes place. The new intellectual proposed
here, is an example of such a battle field.

## The Dilemma of the Black Intellectual

In his essay 'The Dilemma of the Black Intellectual' (1985) Cornel West
vocalizes the unique predicament of the title's protagonist:

> "Caught between an insolent American society and insouciant black community,
> the Afro-American who takes seriously the life of the mind inhabits an
> isolated and insulated world."

Although it is quite easy to misinterpret this quote as such, West actually
refuses to define the subject of his dilemma in essentialist terms. The
importance of the black intellectual neither consists in his skin complexion nor
his ethnic lineage but in the ongoing tension between the contradictory roles
that are imposed on him. Cornel West situates this specific individual in the
struggle between the American society and the black community.

Instead of repeating the exact details of West's analysis of the black
intellectual's predicament, I will here focus on the text's implicit but
crucial, theoretical contribution to discourse analysis. 'The Dilemma of the
Black Intellectual' subtly shows that a subject first emerges when an individual
finds himself caught between at least two practices. As long as an analysis is
limited to a single discourse, one can only speak of a subject position or a
persona. Subjects, on the other hand, emerge in the confrontations between
multiple practices; they are borderline figures by definition.

It is precisely such a clash of discourses that gives rise to West's so-called
dilemma of the black intellectual. The singularity of this situated individual
consists in the fact that the white society and the black community both try to
impose a particular role on him. In the specific case of West's protagonist, the
former practice pushes the intellectual to adapt to its *"bourgeois model of
academic legitimation and placement"*, whereas the latter only seems to value
his 'life of the mind' when it comes in the form of a performance or a sermon.
Although West claims that the black community does not have an intellectual
tradition in the academic sense, he nevertheless recognizes

> "...two organic intellectual traditions in African-American life: the black
> "Christian tradition of preaching and the black musical tradition of
> "performance."

West, however, neglects to further distuingish between these two intellectual
traditions and treats them as identical. In my opinion, he thereby misses a
chance to fully capitalize on the opportunities that his method offers, because
he does not take the situatedness of his protagonist seriously enough.

West's juxtaposition of two practices implies that in order to be acknowledged
by both practices the aspiring intellectual has to play the role of The Scholar
and The Performer at the same time. Both the white academy as well as the black
community try to impose a specific set of norms, rules and expectations on the
black intellectual. In other words, these discursive practices force him to act
out contradictory roles. It is of crucial importance to notice that the black
intellectual can never fully identify with neither The Scholar nor The
Performer. What constitutes the protagonist of Cornell West's dilemma is the
struggle between two discursive practices rather than a fixed identity. Instead
of lamenting the loss of a coherent subject, however, he values the
transformative possibilities that this split personality offers.

## Biography

In his obituary for the legendary soul singer, West describes Marvin Gaye as an
excellent example of his black intellectual. Nonetheless, his appreciation of
the artist's intellectual and social achievements is limited to *What's Going
On*. West describes the importance of the album as follows:

> "This groundbreaking album was not only the first conceived and enacted by the
> "artist (as opposed to studio staffers), but also the first concept album that
> "hung together by means of a set of themes - themes concerned with socio-
> "economic critique and Christian outlook."

To him, the relevance of *What's Going On* consisted in the fact that Marvin
Gaye exploited his gift as a performer to communicate his Christian message of
love, peace and harmony. Because his status as a superstar gave him credibility
to both a mainstream and a R&B audience, the artist was capable of influencing
both the American society as well as the black community with his sermon.

Unfortunately, Cornel West neglects to incorporate some crucial biographical
facts about Marvin Gaye in his analysis of *What's Going On*. These omitted
details add up to a more complex portrait of the artist/intellectual. They
reveal the tension between the glamorous life of the performer and the moral
ways of the priest. West ignores, for instance, that the singer was already
heavily drug addicted during the recording of What's Going On. Nor does he
mention that Marvin and his first wife Anna Gordy had extramarital affairs on a
regular basis. Above all, however, West completely ignores Gaye's continuous
fight with his father who was a preacher in the House of God church. All these
fact inevitably suggest that Christianity, and the expectations and values that
it preaches, were a problem as much as a solution to the singer.

Whereas these personal struggles only appeared in the background on *What's
Going On*, they are foregrounded on *Let's Get it On*. The latter album
documents Gaye's difficulties to combine spirituality and sexuality. Although
the message of the album is as explicit as that of *What's Going On*, the singer
now not just preaches his sermon but also allows us to see his personal doubts,
sins and temptations. This shift is literally reflected in the strange recording
history of the album's title song. At first - and I will play a clip of this now
- the song tries to recreate the formula of *What's Going On*. As you can hear,
this song initially had a purely political meaning. *"Understanding and
brotherhood"* Marvin sings *"Everybody ought to try and do some good"*. Gaye
once again tried to convince the world of the need for love, peace and harmony.
After meeting his future second wife - seventeen year old Janis Hunter - during
the recording session, however, the song instantaneously acquired an extra layer
(another clip). Superficially, explicit sexuality now appears to be the message
of 'Let's Get it On' and it is for this exact reason that Cornel West refuses to
acknowledge its intellectual value. Closer inspection, however, reveals that it
is actually the tension between the spirituality, and sensuality that is the
main motive of Gaye's later works.

What this example shows is the fact that for real, situated individuals such as
Marvin Gaye - rather than the abstraction that The Black Intellectual actually
is - the Christian and the performative African-American tradition are not as
homogenous as West seems to suggest. They are two separate discursive practices,
each with their own norms and standards. For this reason, it does not suffice to
situate the subject between two conflicting personae. It is necessary to
multiply and complicate these roles even further. Multitrack recording gave
Marvin Gaye the opportunity to literally do this. On *Let's Get it On* the
conflicting voices that stem from discursive tensions become apparent and even
sound harmonized. The technology proved to be capable of bringing together
oppositions that the subject Marvin Gaye failed to reconcile.

As argued above, the value of Cornel West's essay consists in the fact that he
does not situate the intellectual as part of any particular discourse but in the
struggle between two discursive practices. However, *Let's Get It On* teaches us
that his oversimplified juxtaposition of American society and black community
simply reinscribes the traditional dichotomy between mind and body - or
knowledge and experience - on a discursive level. As a result, everything that
is not academic is homogenized under the title performance. Situating the black
intellectual between more, and more specific practices, could create a way out
of thinking in terms of such dualities.

## Conclusion

Whereas Cornel West describes his dualist model for future intellectuals, Marvin
Gaye performs his pluralist alternative. The artist was the arena for multiple,
not just two, conflicting discursive practices. Nonetheless, as his albums
prove, human beings are not the exclusive site of these confrontations. Every
other medial expression can fulfill the same function and sometimes they are up
to the task even better. In fact, I would claim that is actually the technical
medium that allows us to view the human subject differently.

One could even argue, that Marvin Gaye's records accomplishes things that he
could no longer achieve as a person. The success of records like *What's Going
On* and *Let's Get it On* actually consists in the fact that they reconcile
different personae and could thereby function as a non-utopian horizon for
personal and social change. In fact, these albums harmonized the dissonant
voices and their corresponding discursive practices that the singer would
continue to struggle with the rest of his life. I would argue - and this is also
my starting point for further discussion - this eventually leads up to the
conclusion that a human subject has no prioritized status over other medial
expressions. Each record, each movie, each book and each picture can be
conceived as a space where different personae are confronted with one another
and can therefore function as actors of social transformation. 

[^fn1]: Test Footnote

[^fn2]: And Another One

[^fn3]: And a third: Whereas Cornel West describes his dualist model for future intellectuals, Marvin
Gaye performs his pluralist alternative. The artist was the arena for multiple,
not just two, conflicting discursive practices. Nonetheless, as his albums
prove, human beings are not the exclusive site of these confrontations. Every
other medial expression can fulfill the same function and sometimes they are up
to the task even better. In fact, I would claim that is actually the technical
medium that allows us to view the human subject differently.
END

Article.create(content: article, references: Reference.all)


# COURSE ----------------------------------------------------------------------


course_description = <<END
Nowadays, computers are literally everywhere. Through heterogeneous interfaces 
- such as sensors, transistors, and servo motors - they are inextricably 
linked our spaces and bodies. It has therefore become almost impossible to 
analyze cultural objects independent of their technological apparatus. 
Nevertheless, scholars in the humanities are reluctant to learn about the hard-, 
wet-, and software of art, literature, culture, and politics.

In this course we will modestly attempt to compensate for our discipline's 
technological illiteracy and research the following question:

> What kind of approaches, methods and techniques are needed to analyze the 
technical dimension of contemporary cultural objects?

END

Course.create(title_prefix: "Art, Science, and Technology",
              title: "Medial Operations", 
              description: course_description)


# SECTIONS --------------------------------------------------------------------

section_1_description = <<END
In this course we will modestly attempt to compensate for our discipline's 
technological illiteracy and research the following question:

> What kind of approaches, methods and techniques are needed to analyze the 
technical dimension of contemporary cultural objects?

Nowadays, computers are literally everywhere. Through heterogeneous interfaces 
- such as sensors, transistors, and servo motors - they are inextricably 
linked our spaces and bodies.
END

section_2_description = <<END
In this course we will modestly attempt to compensate for our discipline's 
technological illiteracy and research the following question:

> What kind of approaches, methods and techniques are needed to analyze the 
technical dimension of contemporary cultural objects?

Nowadays, computers are literally everywhere. Through heterogeneous interfaces 
- such as sensors, transistors, and servo motors - they are inextricably 
linked our spaces and bodies.
END

section_3_description = <<END
In this course we will modestly attempt to compensate for our discipline's 
technological illiteracy and research the following question:

> What kind of approaches, methods and techniques are needed to analyze the 
technical dimension of contemporary cultural objects?

Nowadays, computers are literally everywhere. Through heterogeneous interfaces 
- such as sensors, transistors, and servo motors - they are inextricably 
linked our spaces and bodies.
END

Section.create(title: "Mapping The Humanities", 
                     course: Course.first,
                     description: section_1_description,
                     number: 1)
Section.create(title: "F(r)ictions and/or (Fr)Actions of the Imaginary", 
                     course: Course.first, 
                     description: section_2_description,
                     number: 2)
Section.create(title: "The Eternal Recurrence of Body Snatchers", 
                     course: Course.first, 
                     description: section_3_description,
                     number: 3)


# SESSIONS --------------------------------------------------------------------

session_description = <<END
Nowadays, computers are literally everywhere. Through heterogeneous interfaces 
- such as sensors, transistors, and servo motors - they are inextricably 
linked our spaces and bodies.
END

Session.create(title: "Introduction", 
               course: Course.first,
               description: session_description,
               references: [Reference.find_by_title("To the Planetarium"),
                            Reference.find_by_title("Future of Science")],
               start_time: Time.now,
               end_time: Time.now + 2.hours,
               location: "Bungehuis 4.01",
               number: 1)

Session.create(title: "Lecture", 
                   section: Section.find_by_title("Mapping The Humanities"),
                   course: Course.first,
                   description: session_description,
                   references: [Reference.find_by_title("The Age of the World Picture"),
                                Reference.find_by_title("Universities: Wet, Hard, Soft, and Harder"),
                                Reference.find_by_title("How Google's Algorithm Rules the Web"),
                                Reference.find_by_title("The End of Theory: The Data Deluge Makes the Scientific Method Obsolete")],
                   start_time: Time.now + 1.weeks,
                   end_time: Time.now + 1.weeks + 2.hours,
                   location: "Bungehuis 4.01",
                   number: 2)


13.times do |count|
  c = count + 3
  case c
  when 1..5  
    Session.create(title: "Test #{ c }", 
                   section: Section.find(1),
                   course: Course.first,
                   description: session_description,
                   references: Reference.all,
                   start_time: Time.now + c.weeks,
                   end_time: Time.now + c.weeks + 2.hours,
                   location: "Bungehuis 4.01",
                   number: c)
  when 6..10
    Session.create(title: "Test #{ c }", 
                   section: Section.find(2),
                   course: Course.first,
                   description: session_description,
                   references: Reference.all,
                   start_time: Time.now + c.weeks,
                   end_time: Time.now + c.weeks + 2.hours,
                   location: "Bungehuis 4.01",
                   number: c)
  when 11..14
    Session.create(title: "Test #{ c }", 
                   section: Section.find(3), 
                   course: Course.first,
                   description: session_description,
                   references: Reference.all,
                   start_time: Time.now + c.weeks,
                   end_time: Time.now + c.weeks + 2.hours,
                   location: "Bungehuis 4.01",
                   number: c)
  end
end