$(document).ready(function(){
  $('#rejection').on('click', function(){
    var matchId = $(this).data().id

    $.ajax({
      method: 'DELETE',
      url: '/relationships/' + matchId
    });

    slideLeft();
  });

  $('#acceptance').on('click', function(){
    var matchId = $(this).data().id

    $.ajax({
      method: 'POST',
      url: 'relationships',
      data: { matchInfo: { match: matchId } }
    });
  });

  function slideLeft(){
    $('#match-info').animate({ left: '-50%' }, 500);
  }
});
