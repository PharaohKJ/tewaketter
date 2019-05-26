class Tag < ApplicationRecord
  belongs_to :config

  before_save :normalize

  def normalize
    self.name = name.split(' ')
                    .map { |r| r[0] == '#' ? r : "##{r}"}
                    .join(' ')
    self
  end
end
