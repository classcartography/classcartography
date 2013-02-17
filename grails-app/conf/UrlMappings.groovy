class UrlMappings {

	static mappings = {
	
		"/login"(controller: "inBloomAPI", action: "authenticate")

		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"main", action:"index")
		"500"(view:'/error')
	}
}
