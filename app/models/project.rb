class Project < ApplicationRecord

    belongs_to :user
    has_many :connections, dependent: :destroy
    has_many :workers, through: :connections
    has_many :documents, dependent: :destroy

end
