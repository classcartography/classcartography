class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"main", action:"index")
		"/demo"(controller:"main", action:"demo")

		"500"(view:'/error')
		
		"/survey/$surveyId/student/$userId" (controller: "survey", action: "index")
		"/survey/$surveyId/student/$userId/save" (controller: "survey", action: "save")
		"/survey/$surveyId/answers" (controller: "survey", action: "allAnswers")
		"/survey/$surveyId/student/$userId/answers" (controller: "survey", action: "studentAnswers")
	}
}
