module Pinto
  class View
    def compile(response)
      response.status_code = 300
      response.title = 'Pinto'
      response.add_link(
        :rel => 'alternate',
        :hreflang => 'en',
        :href => 'http://en.pinto.jp'
      )
      response.add_link(
        :rel => 'alternate',
        :hreflang => 'ja',
        :href => 'http://ja.pinto.jp'
      )
      response
    end
  end
end
