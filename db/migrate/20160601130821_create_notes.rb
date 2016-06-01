class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.string :author
      t.text :body
      t.text :station

    end
  end
end
