class Document < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_one_attached :avatar

  validates :project_id, presence: true
  validates :user_id, presence: true
  validates :avatar, presence: true

end
