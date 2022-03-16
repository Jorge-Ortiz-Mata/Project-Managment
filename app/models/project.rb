class Project < ApplicationRecord
    
    belongs_to :user



    
    # before_destroy :destroy_action
   
    # def destroy_action
    #    @article = Article.first
    #     @article.destroy       
    # end
end
