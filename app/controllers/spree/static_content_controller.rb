module Spree
  class StaticContentController < StoreController
    rescue_from ActiveRecord::RecordNotFound, with: :render_404

    helper 'spree/products'
    layout :determine_layout

    def show
      @page = Spree::Page.by_store(current_store).visible.find_by_slug!(request.path)
    end

    def blog_feed
      @posts = Spree::Page.blog.visible.order('date_published desc').limit(50).select(
        :title, :slug, :date_published, :meta_description
      )

      # could use some work to be more robust
      # strips a trailing slash if needed
      @base_url = Spree::Store.current.url.gsub(/\/$/,'') 

      render :action => 'blog_feed.rss.builder', :layout => false, :content_type => 'application/rss+xml'
 
    end

    private

    def determine_layout
      return @page.layout if @page && @page.layout.present? && !@page.render_layout_as_partial?
      Spree::Config.layout
    end

    def accurate_title
      @page ? (@page.meta_title.present? ? @page.meta_title : @page.title) : nil
    end

  end
end
