module UsersHelper
  def tab_active?(tab)
    params[:tab] == tab ? {class: "active"} : {}
  end
end
