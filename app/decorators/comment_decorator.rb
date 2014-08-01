class CommentDecorator < Draper::Decorator
  delegate_all
  include Detailable
  include Draper::LazyHelpers
end
