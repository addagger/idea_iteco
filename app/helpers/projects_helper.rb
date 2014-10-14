module ProjectsHelper
  
  def projects_for_select
    accessible_projects.map {|pr| [pr, pr.id]}
  end
  
  def accessible_projects
    Project.accessible_by(current_ability)
  end
  
  def projects
    @projects ||= accessible_projects
  end
  
end
