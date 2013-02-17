package classcartography

class Response {

	String response;
 	Date createDate;
	Question question;

	static belongsTo = [surveyUser:SurveyUser, user:User]
    static constraints = {
    }
}
