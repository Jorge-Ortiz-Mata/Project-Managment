class Connection < ApplicationRecord
  belongs_to :project
  belongs_to :worker, class_name: 'User'
end
