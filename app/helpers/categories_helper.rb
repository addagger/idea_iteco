module CategoriesHelper
  
  def categories_for_select
    accessible_categories.map {|c| [c, c.id]}
  end
  
  def accessible_categories
    Category.accessible_by(current_ability)
  end
  
  def categories
    @categories ||= accessible_categories
  end
  
end
