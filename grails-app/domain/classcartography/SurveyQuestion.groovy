package classcartography

class SurveyQuestion {

	Integer sequence
	
	static belongsTo = [survey: Survey, question: Question]
    static constraints = {
    }
}
