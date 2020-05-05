<%-- 
    Document   : index
    Created on : 05/05/2020, 03:01:11 PM
    Author     : Aimar Berrocal Coaquira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SOAP Practice - Berrocal</title>
        <link rel="icon" type="image/png" href="img/icon.png" />
        <link rel="stylesheet" href="https://bootswatch.com/4/superhero/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/8719a7912f.js" crossorigin="anonymous"></script>
        <link href="css/codemirror.css" rel="stylesheet" type="text/css"/>
        <link href="css/ayu-mirage.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-primary">
            <span class="navbar-brand">SOAP - CRUD CLIENTE - NO DATABASE</span>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="https://github.com/aimarandony/my-first-soap" target="_blank"><i class="fab fa-github pr-1"></i> GITHUB</a>
                </li>
                <li class="nav-item active">
                    <span class="nav-link"><i class="fas fa-fire pr-1"></i> Aimar Berrocal</span>
                </li>
            </ul>
        </nav>
        <div class="container my-5">
            <div class="card">
                <div class="card-body">
                    <table class="table table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th colspan="2">Información</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="default">
                                <th>Address:</th>
                                <td>
                                    <a href="http://localhost:8084/SoapPractice/ClientService" target="_blank">
                                        http://localhost:8084/SoapPractice/ClientService
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <th>WSDL:</th>
                                <td>
                                    <a href="http://localhost:8084/SoapPractice/ClientService?wsdl" target="_blank">
                                        http://localhost:8084/SoapPractice/ClientService?wsdl
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <th>Implementation class:</th>
                                <td>com.soap.services.ClientService</td>
                            </tr>
                        </tbody>
                    </table> 
                </div>
            </div>

            <hr>
            
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <table class="table table-hover">
                                <thead class="thead-dark">
                                    <tr>
                                        <th colspan="2">Variables Usadas</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="default">
                                        <th>list</th>
                                        <td>
                                            ArrayList<Client> list = new ArrayList<>();
                                    </td>
                                    </tr>
                                    <tr>
                                        <th>countId</th>
                                        <td>
                                            int countId = 0;
                                        </td>
                                    </tr>
                                    </tbody>
                            </table> 
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-6 col-sm-12 mt-3">
                    <div class="card">
                        <div class="card-header">
                            ◘ Método 01: Para obtener el index de mi ArrayList por el id.
                        </div>
                        <div class="card-body">
                            <textarea class="txtarea" name="txtArea01">
@WebMethod(operationName = "method01")
public int findIndexOfId(int id){
    for (int i = 0; i < list.size(); i++) {
        if(id == list.get(i).getId()){
            return i;
        }
    }
    return -1;
}
                            </textarea>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12 mt-3">
                    <div class="card">
                        <div class="card-header">
                            ◘ Método 02: Para llenar mi ArrayList con 3 Clientes
                        </div>
                        <div class="card-body">
                            <textarea class="txtarea" name="txtArea01">
@WebMethod(operationName = "method02")
public String fillList() {
    if (list.isEmpty()) {
        list.add(new Client(1, "Lucas", "Kingston", "78495612"));
        list.add(new Client(2, "Marcos", "Tulio", "76451245"));
        list.add(new Client(3, "Joel", "Llano", "78579484"));
        countId = 3;
    }
    return "Metodo para llenar la lista de Clientes.";
}
                            </textarea>
                        </div>
                    </div>
                </div>
            </div>
            
            <hr>
            
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div class="card">
                        <div class="card-header">
                            ◘ Obtener todos los Clientes
                        </div>
                        <div class="card-body">
                            <textarea class="txtarea" name="txtArea01">
@WebMethod(operationName = "findAll")
public ArrayList<Client> findAll() {
    fillList();
    return list;
}
                            </textarea>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="card">
                        <div class="card-header">
                            ◘ Obtener un Cliente por su id
                        </div>
                        <div class="card-body">
                            <textarea class="txtarea" name="txtArea01">
@WebMethod(operationName = "findById")
public Client findById(@WebParam(name = "id") int id) {
    fillList();
    Client client = list.get(findIndexOfId(id));
    return client;
}
                            </textarea>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 col-sm-12 mt-3">
                    <div class="card">
                        <div class="card-header">
                            ◘ Crear un nuevo Cliente
                        </div>
                        <div class="card-body">
                            <textarea class="txtarea" name="txtArea01">
@WebMethod(operationName = "create")
public Client create(@WebParam(name = "client") Client client) {
    fillList();
    client.setId(countId + 1);
    list.add(client);
    ++ countId;
    return client;
}
                            </textarea>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12 mt-3">
                    <div class="card">
                        <div class="card-header">
                            ◘ Actualizar un Cliente por su id
                        </div>
                        <div class="card-body">
                            <textarea class="txtarea" name="txtArea01">
@WebMethod(operationName = "update")
public Client update(@WebParam(name = "client") Client client){
    fillList();
    list.set(findIndexOfId(client.getId()), client);
    Client updatedClient = list.get(findIndexOfId(client.getId()));
    return updatedClient;
}
                            </textarea>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 col-sm-12 mt-3">
                    <div class="card">
                        <div class="card-header">
                            ◘ Eliminar un Cliente por su id
                        </div>
                        <div class="card-body">
                            <textarea class="txtarea" name="txtArea01">
@WebMethod(operationName = "delete")
public String delete(@WebParam(name = "id") int id){
    fillList();
    Client client = list.get(findIndexOfId(id));
    list.remove(findIndexOfId(id));
    return "El Cliente " + client.getName() + " se ha eliminado correctamente.";
}
                            </textarea>
                        </div>
                    </div>
                </div>
            </div>

            
        </div>
        <script src="js/codemirror.js" type="text/javascript"></script>
        <script src="js/mode-clike.js" type="text/javascript"></script>
        <script>

            var txtarea = document.getElementsByClassName("txtarea");

            for (var item of txtarea) {
                var editor = CodeMirror.fromTextArea(item, {
                    // muestro las líneas de código
                    lineNumbers: true,
                    // elijo el tema
                    theme: 'ayu-mirage',
                    // esto deshabilita la opción de reescribir
                    readOnly: true,

                    mode: "text/x-java"
                });
            }

        </script>
    </body>
</html>