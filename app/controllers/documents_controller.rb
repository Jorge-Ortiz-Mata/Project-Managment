class DocumentsController < ApplicationController

    before_action :user_has_sign_in?
    before_action :user_has_profile?

    def create
        @project = params[:project_id].to_i
        @user = params[:user_id].to_i
        @avatar = params[:avatar]
        @document = Document.new(project_id: @project, user_id: @user, avatar: @avatar)
        if @document.save 
            redirect_to projects_path(@project), notice: "You've sent a file."
        end
    end


end
