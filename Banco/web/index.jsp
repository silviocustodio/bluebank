
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Bem Vindo!</title>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link href="estilo.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>

        <sql:setDataSource var="bd" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/bd_bancomundo"
                           user="root"  password=""/>
        
        <sql:query dataSource="${bd}" var="resultConta">
            SELECT IdConta FROM tb_contas
        </sql:query>
            
            <form action="transferir.jsp" method="POST">
        <div class="container">
            <div class="container-conta">
                <div class="container-conta-item">
                    <p>Conta origem</p>
                    <select name="sel_ContaOrigem">
                        <c:forEach var="rowConta" items="${resultConta.rows}">
                            <option value="<c:out value="${rowConta.IdConta}"/>">Conta <c:out value="${rowConta.IdConta}"/></option>
                        </c:forEach>
                    </select>
                </div>
                <div class="container-conta-item">
                    <p>Conta destino</p>
                    <select name="sel_ContaDestino">
                        <c:forEach var="rowConta" items="${resultConta.rows}">
                            <option value="<c:out value="${rowConta.IdConta}"/>">Conta <c:out value="${rowConta.IdConta}"/></option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="container-transf">
                <h3>Valor a ser transferido</h3>
                <input type="text" name="txt_Valor" />
                <input type="submit" value="Transferir!" />
            </div>

        </div>
            
            
                
            </form>

    </body>
</html>
