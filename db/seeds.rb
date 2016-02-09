Question.destroy_all
Answer.destroy_all

puts "Adding a whole bunch of questions"

q1 = Question.create(text: "Should I early exercise my options?", 
					topic: "exercising")
q2 = Question.create(text: "What is the difference between Incentive Stock Options (ISO) and Restricted Stock Units (RSU)?",
					topic: "equity types")
q3 = Question.create(text: "How do I calculate how much my stock is worth?", 
					topic: "value")

puts "Done creating questions"

puts "Creating answers"

a1 = Answer.create(answertext: "1Ipsum quaeque nusquam at cum. Fabulas constituam ne eam. Quo cu minimum interesset adversarium, nostrud copiosae imperdiet vis ea. Putent fastidii imperdiet te mei, eum no feugait sententiae, usu ad decore complectitur.")
a2 = Answer.create(answertext: "2Ipsum quaeque nusquam at cum. Fabulas constituam ne eam. Quo cu minimum interesset adversarium, nostrud copiosae imperdiet vis ea. Putent fastidii imperdiet te mei, eum no feugait sententiae, usu ad decore complectitur.")
a3 = Answer.create(answertext: "3Ipsum quaeque nusquam at cum. Fabulas constituam ne eam. Quo cu minimum interesset adversarium, nostrud copiosae imperdiet vis ea. Putent fastidii imperdiet te mei, eum no feugait sententiae, usu ad decore complectitur.")

puts "Done creating answers"

puts "Creating question/answer associations"

q1.answers = [a1, a2]
q1.save()

q2.answers = [a3]
q2.save()

puts "Done creating q/a associations"

