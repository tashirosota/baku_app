module AjaxHelper
  # ajaxで画面遷移しない問題を解決
  def ajax_redirect_to(redirect_uri)
    { js: "window.location.replace('#{redirect_uri}');" }
  end
end
