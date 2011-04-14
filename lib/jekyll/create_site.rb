module Jekyll
	class CreateSite

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

    def sub_directories
			FileUtils.mkdir_p("_layouts")
			FileUtils.mkdir_p("_posts")
    end

    def config_file
			File.open("_config.yml", 'w') do |f| 
				# this is alread a default, but need to write something
				f.write("auto: false")
				f.close
			end
    end

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

    def formatted_date
      Time.now.strftime("%F")
    end

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

	end
end
