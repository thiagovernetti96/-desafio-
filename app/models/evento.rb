class Evento < ApplicationRecord
    has_one :sender
    has_one :repository
    has_one :organization
  
    validates :evento, :body, presence: true
  
    accepts_nested_attributes_for :sender
    accepts_nested_attributes_for :repository
    accepts_nested_attributes_for :organization
  
    enum evento: [:issue]
  
    scope :issue_by_number, ->(number) { where("body->'$.number' = :number", number: number.to_i ) }
  end
end
