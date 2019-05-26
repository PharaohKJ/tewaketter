class InviteCode < ApplicationRecord
  belongs_to :config

  def set_default
    self.code = SecureRandom.uuid
    self.start = Time.current
    self.finish = Time.current
    self
  end
end
