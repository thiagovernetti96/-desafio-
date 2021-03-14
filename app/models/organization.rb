class Organization < ApplicationRecord
    belongs_to :evento

    validates :body, presence: true
end
