class PagesController < ApplicationController

  before_action :user_has_sign_in?
  before_action :user_has_profile?

  def home
    @projects = Project.all
    @articles = Article.all
  end
end
