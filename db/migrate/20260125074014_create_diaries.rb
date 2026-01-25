class CreateDiaries < ActiveRecord::Migration[7.1]
  def change
    create_table :diaries do |t|
      t.references :user, null: false, foreign_key: true
      t.date :entry_date
      t.string :good_1
      t.string :good_2
      t.string :good_3
      t.text :memo
      t.string :music_title
      t.string :artist_name

      t.timestamps
    end
  end
end
