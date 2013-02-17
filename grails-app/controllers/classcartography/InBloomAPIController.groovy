package classcartography

class InBloomAPIController {

    def index() { }
   
    def authenticate () {
 
    	def response
  		withHttp(uri:'https://api.sandbox.inbloom.org') {
			response = get(path : '/api/oauth/authorize', query : [client_id:'UzMIy7jMGB', response_type:'code', redirect_uri:'http://localhost:8080/classcartography'])
			// http://api.sandbox.inbloom.org/api/oauth/authorize?client_id=UzMIy7jMGB&response_type=code&redirect_uri=http://localhost:8080/classcartography
  		}
  		redirect(url: "http://api.sandbox.inbloom.org/api/oauth/authorize?client_id=UzMIy7jMGB&response_type=code&redirect_uri=http://localhost:8080/classcartography")
  	}
  	
  	def getStudents () {
  	    def response
  		withRest(uri:'http://api.sandbox.inbloom.org') {
			response = get(path : '/api/rest/v1.1/students')
  		}
  		render response.getData()
  	}
}
