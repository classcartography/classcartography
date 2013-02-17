class UrlMappings {

	static mappings = {
	
		"/login"(controller: "inBloomAPI", action: "authenticate")

		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"main", action:"index")
		"/demo"(controller:"main", action:"demo")

    "/survey/$survey_id/respond"(controller:"survey", action:"respond")

		"500"(view:'/error')
	}
}
