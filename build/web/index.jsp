<%-- 
    Document   : index
    Created on : 30-oct-2015, 11:02:32
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
    <title>1ª División</title>
    <style>
      body {
        font-family: Calibri, sans-serif;
        font-size: 16px;
      }
      table {
        margin: auto;
      }
      table, td {
        border: 1px solid black;
      }
      img, div {
        display: inline-block;
        vertical-align: middle;
      }
      div {
        width: 280px;
        float: right;
        border: 1px solid black;
      }
      a {
        text-decoration: none;
      }
      p {
        margin: 0.2em;
        padding: 0;
      }
    </style>
  </head>
  <body>
    <table>
      <thead>
        <tr><th colspan="3">EQUIPOS DE PRIMERA DIVISIÓN</th></tr>
      </thead>
      <tbody>
        <sql:query var="equipos">
          select equipo_cod, nombre, fundacion, presidente, foto_escudo, foto_equipo 
          from equipos order by nombre
        </sql:query>
        <c:set var="col" value="${0}"/>
        <c:forEach items="${equipos.rows}" var="equipo">
          <c:if test="${col == 0}"><tr></c:if>
          <td>
            <a href="jugadores.jsp?equipo=${equipo.equipo_cod}&nombre=${equipo.nombre}&escudo=${equipo.foto_escudo}&foto=${equipo.foto_equipo}">
              <img src="images/${equipo.foto_escudo}"/>
            </a>
            <div>
              <p>Nombre: ${equipo.nombre}</p>
              <p>Fundación: ${equipo.fundacion}</p>
              <p>Presidente: ${equipo.presidente}</p>
            </div>
          </td>
          <c:if test="${col == 2}"></tr></c:if>
          <c:set var="col" value="${(col + 1) % 3}"/>
        </c:forEach>
      </tbody>
    </table>
  </body>
</html>
