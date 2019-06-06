class CreateEventGroupRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :event_group_relationships do |t|
      t.integer :event_id
      t.integer :group_id
      t.timestamps
    end

    add_index(:event_group_relationships, :event_id)
    add_index(:event_group_relationships, :group_id)
  end
end
