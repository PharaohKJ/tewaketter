class CreateInviteCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :invite_codes do |t|
      t.references :config, foreign_key: true
      t.string :code
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end
end
