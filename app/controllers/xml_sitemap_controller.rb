class XmlSitemapController < ApplicationController
  layout nil
  @@opportunity_config
  before_action :set_opportunity_routes

  # Register both: /sitemap.xml and blog/sitemap.xml with webmaster tools
  # https://www.google.com/webmasters
  # https://www.bing.com/toolbox/webmaster
  def index
    headers['Content-Type'] = 'application/xml'
    @routes = website_routes + @opportunity_routes
    @blog_sitemap_route = buttercms_blog_sitemap_url
  end

  def robots
    file = "robots.disallowed.txt"
    file = "robots.live.txt" if LIVE_WEB
    robots = File.read(Rails.root + "config/environments/#{file}")
    render plain: robots, layout: false, content_type: "text/plain"
  end

private

  def website_routes
    [
      root_url,
      for_events_url,
      buttercms_category_url(:events),
      buttercms_category_url(:sponsorship),
      schedule_demo_url,
      tos_url,
      privacy_url,
      contact_us_url,
      send_us_a_message_url,
      choose_registration_url,
      choose_sign_in_url,
    ]
  end

  def set_opportunity_routes
    @opportunity_routes = []
    OPPORTUNITY_CONFIG.each do |brand_name, brand_config|
      next if "opportunity_template".eql? brand_name
      brand_config.each do |opportunity_name, cfg|
        brand = brand_name.downcase.dasherize
        op = opportunity_name.downcase.dasherize
        @opportunity_routes << opportunity_landing_page_url(brand, op)
      end
    end
  end
end
