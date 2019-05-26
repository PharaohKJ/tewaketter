class Config < ApplicationRecord
  belongs_to :user
  has_one :tag
  has_one :invite_code
  accepts_nested_attributes_for :tag
  accepts_nested_attributes_for :invite_code
end
