package classcartography

import grails.converters.JSON

class InBloomAPIController {

    def index () { }
   
    def auth () {
  		redirect(url: "http://api.sandbox.inbloom.org/api/oauth/authorize?client_id=UzMIy7jMGB&response_type=code&redirect_uri=http://localhost:8080/classcartography/login")
  	}
  	
  	def getToken () {
  	    def json
  	    withHttp(uri: "https://api.sandbox.inbloom.org") {
           json = get(path : '/api/oauth/token', query : [client_id:'UzMIy7jMGB', client_secret:'SN5oikX6ZhsE8h0RfQKqFR1DBW9eehNrag7jq4qL1VGzl6Bx', code:params.code, redirect_uri:'http://localhost:8080/classcartography/', grant_type:'authorization_code'])
        } 
        //def jsonObj = JSON.parse(json);
        session.setAttribute("token", json.get("access_token"))
		redirect(controller:"main", action:"index")  	
	}
  	
  	def saveSession () {
  		session.addAttribute("token", params.access_token)
  		redirect(controller:"main", action:"index")
  	}
  	
  	def logout () {
        session.invalidate()
        redirect(controller:"main", action:"index")
    }
  	
  	def getStudents () {
  	    def response
  		withRest(uri:'http://api.sandbox.inbloom.org') {
			response = get(path : '/api/rest/v1.1/students')
  		}
  		render response.getData()
  	}
}
