class ChangeColumntoPdfImage < ActiveRecord::Migration
  def change
    rename_column :pdf_images, :name, :image
  end
end
