class Promotion < ApplicationRecord
  has_many :grades
  has_many :lecture_promotions
  has_many :lectures, through: :lecture_promotions
  has_many :person_promotions
  has_many :people, through: :person_promotions

end
