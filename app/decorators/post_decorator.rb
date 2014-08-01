class PostDecorator < Draper::Decorator
  include Draper::LazyHelpers
  include Detailable
  delegate_all

  def show_comment_numbers
    count = object.comments.count
    "#{count} " + "comment".pluralize(count)
  end

  def link_to_post_with_comment_numbers
    content_tag(:small, content_tag(:span, link_to_post))
  end

  private

  def link_to_post 
    link_to show_comment_numbers, post_path(object)
  end

end
