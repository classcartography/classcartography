package classcartography

class SurveyController {
    
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
