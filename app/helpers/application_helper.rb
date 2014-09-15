module ApplicationHelper
  def current_url path
    current_route = Rails.application.routes.recognize_path(path)
    'active' if current_page?(path) || params[:controller] == current_route[:controller]
  end
end
