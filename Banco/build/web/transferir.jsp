
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
            SELECT COUNT(*) as total FROM tb_contas
            WHERE IdConta = <c:out value='${param.sel_ContaOrigem}'/>
            AND ValorAtual >= <c:out value='${param.txt_Valor}'/>
        </sql:query>

        <c:if test="${resultConta.rows[0].total == 0}">
            <p>Saldo insuficiente!<p>
            </c:if>

            <c:choose>
                <c:when test="${resultConta.rows[0].total == 0}">
                <p>Saldo insuficiente na conta origem!<p>
                    <br />
                </c:when>
                <c:when test="${resultConta.rows[0].total > 0}">
                    <sql:update var="updateContaOrigem" dataSource="${bd}">
                        UPDATE tb_contas
                        SET ValorAtual = (ValorAtual-<c:out value='${param.txt_Valor}'/>)
                        WHERE IdConta = <c:out value='${param.sel_ContaOrigem}'/>
                    </sql:update>
                    <sql:update var="updateContaDestino" dataSource="${bd}">
                        UPDATE tb_contas
                        SET ValorAtual = (ValorAtual+<c:out value='${param.txt_Valor}'/>)
                        WHERE IdConta = <c:out value='${param.sel_ContaDestino}'/>
                    </sql:update>
                <p>Transferencia realizada com sucesso!<p>
                    <br />
                </c:when>
                <c:otherwise>
                    <br />
                </c:otherwise>
            </c:choose>
                    <a href="index.jsp">Voltar</a>
    </body>
</html>
