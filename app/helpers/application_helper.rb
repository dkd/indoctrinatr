module ApplicationHelper
  def current_url path
    current_route = Rails.application.routes.recognize_path(path)
    'active' if current_page?(path) || params[:controller] == current_route[:controller]
  end

  def current_revision
    `git rev-parse --short HEAD > CURRENT_REVISION` unless File.exist?('CURRENT_REVISION')
    revision = File.read('CURRENT_REVISION').chomp
    revision = t(:unknown_revision) if revision.blank?
    revision
  end
end
