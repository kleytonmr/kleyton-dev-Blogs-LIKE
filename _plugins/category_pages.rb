require 'pry'

module Jekyll
  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      
      binding.pry
      
      if site.layouts.key? 'category'
        site.categories.keys.each do |category|
          site.pages << CategoryPage.new(site, site.source, category)
        end
      end
    end
  end

  class CategoryPage < Page
    def initialize(site, base, category)
      @site = site
      @base = base
      @dir  = 'categorias'
      @name = "#{category}.html"

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category.html')
      self.data['category'] = category
      self.data['title'] = "Posts sobre: #{category}"
    end
  end
end

