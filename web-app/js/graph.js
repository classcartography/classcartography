var Graph;

$(document).ready(function() {
  Graph = {
    questions: [],
    responses: [],

    questions_url: 'sample_data/questions.json',
    responses_url: 'sample_data/responses.json',

    getQuestions: function() {
      var graph = this;
      $.getJSON(graph.questions_url, function(question_data) {
        graph.questions = question_data;
      });
      return graph;
    },

    getResponses: function() {
      var graph = this;
      $.getJSON(graph.responses_url, function(response_data) {
        graph.responses = response_data;
      });
      return graph;
    }
  } 
});
