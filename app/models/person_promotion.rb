class PersonPromotion < ApplicationRecord
  belongs_to :person
  belongs_to :promotion
end
