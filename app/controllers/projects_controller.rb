class ProjectsController < ApplicationController

  before_action :user_has_sign_in?
  before_action :user_has_profile?
  before_action :projects_allowed, only: [:new, :create]
  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :user_admin, only: [:edit, :update, :destroy]
  # GET /projects/1 or /projects/1.json
  def show
    @users =  User.all
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def projects_allowed
      if current_user.profile.project_role == 'Project leader' && current_user.profile.plan == "Free" && current_user.projects.count == 3
        redirect_to root_path, notice: "You've achieved the maximum projects in your account."
      elsif current_user.profile.project_role == 'Project leader' && current_user.profile.plan == "Premium" && current_user.projects.count == 10
        redirect_to root_path, notice: "You've achieved the maximum projects in your account."
      elsif current_user.profile.project_role == 'Team member'
        redirect_to root_path, alert: "You are a team member."
      end
    end

    def user_admin
      if current_user != @project.user
        redirect_to @project, alert: "This project doesn't belong to you."
      end
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :description)
    end
end
