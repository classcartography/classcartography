package classcartography

import grails.converters.JSON

class InBloomAPIController {

    def index () { }
   
    def auth () {
    	def hostname = grailsApplication.config.grails.serverURL
    	def fullurl = "http://api.sandbox.inbloom.org/api/oauth/authorize?client_id="+grailsApplication.config.grails.clientId+"&response_type=code&redirect_uri="+hostname+"/login"
 		redirect(url: fullurl)
  	}
  	
  	def saveSession () {
  	    def tokenResp
  	    def fullurl = grailsApplication.config.grails.serverURL
  	    withHttp(uri: "https://api.sandbox.inbloom.org") {
           tokenResp = get(path : '/api/oauth/token', query : [client_id:grailsApplication.config.grails.clientId, client_secret:grailsApplication.config.grails.secret, code:params.code, redirect_uri:fullurl])
        }       
        def token = tokenResp.get("access_token")
        session.setAttribute("token", token)
        
        def sessionResp
        withHttp(uri: "https://api.sandbox.inbloom.org") {
           sessionResp = get(path : '/api/rest/system/session/check', headers : [Authorization:'Bearer '+token])
        }
        session.setAttribute("name", sessionResp.get("full_name"))
        session.setAttribute("server", fullurl)
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
  	
  	def getGrades () {
  	  	def token = session.getAttribute("token")
        def sectionsResp
        def fullpath = "/api/rest/v1.1/sections/"+params.course_id
        withHttp(uri: "https://api.sandbox.inbloom.org") {
           sectionsResp = get(path : fullpath, headers : [Authorization:'Bearer '+token])
        }
        def arr = sectionsResp.get("links")
        def gradesUrl
        for (i in arr) {
         	if (i.get("rel").equals("getStudentGradebookEntries")) {
         	  	gradesUrl = i.get("href")
         	}
        }
        
        def gradesResp
        withHttp(uri: gradesUrl) {
        	gradesResp = get(headers : [Authorization:'Bearer '+token])
        }
        
        def grades = []
        for (i in gradesResp) {
        	if (i.get("studentId").equals(params.student_id)) {
        		grades.add([date:i.get("dateFulfilled"), grade:i.get("letterGradeEarned")])
        	}
        }
        
        render grades
  	}
  	
  	def getAttendance () {
  	  	def token = session.getAttribute("token")
        def attResp
        def fullpath = "/api/rest/v1.1/students/"+params.student_id+"/attendances"
        withHttp(uri: "https://api.sandbox.inbloom.org") {
           attResp = get(path : fullpath, headers : [Authorization:'Bearer '+token])
        }
        
        for (i in attResp) {
        	render i.get("schoolYearAttendance")
        }
  	}
}
