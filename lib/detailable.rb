module Detailable
  extend ActiveSupport::Concern

  
  def show_by_who_at_when
    posted_by + " " + link_to_creator + " at " + time
  end

  private

  def time
    content_tag(:small, created_at.strftime("%d/%m/%Y %R %P %Z"))
  end
  
  def posted_by
    content_tag(:span, "posted by", class: "quiet")
  end

  def link_to_creator
    link_to object.creator.name, user_path(object.creator)
  end

end
