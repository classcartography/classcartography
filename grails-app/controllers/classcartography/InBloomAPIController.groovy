package classcartography

import grails.converters.JSON

class InBloomAPIController {

    def index () { }
   
    def auth () {
  		redirect(url: "http://api.sandbox.inbloom.org/api/oauth/authorize?client_id=UzMIy7jMGB&response_type=code&redirect_uri=http://localhost:8080/classcartography/login")
  	}
  	
  	def saveSession () {
  	    def tokenResp
  	    withHttp(uri: "https://api.sandbox.inbloom.org") {
           tokenResp = get(path : '/api/oauth/token', query : [client_id:'UzMIy7jMGB', client_secret:'SN5oikX6ZhsE8h0RfQKqFR1DBW9eehNrag7jq4qL1VGzl6Bx', code:params.code, redirect_uri:'http://localhost:8080/classcartography/', grant_type:'authorization_code'])
        } 
        def token = tokenResp.get("access_token")
        session.setAttribute("token", token)
        
        def sessionResp
        withHttp(uri: "https://api.sandbox.inbloom.org") {
           sessionResp = get(path : '/api/rest/system/session/check', headers : [Authorization:'Bearer '+token])
        }
        session.setAttribute("name", sessionResp.get("full_name"))
		redirect(controller:"main", action:"index")  	
	}
  	
  	def logout () {
  	    def json
  	    withHttp(uri: "https://api.sandbox.inbloom.org") {
           json = get(path : '/api/rest/system/session/logout')
        } 
        if (json.get("logout") == true) {
        	session.invalidate()
        	redirect(controller:"main", action:"index")
        } // else logout failed
    }
  	
  	def getStudents () {
  	    def response
  		withRest(uri:'http://api.sandbox.inbloom.org') {
			response = get(path : '/api/rest/v1.1/students')
  		}
  		render response.getData()
  	}
}
