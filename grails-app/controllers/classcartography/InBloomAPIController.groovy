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
           tokenResp = get(path : '/api/oauth/token', query : [client_id:'UzMIy7jMGB', client_secret:'SN5oikX6ZhsE8h0RfQKqFR1DBW9eehNrag7jq4qL1VGzl6Bx', code:params.code, redirect_uri:'http://localhost:8080/classcartography/'])
        } 
        //redirect(url: "https://api.sandbox.inbloom.org/api/oauth/token?client_id=UzMIy7jMGB&client_secret=SN5oikX6ZhsE8h0RfQKqFR1DBW9eehNrag7jq4qL1VGzl6Bx&code="+params.code+"&redirect_uri=http://localhost:8080/classcartography/")
      
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
        def sectionsUrl
        for (i in arr) {
         	if (i.get("rel").equals("getSections")) {
         	  	sectionsUrl = i.get("href")
         	}
        }
        
        def sectionsResp
        withHttp(uri: sectionsUrl) {
        	sectionsResp = get(headers : [Authorization:'Bearer '+token])
        }
        
        def courses = []
        for (i in sectionsResp) {
        	courses.add([id:i.get("id"), name:i.get("uniqueSectionCode")])
        }
        
        render courses
  	}
  	
  	def getStudents () {
  		def token = session.getAttribute("token")
        def sectionsResp
        def fullpath = "/api/rest/v1.1/sections/"+params.course_id
        withHttp(uri: "https://api.sandbox.inbloom.org") {
           sectionsResp = get(path : fullpath, headers : [Authorization:'Bearer '+token])
        }
        def arr = sectionsResp.get("links")
        def studentsUrl
        for (i in arr) {
         	if (i.get("rel").equals("getStudents")) {
         	  	studentsUrl = i.get("href")
         	}
        }
        
        def studentsResp
        withHttp(uri: studentsUrl) {
        	studentsResp = get(headers : [Authorization:'Bearer '+token])
        }
		
		def students = []
        for (i in studentsResp) {
        	students.add([id:i.get("id"), name:i.get("name")])
        }
        
        render students
  	}
}
