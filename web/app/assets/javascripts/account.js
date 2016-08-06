$(document).ready(function(){
  
  // Cambio de listado por opcion en menu
  $('#div-account .list-group-item').on('click', function(){
    $('#div-account .list-group-item').removeClass('active');
    $(this).addClass('active');
    var id = $(this).attr('data-id');
    $('#div-account .panel').addClass('hidden');
    $('#'+id).removeClass('hidden');
  });
  
  $('.btn-disable-parking').on('click', function(){
    var $this = $(this);
    var id = $(this).attr('data-id');
    $.ajax({
      url: "../parkings/disabled",
      method: 'POST',
      dataType: 'html',
      data: {id: id},
      success: function(data){
        if( $this.parent().parent().hasClass('warning') ){
          $this.parent().parent().removeClass('warning');
        }else{
          $this.parent().parent().addClass('warning');
        }
      }
    });
  });

  $('.btn-delete-rentals').on('click', function(){
    var $this = $(this);
    var id = $this.attr('data-id');
    $.ajax({
      url: "../rentals/"+id,
      method: 'DELETE',
      dataType: 'html',
      success: function(data){
        $this.parent().parent().remove();
        $('#rentals-cant').html( $('#rentals-cant').html()-1 );
      }
    });
  });

  // Nuevo parking
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
  
  // Editar Parking
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
    });
  });
  
  // Eliminar Parking
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
          $('#parking-cant').html( $('#parking-cant').html()-1 );
        }
      });
    }
  });
  
  // Eliminar favorito
  $('.btn-delete-favorite').on('click', function(){
    var $this = $(this);
    var id = $this.attr('data-id');
    if(confirm('¿Está seguro de quitarlo de sus favoritos?')){
      $.ajax({
        url: '../favorites/'+id,
        method: 'DELETE',
        datatype: 'html',
        success: function(data){
          $this.parent().parent().remove();
          $('#favorite-cant').html( $('#favorite-cant').html()-1 );
        }
      });
    }
  });
  
});