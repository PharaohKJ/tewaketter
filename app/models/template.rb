class Template < ApplicationRecord
  has_and_belongs_to_many :tags, dependent: :destroy
end
