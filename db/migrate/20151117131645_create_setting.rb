class CreateSetting < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :background_color

      t.timestamps
    end
  end
end
