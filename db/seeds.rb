# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


require 'faker'

# Seed type people table
TypePerson.create(name: 'Student', slug: 'STU')
TypePerson.create(name: 'Teacher', slug: 'TEA')

# Seed people table student
100.times do
  Person.create(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    type_person_id: TypePerson.find_by(slug: 'STU').id
  )
end

# Seed people table teacher
10.times do
  Person.create(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    type_person_id: TypePerson.find_by(slug: 'TEA').id
  )
end

# Seed semester table
4.times do |i|
  Semester.create(name: "Semester #{i+1}")
end

# Seed category table
10.times do
  Category.create(name: Faker::Educator.subject)
end

# Seed promotion table for the next 10 years
15.times do |i|
  Promotion.create(
    name: "Promotion CPNV #{2013+i}",
    start_date: Faker::Date.in_date_period(month: 8,year: 2013+i),
    end_date: Faker::Date.in_date_period(month: 6, year: 2015+i),
    teacher_id: Person.where(type_person_id: TypePerson.find_by(slug: 'TEA').id).sample.id
  )
end

# Seed lecture table
10.times do
  Lecture.create(
    name: Faker::Educator.course_name,
    description: Faker::Lorem.paragraph,
    category_id: Category.all.sample.id
  )
end


# Seed person_promotions table
student = TypePerson.find_by(slug: 'STU') # replace with your slug for type_person = 2
person_ids = student.people.pluck(:id)
promotion_ids = Promotion.pluck(:id)
person_ids.each do |person_id|
  promotion_id = promotion_ids.sample
  PersonPromotion.create(promotion_id: promotion_id, person_id: person_id)
end



