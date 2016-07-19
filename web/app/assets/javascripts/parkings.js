$(document).ready(function (){
  $('#btn-new-parking').on('click', function(){
    $.ajax({
      url: "../parkings/new",
      method: 'GET',
      dataType: 'html',
      success: function(data){
        $('#myModal').modal('show')
        $('#myModal .modal-title').text('Registrar Parqueo');
        $('#myModal .modal-body').html(data);
      }
    });
  });
  
  $('.btn-edit-parking').on('click', function(){
    var id = $(this).attr('data-id');
    $.ajax({
      url: "../parkings/"+id+"/edit",
      method: 'GET',
      dataType: 'html',
      success: function(data){
        $('#myModal').modal('show')
        $('#myModal .modal-title').text('Editar Parqueo');
        $('#myModal .modal-body').html(data);
      }
    })
  })
  
  $('.btn-delete-parking').on('click', function(){
    var $this = $(this);
    var id = $this.attr('data-id');
    if(confirm('¿Está seguro de eliminar este parqueo?')){
      $.ajax({
        url: "../parkings/"+id,
        method: 'DELETE',
        dataType: 'html',
        success: function(data){
          $this.parent().parent().remove();
        }
      })
    }
  });
})