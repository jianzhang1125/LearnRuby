class CreateRcrRequestAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :rcr_request_attachments do |t|
      t.integer :rcr_request_id, :index => true
      t.string :name, :null => false
      t.string :path, :null => false
      t.timestamps
    end
  end
end
