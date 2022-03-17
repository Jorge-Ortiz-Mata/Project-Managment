class Project < ApplicationRecord

    belongs_to :user
    has_many :connections, dependent: :destroy
    has_many :workers, through: :connections
    has_many_attached :files
    
    # before_destroy :destroy_action
   
    # def destroy_action
    #    @article = Article.first
    #     @article.destroy       
    # end
end
