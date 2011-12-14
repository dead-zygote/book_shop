class AddLengthWidthAndThicknessToBooks < ActiveRecord::Migration
  def change
    add_column :books, :length, :integer
    add_column :books, :width, :integer
    add_column :books, :thickness, :integer
    remove_column :books, :sizes
  end
end
