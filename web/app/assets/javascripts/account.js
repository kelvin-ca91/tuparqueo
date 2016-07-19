$(document).ready(function(){
  $('#div-account .list-group-item').on('click', function(){
    $('#div-account .list-group-item').removeClass('active');
    $(this).addClass('active');
    var id = $(this).attr('data-id');
    $('#div-account .panel').addClass('hidden');
    $('#'+id).removeClass('hidden');
    
  })
});