class Connection < ApplicationRecord
    belongs_to :project
    belongs_to :worker, class_name: 'User'

  def self.verify_workers(user, project)
      where(project_id: project.id, worker_id: user.id).first.present?   
  end

  def self.get_projects(user)
      where(worker_id: user.id)
  end

end
