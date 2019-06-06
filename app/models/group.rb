class Group < ApplicationRecord
  has_many :event_group_relationships
  has_many :events, :through => :event_group_relationships
end
