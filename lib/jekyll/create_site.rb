module Jekyll
	class CreateSite

    # Initialize a new Jekyll site
    #   +name+ is the new Jekyll site folder name
    #

		def initialize(name)
      @site_name = name
			FileUtils.mkdir(@site_name)
			Dir.chdir(@site_name)
      sub_directories
      config_file
      index_page
      default_layout
      first_post
		end

    # Create the required subdirectories
    #   _layouts
    #   _posts
    #
    # Returns true if successfully created _posts
    def sub_directories
			FileUtils.mkdir_p("_layouts")
			FileUtils.mkdir_p("_posts")
    end

    # Create a starter config file
    # 
    # Jekyll has auto:false as a default already, but I needed to put something here
    # as an example
    def config_file
			File.open("_config.yml", 'w') do |f| 
				# this is alread a default, but need to write something
				f.write("auto: false")
				f.close
			end
    end


    # Create the default_layout file
    #
    # Displays a page's title in the <title/> if page exists
    # Displays content
    def default_layout 
      File.open("_layouts/default.html", 'w') do |f|
				f.write <<EOF
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
    <head>
        <title>
          New Jekyll Site
          {% if page.title %}
          : {{page.title}}
          {% endif %}
        </title>
    </head>
    <body>
      {{ content }}
    </body>
</html>
EOF
				f.close
			end
    end

    # Create the index.md file
    # Uses default layout
    # Lists all posts 
    def index_page
			File.open("index.md", 'w') do |f|
				f.write <<EOF
---
layout: default
---

###{@site_name}

Welcome to your new Jekyll site

<ul>
    {% for post in site.posts %}
    <li><a href="{{post.url}}" title="{{post.title}}">{{post.title}}</a></li>
    {% endfor %}
</ul>
EOF
				f.close
			end
    end

    # Create a first post in _posts with today's date 
    def first_post
			File.open("_posts/#{formatted_date}-first_post.md", 'w') do |f|
				f.write <<EOF
---
layout: default
---

First post!
EOF
				f.close
			end
    end
    
    # Returns a formatted date string
    # Used in creating first post
    def formatted_date
      Time.now.strftime("%F")
    end

	end
end
