class AddImageIdToPdfImage < ActiveRecord::Migration
  def change
    add_column :pdf_images, :image_id, :integer
  end
end
