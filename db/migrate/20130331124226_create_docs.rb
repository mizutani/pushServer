class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :name
      t.string :tag
      t.string :url
      t.text :parameter
      t.text :description
      t.text :message
      t.text :response

      t.timestamps
    end
  end
end
