class Tag < ApplicationRecord
  belongs_to :config

  before_save :normalize

  def normalize
    self.name = name.split(' ')
                    .map { |r| "##{r}" if r[0] != '#'}
                    .join(' ')
    self
  end
end
