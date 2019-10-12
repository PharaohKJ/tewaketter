class AddBufferTokenToConfig < ActiveRecord::Migration[5.2]
  def change
    add_column :configs, :buffer_token, :text
    add_column :configs, :use_buffer, :boolean
  end
end
