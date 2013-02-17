package classcartography

import groovy.xml.MarkupBuilder

class PaulController {

    def index() {
        withHttp(uri: "http://www.google.com") {
           def html = get(path : '/search', query : [q:'Groovy'])
           assert html.HEAD.size() == 1
           assert html.BODY.size() == 1
        }
        render html
    }
    
    def login() {
        def writer = new StringWriter()
        def builder = new MarkupBuilder(writer)
        builder.html {
            head {
                title 'Log in'
            }
            body {
                h1 'Hello'
                form {
                }
            }
        }
        def html = writer.toString()
        render html
    }    
}
