# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Seed data only used for development; for production, application will have no data.
case Rails.env
when "development"
   # Users of app
   # Has 0 interviews, 0 general questions, 0 own questions
   user1 = User.new(first_name: 'Test', last_name: 'Test', email: 'test@test.com')
   user1.password = 'testing'
   user1.password_confirmation = 'testing'
   user1.save

   # Has 1 interview, 1 general questions, 0 own questions
   bob = User.new(first_name: 'Bob', last_name: 'Smith', email: 'bob@bob.com') 
   bob.password = 'bobbob'
   bob.password_confirmation = 'bobbob'
   bob.save

   # Has 2 interviews, 1 general question, 1 own questions
   mary = User.new(first_name: 'Mary', last_name: 'Jones', email: 'mary@mary.com') 
   mary.password = 'marymary'
   mary.password_confirmation = 'marymary'
   mary.save

   # Has many interviews, many general questions, 2 own questions
   fred = User.new(first_name: 'Fred', last_name: 'Durst', email: 'fred@fred.com') 
   fred.password = 'fredfred'
   fred.password_confirmation = 'fredfred'
   fred.save

   # Has many interviews, many general questions, many own questions
   sue = User.new(first_name: 'Sue', last_name: 'Perry', email: 'sue@sue.com') 
   sue.password = 'suesue'
   sue.password_confirmation = 'suesue'
   sue.save

   # ALL INTERVIEWS
   # User's Interviews
   exponent_canada = Interview.create(company: "Exponent Canada", position: "Software Developer", industry: "Technology", date: "July 9, 2021", duration: 20, interviewer: "Salman Hasani", user: bob)
   tribalscale = Interview.create(company: "TribalScale", position: "Agile Software Engineering", industry: "Technology", date: "July 8, 2021", duration: 30, interviewer: "Roisin Flood", user: mary)
   insticator = Interview.create(company: "Insticator", position: "Back End Engineering - Advertisement & Revenue", industry: "Technology", date: "July 7, 2021", duration: 45, interviewer: "Steven Wang, Xiaorong Rao", user: mary)
   carta_maple = Interview.create(company: "Carta Maple Technologies", position: "Data Scientist", industry: "Research", date: "June 29, 2021", duration: 45, interviewer: "Erin Boehmer", user: fred)
   remitbee = Interview.create(company: "Remitbee", position: "Full Stack Developer Intern", industry: "Technology", date: "June 1, 2021", duration: 15, interviewer: "Neville Debre", user: fred)
   university_of_waterloo = Interview.create(company: "University of Waterloo", position: "MSCI 121 WEEF TA", industry: "Education", date: "October 5, 2020", duration: 20, interviewer: "Mike Cooper-Stachowsky", user: fred)
   data_sea = Interview.create(company: "Data SEA Consulting", position: "Data Engineering", industry: "Research", date: "June 7, 2021", duration: 30, interviewer: "Andrew Dent", user: fred)
   ats = Interview.create(company: "ATS Automation Tooling Systems", position: "Technical Writer", industry: "Manufacturing", date: "February 3, 2020", duration: 30, interviewer: "Jeanette Dillon", user: fred)
   pepsico = Interview.create(company: "PepsiCo", position: "Supply Chain Assistant", industry: "Management", date: "January 31, 2020", duration: 40, interviewer: "TBD", user: sue)
   pepsico2 = Interview.create(company: "PepsiCo", position: "Project Coordinator", industry: "Management", date: "February 6, 2020", duration: 30, interviewer: "Heather Dixon", user: sue)
   other_category = Interview.create(company: "Hello.io", position: "Tester", industry: "Other", date: "August 27, 2021", duration: 45, interviewer: "Bobby McBob", user: sue)

   # ALL QUESTIONS 
   # Interview Specific Questions
   exp1_bob = Question.create(prompt: "Why do you want to join this company?", answer: "Because the company is Exponent Canada", user: bob)
   exp2_bob = Question.create(prompt: "Explain to me a tech project you've worked on.", answer: "The project I will discuss is my Pathfinding Algorithms application that I created using Java along with Java's Swing GUI.", user: bob)
   ts1_mary = Question.create(prompt: "Why do you want to join this company?", answer: "Because the company is TribalScale", user: mary)
   ts2_mary = Question.create(prompt: "Are you familiar working in a pair programming environment?", answer: "I have never directly worked in one myself, however, I am familiar with the idea of how pair programming works", user: mary)
   ts3_mary = Question.create(prompt: "Please solve this coding problem.", answer: "To find the max product, you will need to loop through all values of the array and determine what the 2 largest negative as well as 2 largest positive numbers are. The one that gives a higher product is the value returned.", user: mary)
   rb1_fred = Question.create(prompt: "Explain the 2 types of React hooks.", answer: "They are useState and useEffect.", user: fred)
   # General Questions
   g1_bob = Question.create(prompt: "Tell me about yourself?", answer: "I am a third year Management Engineering student attending the University of Waterloo with a passion for innovation, programming, and problem-solving.", user: bob)
   g2_mary = Question.create(prompt: "What's you biggest accomplishment?", answer: "When I went to Dominican Republic to help build houses for those in need.", user: mary)
   g3_fred = Question.create(prompt: "What's your biggest weakness?", answer: "I am a person who tends to take on more tasks than comfortable. Hence, I end up overloading myself with tasks to complete, but in the end, I still end up completing all the tasks before their respective deadlines.", user: fred)
   g4_fred = Question.create(prompt: "What's your biggest strength?", answer: "I believe I am a great communicator. I don't hesitate to reach for help when needed, and I always love to hear and tell others about what's going on to ensure everyone is 'in the loop' and understands exactly what is occurring.", user: fred)
   g5_sue = Question.create(prompt: "How many siblings do you have?", answer: "I have 2 siblings. One older brother and one younger brother; I'm the middle child.", user: sue)
   g6_sue = Question.create(prompt: "Why did you want to study sciences?", answer: "I love research and exploring/discovering new things.", user: sue)
   g7_sue = Question.create(prompt: "Tell me about yourself?", answer: "I am a third year Management Engineering student attending the University of Waterloo with a passion for innovation, programming, and problem-solving.", user: sue)
   # My Questions
   mq1_mary = Question.create(prompt: "Can you describe to me a typical work day at your company?", user: mary)
   mq2_fred = Question.create(prompt: "If I were the successful candidate for this position, what could I do to better prepare myself for the first day?", user: fred)
   mq3_fred = Question.create(prompt: "Is there anything I can do to further prepare myself for the first day?", answer: nil, user: fred)
   mq4_sue = Question.create(prompt: "Who will I be working most closely with?", user: sue)
   mq5_sue = Question.create(prompt: "What is the expected salary for this position?", user: sue)
   mq6_sue = Question.create(prompt: "Can you describe to me a typical work day at your company?", user: sue)

   # Interview Specific Questions
   Specific.create(interview: exponent_canada, question: exp1_bob)
   Specific.create(interview: exponent_canada, question: exp2_bob)
   Specific.create(interview: tribalscale, question: ts1_mary)
   Specific.create(interview: tribalscale, question: ts2_mary)
   Specific.create(interview: tribalscale, question: ts3_mary)
   Specific.create(interview: remitbee, question: rb1_fred)

   # General questions
   Generic.create(question: g1_bob)
   Generic.create(question: g2_mary)
   Generic.create(question: g3_fred)
   Generic.create(question: g4_fred)
   Generic.create(question: g5_sue)
   Generic.create(question: g6_sue)
   Generic.create(question: g7_sue)

   # NEED TO TEST AND SEE IF DATABASE ALLOWS ME TO ADD A GENERIC QUESTION ONTO A DIFFERENT USER'S INTERVIEW
   # E.G.
   # user 'bob' has 'exponent_canada' interview

   # Some Generic Questions are also a Specific Question
   Specific.create(interview: exponent_canada, question: g1_bob)
   Specific.create(interview: exponent_canada, question: g3_fred)
   Specific.create(interview: tribalscale, question: g2_mary)
   Specific.create(interview: carta_maple, question: g4_fred)
   Specific.create(interview: university_of_waterloo, question: g1_bob)
   Specific.create(interview: university_of_waterloo, question: g4_fred)
   Specific.create(interview: remitbee, question: g4_fred)

   # My Questions
   MyQuestion.create(question: mq1_mary)
   MyQuestion.create(question: mq2_fred)
   MyQuestion.create(question: mq3_fred)
   MyQuestion.create(question: mq4_sue)
   MyQuestion.create(question: mq5_sue)
   MyQuestion.create(question: mq6_sue)
   
when "production"

end