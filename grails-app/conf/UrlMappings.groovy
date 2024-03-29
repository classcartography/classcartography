class UrlMappings {

	static mappings = {
	
		"/auth"(controller: "inBloomAPI", action: "auth")
		"/login"(controller: "inBloomAPI", action: "saveSession")
		"/logout"(controller: "inBloomAPI", action: "logout")
		
		"/getCoursesForCurrentUser"(controller: "inBloomAPI", action:"getCourses")
		"/getStudentsForCourse"(controller: "inBloomAPI", action:"getStudents")
		"/getGrades"(controller: "inBloomAPI", action:"getGrades")
		"/getAttendance"(controller: "inBloomAPI", action:"getAttendance")

		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"main", action:"login")
		"/demo"(controller:"main", action:"demo")
  
	    "/surveys"(controller:"survey", action:"index")
	    "/survey/list"(controller:"survey", action:"index")
	    "/surveys/demo"(controller:"survey", action:"demo")
	    "/surveys/$id/show"(controller:"survey", action:"show")
	    "/surveys/$survey_id/respond"(controller:"survey", action:"respond")

		"500"(view:'/error')
		
		"/survey/$surveyId/student/$userId" (controller: "survey", action: "index")
		"/survey/$surveyId/student/$userId/save" (controller: "survey", action: "save")
		"/survey/$surveyId/answers" (controller: "survey", action: "allAnswers")
		"/survey/$surveyId/student/$userId/answers" (controller: "survey", action: "studentAnswers")
	}
}
