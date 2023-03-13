class Grade < ApplicationRecord
  belongs_to :semester
  belongs_to :promotion
  belongs_to :student, class_name: 'Person'
  belongs_to :teacher, class_name: 'Person'
  has_many :lecture_grades
  has_many :lectures, through: :lecture_grades

  validates :name, presence: true
  validates :result, presence: true, numericality: { greater_than_or_equal_to: 1.0, less_than_or_equal_to: 6.0 }
  validates :weight, presence: true
  validates :date, presence: true
  validates :semester_id, presence: true
  validates :promotion_id, presence: true
  validates :student_id, presence: true
  validates :teacher_id, presence: true

  def student_name
    Person.find(student_id).firstname + ' ' + Person.find(student_id).lastname
  end

  def teacher_name
    Person.find(teacher_id).firstname + ' ' + Person.find(teacher_id).lastname
  end

  def semester_name
    Semester.find(semester_id).name
  end

  def promotion_name
    Promotion.find(promotion_id).name
  end

end
