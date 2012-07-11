class CreateKelompoks < ActiveRecord::Migration
  def change
    create_table :kelompoks do |t|
      t.string :kode
      t.string :jenis
      t.string :keterangan
      t.string :parent_id

      t.timestamps
    end
  end
end
