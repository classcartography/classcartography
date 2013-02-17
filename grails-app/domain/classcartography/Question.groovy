package classcartography

class Question {

	String question;
	String responseType;
	
	static hasMany = [surveys:SurveyQuestion]
	
    static constraints = {
    }
}
