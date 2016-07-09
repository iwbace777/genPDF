class ChangeImageColumnToPdfImage < ActiveRecord::Migration
  def change
    change_column :pdf_images, :image,  :string, null: false, default: "grey-box.png"
  end
end
