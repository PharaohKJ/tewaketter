class Tag < ApplicationRecord
  belongs_to :config, optional: true
  has_and_belongs_to_many :templates, dependent: :destroy

  before_save :normalize

  def normalize
    self.name = name.split(' ')
                    .map { |r| r[0] == '#' ? r : "##{r}"}
                    .join(' ')
    self
  end
end
