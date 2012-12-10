class CreateGestures < ActiveRecord::Migration
  def change
    create_table :gestures do |t|
      t.text :gesture_name
      t.text :gesture_img
      t.text :gesture_msg

      t.timestamps
    end
  end
end
