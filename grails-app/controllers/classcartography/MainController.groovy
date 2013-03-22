package classcartography

class MainController {

    def index() { 

    }

    def login() { 
    	def token = session.getAttribute("token")
    	if (token) {
    		redirect(action:"index")
		} else {
		   	render(view: "login")	 
		}
    }

    def demo() { }
}
