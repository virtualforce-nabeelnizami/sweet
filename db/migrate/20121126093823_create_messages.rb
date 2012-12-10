class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user
      t.references :gesture
      t.integer :frm_id
      t.text :content
      t.integer :is_read

      t.timestamps
    end
  end
end
