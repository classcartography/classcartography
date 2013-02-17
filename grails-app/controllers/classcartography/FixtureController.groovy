package classcartography

class FixtureController {

	def fixtureLoader

    def index() { }

    def createRandomQuestions() {

		def generator = { String alphabet, int n ->
		  new Random().with {
		    (1..n).collect { alphabet[ nextInt( alphabet.length() ) ] }.join()
		  }
		}

		def sentenceGen = {
			def para = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ullamcorper, arcu a condimentum mollis, ante nibh ultricies diam, sit amet consequat mauris eros non justo. Nullam eget leo turpis. Vestibulum accumsan tempus diam vitae tempor. "
			Random random = new Random()
			return para.substring(random.nextInt(100), random.nextInt(130)+100)			   
		}

		for (int i=1; i<11; i++) {
	    	def user = User.build(email:"student"+i+"gmail.com", type:"STUDENT", inBloomId:generator( (('A'..'Z')+('0'..'9')).join(), 8 ));

	    	for (int j=1; j<6; j++) {
		    	def survey = Survey.build(courseId:"MATH", creatorId:generator( (('A'..'Z')+('0'..'9')).join(), 8 ));
			    def survey_user = SurveyUser.build(user:user, survey:survey);

			    for (int k=1; k<6; k++) {
			    	def q = Question.get(k)
				    def survey_question = SurveyQuestion.build(survey:survey, sequence:k, question:q)

					def response = Response.build(surveyUser:survey_user, user:user, question:q, response:sentenceGen())
				}
			}
		}
	}

}
