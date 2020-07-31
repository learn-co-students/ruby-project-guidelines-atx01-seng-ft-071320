class NytApp
   attr_reader :user, :article

   def run
   intro
   end

   def intro
   puts ""
   puts "Welcome to The New York Times:Top Stories for the arts section."
   puts ""
   puts "In this app we will provide you with random articles from The New York Times archive to your profile to read now or later."
   puts ""
   random_articles
   end

# Once user logs in, we want to present them with random titles from the New York Times Arts section Top Posts.

   def random_articles
      @category_list = Article.all.collect do |articles|
         articles.category.capitalize
      end.uniq
      #binding.pry
      select_articles
      
   end

   def select_articles
      @selection = PROMPT.select("Please choose a category you are interested in.", @category_list)
      puts ""
      puts "Nice pick! You chose #{@selection.blue}. Here are all the articles from The New York Times for your chosen category."
      puts ""
      contained_articles
      #binding.pry
   end

   def contained_articles
      @variable = []
      Article.all.each do |article|
         if article.category.capitalize == @selection
            @variable << article
         end
      end
      article_attributes
   end

   def article_attributes
      @article_selections = @variable.map do |article|
         {
           title: article.title,
           abstract: article.abstract,
           author: article.author,
           url: article.url 
         }
         end
         binding.pry
   end

end
