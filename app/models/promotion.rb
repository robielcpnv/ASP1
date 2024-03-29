class Promotion < ApplicationRecord
  belongs_to :teacher, class_name: 'Person'
  has_many :grades, dependent: :destroy
  has_many :lecture_promotions
  has_many :lectures, through: :lecture_promotions
  has_many :person_promotions, dependent: :destroy
  has_many :people, through: :person_promotions

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :teacher_id, presence: true

  def teacher_name
    Person.find(teacher_id).firstname + ' ' + Person.find(teacher_id).lastname
  end

end
