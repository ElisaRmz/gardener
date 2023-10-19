class Land < ApplicationRecord
    validates :name, presence: true

    belongs_to :user
    has_many :seeded_plants, dependent: :destroy
end