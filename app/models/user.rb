class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
  has_one :profile, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :documents, dependent: :destroy
  before_destroy :destroy_connections
   
    def destroy_connections
      user_connection = Connection.where(worker_id: self.id)    
      user_connection.delete_all
    end

end
