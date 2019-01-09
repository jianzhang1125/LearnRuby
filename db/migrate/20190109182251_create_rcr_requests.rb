class CreateRcrRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :rcr_requests do |t|
      t.string :request_type, :null => false
      t.text :public_key, :null => false
      t.string :account_number, :null => false
      t.string :status, :null => false
      t.string :owner_group
      t.datetime :created_at, :null => false
      t.string :created_by, :null => false
      t.datetime :updated_at
      t.string :updated_by
      t.datetime :primary_approved_at
      t.string :primary_approved_by
      t.text :primary_approved_comment
      t.datetime :denied_at
      t.string :denied_by
      t.text :denied_comment
      t.timestamps
    end
  end
end
