/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

      $(document).ready(function(){ 

        var table = $("#the_table").dataTable({ 
          "processing":true,
          "serverSide":true,
          "scrollX":true,
          "scrollColapse":true,
          "columns": [
              { "width": "10%"},
              { "width": "35%"},
              { "width": "25%"},
              { "width": "5%"},
              { "width": "5%"},
              { "width": "20%"},
              { "width": "5%"}
          ],
          "ajax": "./include/getFactura.php"
        }); 
        new $.fn.dataTable.FixedColumns( table, {
            leftColumns: 1
        } );
        $('#the_table tbody').on( 'click', 'tr', function () {
            $(this).toggleClass('selected');
        } );
 /*
        $('#button').click( function () {
            $( ".selected" ).each(function( index ) {
            console.log( index + ": " + $( this ).text() );
            $(this).find('td').each(function( columna )
            {
                console.log( columna + " : dato :") + $( this );
            });
            });
        } );
        */
       $("#button").click( function() 
       {
           var total = 0;
           var pasa = '{ "Facturas": [ ';
           $(".selected").map( function()
           {
               var $fila = $(this);
               var numero = $fila.find(':nth-child(1)').text();
               pasa += '{"Numero":"' + numero + '",';
               var cliente = $fila.find(':nth-child(2)').text();
               pasa += '"Cliente":"' + cliente + '",';
               var valor = $fila.find(':nth-child(6)').text();
               total = total + parseFloat(valor);
               pasa += '"Valor":"' + valor + '"},';
               console.log( "Factura: " + numero + " Cliente: " + cliente + " Acumulado Ventas: " + total);
           }).get();
            pasa = pasa.substring(0, pasa.length-1);
            pasa += ']}';
//            alert("Este es para JSON: " + pasa);
//            var jsonString = JSON.stringify(pasa);
//            alert("Este es para JSON: " + jsonString);
            
           $.ajax(
                   {
                    "url":"./include/selecFactura.php",
                    "type":"POST",
                    "data":pasa,
                    "dataType":"text",
//                    "contentType": "application/json; charset=UTF-8",
                    "beforeSend": function(){
//                        alert("Este es para JSON: " + pasa);
                    },
/*      code to run if the request succeeds;
        the response is passed to the function
*/
                    success: function( json ) {
                    $( "<h1/>" ).text( json.title ).appendTo( "body" );
                    $( "<div class=\"content\"/>").html( json.html ).appendTo( "body" );
                    },
 /*
  *     code to run if the request fails; the raw request and
  *     status codes are passed to the function
  */ 

                    error: function( xhr, status, errorThrown ) {
                    alert( "Sorry, there was a problem!" );
                    console.log( "Error: " + errorThrown );
                    console.log( "Status: " + status );
                    console.dir( xhr );
                    },
 
/*
 *      code to run regardless of success or failure
 */
                    complete: function( xhr, status ) {
                    alert( "The request is complete!" );
                    }
                   });
       });
      }); 
 
