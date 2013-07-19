class CreateGenes < ActiveRecord::Migration
  def change
    create_table :genes do |t|
      t.integer :suited
      t.text :gene
      t.integer :generation
      t.integer :in_generation_serial

      t.timestamps
    end
  end
end
