class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :kode
      t.string :tipe
      t.string :kelompok_asset
      t.text :keterangan
      t.string :parent_id
      t.timestamps
    end
  end
end
