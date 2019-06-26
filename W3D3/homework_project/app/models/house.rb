class House < ApplicationRecord
  validates :address, presence: true

  has_many(:people, {
    primary_key: :id,
    foreign_key: :person_id,
    class_name: :Person
  })
end