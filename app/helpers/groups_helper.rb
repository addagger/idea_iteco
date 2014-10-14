module GroupsHelper
  
  def groups_for_select
    accessible_groups.map {|g| [g, g.id]}
  end
  
  def accessible_groups
    Group.accessible_by(current_ability)
  end
  
  def groups
    @groups ||= accessible_groups
  end
  
end
