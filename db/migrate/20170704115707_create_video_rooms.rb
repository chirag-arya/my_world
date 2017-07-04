class CreateVideoRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :video_rooms do |t|
      t.string :name
      t.string :sessionId
      t.boolean :public
      t.integer :user_id

      t.timestamps
    end
  end
end
