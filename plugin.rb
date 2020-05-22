# name: cloudflare_fix
# about: Remove useless querystring in static assets to re-enable cloudflare edge caching
# version: 0.1.0
# authors: wfjsw
# url: https://github.com/wfjsw/discourse-cloudflare-fix

after_initialize do 

    JavascriptCache.class_eval do 
        def url
            "#{GlobalSetting.cdn_url}#{Discourse.base_uri}/theme-javascripts/#{digest}.js"
        end
    end

    Stylesheet::Manager.class_eval do 
        def stylesheet_cdnpath(hostname)
            "#{GlobalSetting.cdn_url}#{stylesheet_relpath}"
        end
    end

end
