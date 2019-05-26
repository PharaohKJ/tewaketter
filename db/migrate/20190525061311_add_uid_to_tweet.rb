class AddUidToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :uuid, :string
  end
end
