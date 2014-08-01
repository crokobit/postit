class PostDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def show_comment_numbers
    count = object.comments.count
    "#{count} " + "comment".pluralize(count)
  end

  def show_information
    posted_by + " " + link_to_creator + " at " + time
  end

  def link_to_post_with_comment_numbers
    content_tag(:small, content_tag(:span, link_to_post))
  end

  private

  def link_to_post 
    link_to show_comment_numbers, post_path(object)
  end

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
