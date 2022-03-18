class Project < ApplicationRecord

    belongs_to :user
    has_many :connections, dependent: :destroy
    has_many :workers, through: :connections
    has_many_attached :files, dependent: :destroy

end
