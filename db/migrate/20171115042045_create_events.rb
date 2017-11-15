class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :details
      t.datetime :date

      t.timestamps
    end
  end
end
