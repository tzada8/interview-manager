# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Seed data only used for development; for production, application will have no data.
case Rails.env
when "development"
   exponent_canada = Interview.create(position: "Software Developer", company: "Exponent Canada", date: "July 9, 2021", duration: 20, interviewer: "Salman Hasani", industry: "Technology")
   tribalscale = Interview.create(position: "Agile Software Engineering", company: "TribalScale", date: "July 8, 2021", duration: 30, interviewer: "Roisin Flood", industry: "Technology")
   insticator = Interview.create(position: "Back End Engineering - Advertisement & Revenue", company: "Insticator", date: "July 7, 2021", duration: 45, interviewer: "Steven Wang, Xiaorong Rao", industry: "Technology")
   carta_maple = Interview.create(position: "Data Scientist", company: "Carta Maple Technologies", date: "June 29, 2021", duration: 45, interviewer: "Erin Boehmer", industry: "Research")
   remitbee = Interview.create(position: "Full Stack Developer Intern", company: "Remitbee", date: "June 1, 2021", duration: 15, interviewer: "Neville Debre", industry: "Technology")
   university_of_waterloo = Interview.create(position: "MSCI 121 WEEF TA", company: "University of Waterloo", date: "October 5, 2020", duration: 20, interviewer: "Mike Cooper-Stachowsky", industry: "Education")
   data_sea = Interview.create(position: "Data Engineering", company: "Data SEA Consulting", date: "June 7, 2021", duration: 30, interviewer: "Andrew Dent", industry: "Research")
   ats = Interview.create(position: "Technical Writer", company: "ATS Automation Tooling Systems", date: "February 3, 2020", duration: 30, interviewer: "Jeanette Dillon", industry: "Manufacturing")
   pepsico = Interview.create(position: "Supply Chain Assistant", company: "PepsiCo", date: "January 31, 2020", duration: 40, interviewer: "TBD", industry: "Management")
   pepsico2 = Interview.create(position: "Project Coordinator", company: "PepsiCo", date: "February 6, 2020", duration: 30, interviewer: "Heather Dixon", industry: "Management")
   other_category = Interview.create(position: "Tester", company: "Hello.io", date: "August 27, 2021", duration: 45, interviewer: "Bobby McBob", industry: "Other")

   # General questions 
   g1 = Generic.create(prompt: "Tell me about yourself?", answer: "I am a third year Management Engineering student attending the University of Waterloo with a passion for innovation, programming, and problem-solving.")
   g2 = Generic.create(prompt: "What's you biggest accomplishment?", answer: "When I went to Dominican Republic to help build houses for those in need.")
   g3 = Generic.create(prompt: "What's your biggest weakness?", answer: "I am a person who tends to take on more tasks than comfortable. Hence, I end up overloading myself with tasks to complete, but in the end, I still end up completing all the tasks before their respective deadlines.")
   g4 = Generic.create(prompt: "What's your biggest strength?", answer: "I believe I am a great communicator. I don't hesitate to reach for help when needed, and I always love to hear and tell others about what's going on to ensure everyone is 'in the loop' and understands exactly what is occurring.")
   g5 = Generic.create(prompt: "How many siblings do you have?", answer: "I have 2 siblings. One older brother and one younger brother; I'm the middle child.")

   # Interview specific questions
   exp1 = Question.create(prompt: "Why do you want to join this company?", answer: "Because the company is Exponent Canada", interview: exponent_canada)
   exp2 = Question.create(prompt: "Explain to me a tech project you've worked on.", answer: "The project I will discuss is my Pathfinding Algorithms application that I created using Java along with Java's Swing GUI.", interview: exponent_canada)
   ts1 = Question.create(prompt: "Why do you want to join this company?", answer: "Because the company is TribalScale", interview: tribalscale)
   ts2 = Question.create(prompt: "Are you familiar working in a pair programming environment?", answer: "I have never directly worked in one myself, however, I am familiar with the idea of how pair programming works", interview: tribalscale)
   ts3 = Question.create(prompt: "Please solve this coding problem.", answer: "To find the max product, you will need to loop through all values of the array and determine what the 2 largest negative as well as 2 largest positive numbers are. The one that gives a higher product is the value returned.", interview: tribalscale)
   rb1 = Question.create(prompt: "Explain the 2 types of React hooks.", answer: "They are useState and useEffect.", interview: remitbee)

   # Joining generic questions onto interviews
   exponent_canada.generics = [g1, g3]
   tribalscale.generics = [g2]
   pepsico.generics = [g4]
   university_of_waterloo.generics = [g1, g4]
   insticator.generics = [g4]

   # My questions to ask interviewer
   MyQuestion.create(prompt: "Can you describe to me a typical work day at your company?")
   MyQuestion.create(prompt: "If I were the successful candidate for this position, what could I do to better prepare myself for the first day?")
   MyQuestion.create(prompt: "Is there anything I can do to further prepare myself for the first day?")
   MyQuestion.create(prompt: "Who will I be working most closely with?")
   MyQuestion.create(prompt: "What is the expected salary for this position?")
when "production"

end