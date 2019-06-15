# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: "Ankita")
User.create(name: "Rohit")
User.create(name: "Rahul")

Exam.create(name: "First Term")
Exam.create(name: "Final")
Exam.create(name: "CET")

Exam.find_by_name("First Term").subjects.create(name: "Maths")
Exam.find_by_name("First Term").subjects.create(name: "BIO")
Exam.find_by_name("First Term").subjects.create(name: "AR")
Exam.find_by_name("Final").subjects.create(name: "Maths")
Exam.find_by_name("Final").subjects.create(name: "BIO")
Exam.find_by_name("Final").subjects.create(name: "AR")
Exam.find_by_name("CET").subjects.create(name: "Maths")
Exam.find_by_name("CET").subjects.create(name: "BIO")
Exam.find_by_name("CET").subjects.create(name: "AR")

Subject.find_by_name("Maths").topics.create(name: "Algebra")
Subject.find_by_name("Maths").topics.create(name: "Geometry")
Subject.find_by_name("Maths").topics.create(name: "Number theory")
Subject.find_by_name("Maths").topics.create(name: "Combinatorics")
Subject.find_by_name("BIO").topics.create(name: "Macromolecules")
Subject.find_by_name("BIO").topics.create(name: "Homeostasis")
Subject.find_by_name("BIO").topics.create(name: "Zoology")
Subject.find_by_name("BIO").topics.create(name: "Immunology")
Subject.find_by_name("AR").topics.create(name: "Time Sequence")
Subject.find_by_name("AR").topics.create(name: "Blood Relations")
Subject.find_by_name("AR").topics.create(name: "Coded-inequality")
Subject.find_by_name("AR").topics.create(name: "Analogy & Data Sufficiency")

Topic.find_by_name("Algebra").chapters.create(name: "Rational Numbers")
Topic.find_by_name("Algebra").chapters.create(name: "Solving Equations")
Topic.find_by_name("Algebra").chapters.create(name: "Proportions and Proportional Reasoning")
Topic.find_by_name("Algebra").chapters.create(name: "Linear Functions")
Topic.find_by_name("Zoology").chapters.create(name: "Breathing and exchange of gases")
Topic.find_by_name("Zoology").chapters.create(name: "Locomotion and movement")
Topic.find_by_name("Zoology").chapters.create(name: "Biomolecules")
Topic.find_by_name("Zoology").chapters.create(name: "Digestion and absorption")
Topic.find_by_name("Blood Relations").chapters.create(name: "Relation puzzle")
Topic.find_by_name("Blood Relations").chapters.create(name: "Coded relations")
Topic.find_by_name("Coded-inequality").chapters.create(name: "Problem-Solving By Substitution")


Chapter.find_by_name("Solving Equations").questions.create(content: "What is the point of intersection of the lines: x + 2y = 4 and -x - 3y = -7?",category: 0)
Chapter.find_by_name("Solving Equations").questions.create(content: "Factor the expression 10x2 + 20x - 80",category: 1)
Chapter.find_by_name("Solving Equations").questions.create(content: "Solve |2x - 4| - 2 = 6",category: 2)
Chapter.find_by_name("Relation puzzle").questions.create(content: "If (i) M is the brother of N; (ii) B is the brother of N; (iii) M is the brother of D, then which of the following statements is definitely true?",category: 0)
Chapter.find_by_name("Relation puzzle").questions.create(content: "Rahul`s mother is the only daughter of Monika`s father. How is Monika`s husband related to Rahul ?",category: 1)
Chapter.find_by_name("Relation puzzle").questions.create(content: "Deepak is brother of Ravi. Rekha is sister of Atul. Ravi is son of Rekha. How is Deepak related to Rekha ?",category: 2)
Chapter.find_by_name("Coded relations").questions.create(content: "If DELHI is coded as 73541 and CALCUTTA as 82589662, how can CALICUT be coded ?",category: 0)
Chapter.find_by_name("Coded relations").questions.create(content: "In a certain code, RIPPLE is written as 613382 and LIFE is written as 8192. How is PILLER written in that code ?",category: 1)
Chapter.find_by_name("Coded relations").questions.create(content: "",category: 2)
Chapter.find_by_name("Problem-Solving By Substitution").questions.create(content: "If × stands for 'addition', ÷ stands for 'subtraction', + stands for 'multiplication' and - stands for 'division', then 20 × 8 ÷ 8 - 4 + 2 = ?",category: 0)
Chapter.find_by_name("Problem-Solving By Substitution").questions.create(content: "If - means ×, × means +, + means ÷ and ÷ means -, then 40 × 12 + 3 - 6 ÷ 60 = ?",category: 2)
Chapter.find_by_name("Problem-Solving By Substitution").questions.create(content: "If + means ×, ÷ means -, × means ÷ and - means +, what will be the value of 4 + 11 ÷ 5 - 55 = ?",category: 1)
Chapter.find_by_name("Problem-Solving By Substitution").questions.create(content: "If + means ÷, × means -, ÷ means × and - means+, than 8 + 6 × 4 ÷ 3 - 4 = ?",category: 2)

Chapter.find_by_name("Problem-Solving By Substitution").questions.create(content: "If × means ÷, - means ×, ÷ means + and + means-, than (3 - 15 ÷ 19) × 8 + 6 = ?",category: 2)


q = Question.find_by_content("What is the point of intersection of the lines: x + 2y = 4 and -x - 3y = -7?").answers
q.create(content: "(-2 , 3)",is_correct: true,order: 2)
q.create(content: "(-1 , 4)",order: 1)
q.create(content: "(1 , 2)",order: 3)
q.create(content: "(-2 , -3)",order: 4)

q = Question.find_by_content("Factor the expression 10x2 + 20x - 80").answers
q.create(content: "10(x - 2)(x + 4) ",is_correct: true,order: 1)
q.create(content: "1(x - 3)(x + 7)",order: 2)
q.create(content: "9(x - 4)(x + 8)",order: 3)
q.create(content: "11(x - 3)(x + 9)",order: 4)

q = Question.find_by_content("Solve |2x - 4| - 2 = 6").answers
q.create(content: "{-2 , 6}",is_correct: true,order: 4)
q.create(content: "{-1 , 2}",order: 1)
q.create(content: "{1 , 3}",order: 2)
q.create(content: "{2 , 7}",order: 3)

q = Question.find_by_content("If (i) M is the brother of N; (ii) B is the brother of N; (iii) M is the brother of D, then which of the following statements is definitely true?").answers
q.create(content: "M is the brother of B",is_correct: true,order: 4)
q.create(content: "N is the brother of B",order: 1)
q.create(content: "N is the brother of D",order: 3)
q.create(content: "D is the brother of M",order: 2)

q = Question.find_by_content("Rahul`s mother is the only daughter of Monika`s father. How is Monika`s husband related to Rahul ?").answers
q.create(content: "Father",is_correct: true,order: 3)
q.create(content: "Uncle",order: 1)
q.create(content: "Grandfather",order: 2)
q.create(content: "Data inadequate",order: 3)

q = Question.find_by_content("Deepak is brother of Ravi. Rekha is sister of Atul. Ravi is son of Rekha. How is Deepak related to Rekha ?").answers
q.create(content: "Son",is_correct: true,order: 1)
q.create(content: "Nephew",order: 2)
q.create(content: "Brother",order: 3)
q.create(content: "Father",order: 4)

q = Question.find_by_content("If DELHI is coded as 73541 and CALCUTTA as 82589662, how can CALICUT be coded ?").answers
q.create(content: "8251896",is_correct: true)
q.create(content: "5279431")
q.create(content: "5978213")
q.create(content: "8543691")

q = Question.find_by_content("In a certain code, RIPPLE is written as 613382 and LIFE is written as 8192. How is PILLER written in that code ?").answers
q.create(content: "318826",is_correct: true)
q.create(content: "618826")
q.create(content: "318286")
q.create(content: "338816")

q = Question.find_by_content("If × stands for 'addition', ÷ stands for 'subtraction', + stands for 'multiplication' and - stands for 'division', then 20 × 8 ÷ 8 - 4 + 2 = ?").answers
q.create(content: "24",is_correct: true)
q.create(content: "80")
q.create(content: "25")
q.create(content: "5")

q = Question.find_by_content("If × means ÷, - means ×, ÷ means + and + means-, than (3 - 15 ÷ 19) × 8 + 6 = ?").answers
q.create(content: "2",is_correct: true,order: 2)
q.create(content: "8",order: 1)
q.create(content: "4",order: 3)
q.create(content: "-1",order: 4)

q = Question.find_by_content("If - means ×, × means +, + means ÷ and ÷ means -, then 40 × 12 + 3 - 6 ÷ 60 = ?").answers
q.create(content: "None of these",is_correct: true,order: 4)
q.create(content: "7.95",order: 1)
q.create(content: "44",order: 2)
q.create(content: "479.95",order: 3)


q = Question.find_by_content("If + means ÷, × means -, ÷ means × and - means+, than 8 + 6 × 4 ÷ 3 - 4 = ?").answers
q.create(content: "- 20/3",is_correct: true,order: 3)
q.create(content: "-12",order: 1)
q.create(content: "20/312",order: 2)
q.create(content: "12",order: 4)

q = Question.find_by_content("If + means ×, ÷ means -, × means ÷ and - means +, what will be the value of 4 + 11 ÷ 5 - 55 = ?").answers
q.create(content: "None of these",is_correct: true,order: 4)
q.create(content: "- 48.5",order: 1)
q.create(content: "79",order: 2)
q.create(content: "11",order: 3)
