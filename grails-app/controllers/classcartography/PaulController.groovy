package classcartography

import groovy.xml.MarkupBuilder

class PaulController {

    def index() {

      def data
      withRest(id: "DEMO_KEY", uri: "http://twitter.com/statuses/") {
        auth.basic 'DEMO_KEY', ''
        def response = get(path: '/v1.1/schools')
        data = response.data
      }
      render data

    }

    
}
