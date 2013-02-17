$(document).ready(function() {
  (function buildDraggableForm() {
    var $questions
      , $survey_question_bucket
      , question_field_html;
 
    $questions = $('.question');  
    $survey_question_bucket = $('#survey_questions');

    question_field_html = "<div class='survey_question input-prepend'><button class='btn'>&times;</button><span class='input-xlarge uneditable-input'></span></div>";

    $questions.parents('tr').css( 'cursor', 'move' );

    $questions.draggable({
      appendTo: 'body',
      helper: 'clone',
      cursor: 'move'
    });

    $survey_question_bucket.droppable({
      accept: '.question',
      drop: function( event, ui ) {
        $( question_field_html )
          .children( 'span' )
          .text( ui.draggable.text() )
          .parent( 'div' )
          .appendTo( this );
      }
    }).on('click', '.survey_question button', function( event ) {
      event.preventDefault();
      $( this ).parents( '.survey_question' ).remove(); 
    });

  })();
});
