class Person < ApplicationRecord
  has_many :student_grades, class_name: 'Grade', foreign_key: 'student_id'
  has_many :teacher_grades, class_name: 'Grade', foreign_key: 'teacher_id'
  has_many :teacher_promotions, class_name: 'Promotion', foreign_key: 'teacher_id'
  has_many :person_promotions
  has_many :promotions, through: :person_promotions

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true
  validates :type_person_id, presence: true

  def type_person
    TypePerson.find(type_person_id).name
  end

end
