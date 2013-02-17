package classcartography

import grails.converters.JSON

class SurveyController {

	List questions;

    def index() { 
    	questions = Question.list();
    	render questions as JSON;
    }

    def show() { 
    	redirect(action:index)
    }

    def allAnswers() {
    	def aSurvey = Survey.get(params.surveyId);
		def c = SurveyUser.createCriteria()
		def results = c.list {
		    survey {
		    	eq("id", aSurvey.id)
		    }
		}
    	def survey_user = results.get(0);
    	def resps = survey_user.responses;

		//render(contentType: 'text/json') {[
		//    'responses': resps
		//]}
		render resps as JSON
    }

    def studentAnswers() {
    	def aSurvey = Survey.get(params.surveyId);
    	def aUser = User.get(params.userId);
		def c = SurveyUser.createCriteria()
		def results = c.list {
		    user {
		    	eq("id", aUser.id)
		    }
		    survey {
		    	eq("id", aSurvey.id)
		    }
		}
    	def survey_user = results.get(0);
    	def resps = survey_user.responses;
		render resps as JSON
    }

    def save() { 

    	def aSurvey = Survey.get(params.surveyId);
    	def aUser = User.get(params.userId);
		def c = SurveyUser.createCriteria()
		def results = c.list {
		    user {
		    	eq("id", aUser.id)
		    }
		    survey {
		    	eq("id", aSurvey.id)
		    }
		}

		def survey_user = results.get(0)
		for(int i=0;i<5;i++){

	    	def resp = new Response();    	
			def responseParam = "response"+i;
			resp.createDate = new Date();
	    	questions = Question.list();
			resp.question = questions.get(i);
			resp.response = params[responseParam];
			resp.surveyUser = survey_user;
			resp.user = aUser;
			resp.save(failOnError: true);


			survey_user.addToResponses(resp);
			survey_user.save(failOnError: true);
			aUser.addToResponses(resp);
			aUser.save(failOnError: true);

		}

    }
    
    def list() {
        //TODO: limit to scope of current logged in teacher 
        //[surveys: Survey.all()]
    }
    
    def demo() { }

    def respond() {
        def survey = Survey.get(params.survey_id)

        [survey: survey,
         questions: survey.questions]
    }
}
