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
	}
}
