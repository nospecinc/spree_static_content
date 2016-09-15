xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Your Blog Title"
    xml.description "A blog about software and chocolate"
    xml.link "#{@base_url}/blog"

    for post in @posts
      xml.item do
        xml.title post.title
        xml.description post.meta_description
        xml.pubDate post.date_published.to_s(:rfc822)
        xml.link "#{@base_url}#{post.slug}"
        xml.guid "#{@base_url}#{post.slug}"
      end
    end
  end
end