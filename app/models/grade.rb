class Grade < ApplicationRecord
  belongs_to :semester
  belongs_to :promotion
  belongs_to :student, class_name: 'Person'
  belongs_to :teacher, class_name: 'Person'
  has_many :lecture_grades
  has_many :lectures, through: :lecture_grades

end
