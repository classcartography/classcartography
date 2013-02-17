class UrlMappings {

	static mappings = {
	
		"/auth"(controller: "inBloomAPI", action: "auth")
		"/login"(controller: "inBloomAPI", action: "getToken")
		"/logout"(controller: "inBloomAPI", action: "logout")

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
