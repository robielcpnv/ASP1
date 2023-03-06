class Person < ApplicationRecord
  has_many :student_grades, class_name: 'Grade', foreign_key: 'student_id'
  has_many :teacher_grades, class_name: 'Grade', foreign_key: 'teacher_id'
  has_many :person_promotions
  has_many :promotions, through: :person_promotions

end
