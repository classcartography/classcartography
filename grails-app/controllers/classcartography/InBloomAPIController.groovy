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
        //render sessionResp
        
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
  	
  	def getCourses () {
  	    def token = session.getAttribute("token")
        def homeResp
        withHttp(uri: "https://api.sandbox.inbloom.org") {
           homeResp = get(path : '/api/rest/v1.1/home', headers : [Authorization:'Bearer '+token])
        }
        def arr = homeResp.get("links")
        def sections
        for (i in arr) {
         	if (i.get("rel").equals("getSections")) {
         	  	sections = i.get("href")
         	}
        }
        
        def sectionsResp
        withHttp(uri: sections) {
        	sectionsResp = get(headers : [Authorization:'Bearer '+token])
        }
        
        def courses = [];
        for (i in sectionsResp) {
        	courses.add(i.get("uniqueSectionCode"))
        }
        
        render courses
  	}
}
