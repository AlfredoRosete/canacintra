 
 $(document).ready(function(){    
    $('#btn-guardar').click(function(){        
        /*Captura de datos escrito en los inputs*/        
   
 
 var nom = document.getElementById("nombre_completo").value;
 var departamento = document.getElementById("departamento").value;
 var empresa = document.getElementById("empresa").value;

 alert(nom,departamento,empresa);

        /*Guardando los datos en el LocalStorage
        localStorage.setItem("Nombre", nom);
        localStorage.setItem("Apellido", apel);*/
        /*Limpiando los campos o inputs
        document.getElementById("nombretxt").value = "";
        document.getElementById("apellidotxt").value = "";*/
    });   
});
