package classcartography

class Question {

	String question;
	String type;
	
	static hasMany = [surveys:SurveyQuestion]
	
    static constraints = {
    }
}
