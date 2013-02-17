package classcartography

class SurveyUser {

	Date sentDate
	
	static belongsTo = [survey: Survey, user: User]
	static hasMany = [responses:Response]

    static constraints = {
    }
}
