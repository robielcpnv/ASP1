class Lecture < ApplicationRecord
  belongs_to :category
  has_many :lecture_promotions
  has_many :promotions, through: :lecture_promotions, dependent: :destroy
  has_many :lecture_grades, dependent: :destroy
  has_many :grades, through: :lecture_grades

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true

  def category_name
    Category.find(category_id).name
  end
end
