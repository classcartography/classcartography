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

    def insert() {

        def q1 = new Question(question: "How much did you learn today?", responseType:"NUMBER");
        q.save()
        def q1get = Question.get(1)
        asset 1 == q1get.id
        def q2 = new Question(question: "What was your favorite part of class?", responseType:"TEXT");
        q2.save()
        def q3 = new Question(question: "What was your least favorite part of class?", responseType:"TEXT");
        q3.save()
        def q4 = new Question(question: "Describe one new thing you learned today.", responseType:"TEXT");
        q4.save()

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
