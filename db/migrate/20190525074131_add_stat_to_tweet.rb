class AddStatToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :stat, :integer
  end
end
