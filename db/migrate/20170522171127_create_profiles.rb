class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
	  	t.string :image_file_name
      t.string :image_content_type
      t.string :image_file_size
      t.string :image_updated_at

      t.string :image1_file_name
      t.string :image1_content_type
      t.string :image1_file_size
      t.string :image1_updated_at

      t.string :image2_file_name
      t.string :image2_content_type
      t.string :image2_file_size
      t.string :image2_updated_at

      t.string :image3_file_name
      t.string :image3_content_type
      t.string :image3_file_size
      t.string :image3_updated_at

      t.string :image4_file_name
      t.string :image4_content_type
      t.string :image4_file_size
      t.string :image4_updated_at

      t.string :image5_file_name
      t.string :image5_content_type
      t.string :image5_file_size
      t.string :image5_updated_at

      t.string :relationship_status
      t.text :about
      t.text :address1
      t.text :address2
      t.integer :user_id

      t.timestamps
    end
  end
end
