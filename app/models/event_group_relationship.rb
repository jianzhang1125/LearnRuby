class EventGroupRelationship < ApplicationRecord
  belongs_to :event
  belongs_to :group
end
