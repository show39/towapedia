crumb :root do
  link "Home", root_path
end

# static_pages#about
crumb :about do
  link "とはペディアについて"
  parent :root
end


# towas#show
crumb :towa do |towa|
  link "#{towa.towa}とは", towa
  parent :root
end

# users#show
crumb :user do |user|
  link "#{user.name}さんのマイペディア", user
  parent :root
end
