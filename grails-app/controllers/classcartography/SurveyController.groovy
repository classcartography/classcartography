package classcartography

class SurveyController {

    def respond() {
        def survey = Survey.get(params.survey_id)

        [survey: survey,
         questions: survey.questions]
    }
}
