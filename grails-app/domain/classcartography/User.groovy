package classcartography

class User {

	String inBloomId 
	String type
	String email

	static hasMany = [surveys:SurveyUser]
	
    static constraints = {
    }
}
