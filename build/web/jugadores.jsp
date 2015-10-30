<%-- 
    Document   : jugadores
    Created on : 30-oct-2015, 11:26:47
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql_rt"%>

<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" 
    url="jdbc:oracle:thin:@localhost:1521:XE" user="system" password="javaoracle"/>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${param.nombre}</title>
    <style>
      body {
        font-family: Calibri, sans-serif;
        font-size: 16px;
      }
      table, thead, td {
        border: 1px solid black;
      }
      td {
        width: 50%;
      }
      td.link {
        text-align: center;
      }      
      table {
        margin: auto;
      }
    </style>
  </head>
  <body>
    <table>
      <thead>
        <tr><th colspan="2">JUGADORES DE PRIMERA DIVISION</th></tr>
        <tr>
          <th><img src="images/${param.escudo}"</th>
          <th><img src="images/${param.foto}"</th>
        </tr>
        <tr><th colspan="2">${param.nombre}</th></tr>
      </thead>
      <tbody>
        <sql:query var="jugadores">
          select nombre_jugador from jugadores where equipo_cod = ?
          <sql:param value="${param.equipo}"/>
        </sql:query>
        <c:set var="abre" value="${true}"/>
        <c:forEach items="${jugadores.rows}" var="jugador">
          <c:if test="${abre}"><tr></c:if>
          <td>${jugador.nombre_jugador}</td>
          <c:if test="${!abre}"></tr></c:if>
          <c:set var="abre" value="${!abre}"/>
        </c:forEach>
        <tr><td class="link" colspan="2"><a href="index.jsp">Volver</a></td></tr>
      </tbody>
    </table>
  </body>
</html>
