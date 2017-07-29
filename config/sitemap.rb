# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'http://towapedia.com'
SitemapGenerator::Sitemap.create_index = true
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  add '/', :changefreq => 'monthly', :priority => 0.7
  add '/about', :changefreq => 'monthly', :priority => 0.5
  # add '/dashboard', :changefreq => 'daily', :priority => 0.5

  # Add all articles:
  Towa.find_each do |towa|
    add towa_path(towa), :lastmod => towa.updated_at, :priority => 0.75, :changefreq => 'daily'
  end

  # User.find_each do |user|
  #   add user_path(user), :lastmod => user.updated_at, :priority => 0.5, :changefreq => 'daily'
  # end
end
SitemapGenerator::Sitemap.ping_search_engines
