class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def about
    set_default_metatags
  end

  private
  def set_default_metatags
    set_meta_tags og: {
			title:        t("common.og_title"),
      description:  t("common.og_description"),
			url:          root_url,
			image:        og_image_url
		}
  end

  def og_image_url
    "http://www.stockholmhjalper.se/stockholm-hjalper-logo.png"
  end
end
