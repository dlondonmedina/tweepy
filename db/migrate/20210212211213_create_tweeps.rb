class CreateTweeps < ActiveRecord::Migration[6.0]
  def change
    create_table :tweeps do |t|
      t.text :tweep

      t.timestamps
    end
  end
end
