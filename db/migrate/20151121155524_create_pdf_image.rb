class CreatePdfImage < ActiveRecord::Migration
  def change
    create_table :pdf_images do |t|
      t.string :name
      t.timestamps
    end
  end
end
