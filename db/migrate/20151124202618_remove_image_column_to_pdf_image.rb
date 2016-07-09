class RemoveImageColumnToPdfImage < ActiveRecord::Migration
  def change
    remove_column :pdf_images, :image
  end
end
