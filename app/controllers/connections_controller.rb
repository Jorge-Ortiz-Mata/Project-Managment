class ConnectionsController < ApplicationController

    before_action :user_has_sign_in?
    before_action :user_has_profile?

    def create
        @worker = params[:user]
        @project = params[:project]
        @connection = Connection.create(project_id: @project, worker_id: @worker)
        @connection.save
        redirect_to project_path(@project), notice: "Worker added to the project."
    end

    def destroy
        @worker = params[:worker]
        @project = params[:project]
        @connection = Connection.where(project_id: @project, worker_id: @worker).first
        @connection.destroy
        redirect_to project_path(@project), notice: "Worker was removed from the project"
    end

end
