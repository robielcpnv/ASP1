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
