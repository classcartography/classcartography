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
  
    "/surveys"(controller:"survey", action:"list")
    "/surveys/demo"(controller:"survey", action:"demo")
    "/surveys/$id/show"(controller:"survey", action:"show")
    "/surveys/$survey_id/respond"(controller:"survey", action:"respond")

		"500"(view:'/error')
	}
}
