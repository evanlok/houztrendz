module ApplicationHelper
  def bootstrap_class_for(flash_type)
    @bootstrap_classes ||= {
      notice: 'alert-info', # Blue
      alert: 'alert-info', # Blue
      success: 'alert-success', # Green
      error: 'alert-danger', # Red
      warning: 'alert-warning' # Yellow
    }

    @bootstrap_classes[flash_type.to_sym]
  end

  def title(page_title)
    suffix = ' | HouzTrendz'
    page_title += suffix unless page_title.end_with?(suffix)
    content_for :title, page_title
  end
end
