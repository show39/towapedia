# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'http://towapedia.com'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Add '/articles'
  add '/'

  # Add all articles:
  Towa.find_each do |towa|
    add towa_path(towa), :lastmod => towa.updated_at, :priority => 0.7, :changefreq => 'daily'
  end
end
