class Article < ActiveRecord::Base
    has_many :user_articles
    has_many :users, through: :user_articles

    rm = RestClient.get "https://api.nytimes.com/svc/topstories/v2/arts.json?api-key=Y4GhdvAkcPH7EAXFvn2Uyw45U5C9GsqT"
    rm_array = JSON.parse(rm)["results"]

    def filtered_article_data
    array_filtered = rm_array.each do |article|
            Article.find_or_create_by(
              title: article["title"],
              abstract: article["abstract"],
              categor0y: article["section"],
              author: article["byline"],
              url: article["url"]   
          )
        end
    end
    
end # end Article