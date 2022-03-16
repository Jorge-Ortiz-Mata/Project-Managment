class Project < ApplicationRecord

    belongs_to :user
    has_many :connections
    has_many :workers, through: :connections
    
    after_create_commit {broadcast_prepend_to "projects"}
    after_update_commit {broadcast_replace_to "projects"}
    after_destroy_commit {broadcast_remove_to "projects"}
    
    # before_destroy :destroy_action
   
    # def destroy_action
    #    @article = Article.first
    #     @article.destroy       
    # end
end
