package classcartography

class Survey {

	Date createDate;
	String courseId;
	String creatorId;
	String description;

	static hasMany = [questions:SurveyQuestion, users:SurveyUser]
    static constraints = {
    }
}
