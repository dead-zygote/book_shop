class CreateCoverTypes < ActiveRecord::Migration
  def change
    create_table :cover_types do |t|
      t.string :name
    end
    
    add_index :cover_types, :name, unique: true
  end
end
