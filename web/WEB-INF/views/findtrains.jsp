<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 14.03.2017
  Time: 00:36
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Поезда</title>
    <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
    <script src="js/main.js"></script>
    <script>
        window.onload=function(){
            if(document.getElementsByName("sort")[0].disabled==true){
                document.getElementsByName("sort")[0].checked=true;
            }
            else if(document.getElementsByName("sort")[1].disabled==true){
                document.getElementsByName("sort")[1].checked=true;
            }
        }
    </script>
</head>
<body>
<form method="post" action="trains-info" id="myForm">

    ${ sessionScope.trainParam.department }
    <br>
    ${ sessionScope.trainParam.arrive }
        <br>
        ${ sessionScope.trainParam.date }

    <table>
        <th>Номер поезда</th>
        <th>Маршрут</th>
        <th>Время отправления</th>
        <th>Время прибытия</th>
        <th>Время в пути</th>
        <th>Количество свободных мест</th>
        <c:forEach var="trains" items="${trains}" varStatus="status">
        <tr>
            <td>  <c:out value="${ trains.number }" /></td>
            <td>  <button name="middlestations"    class ="href" value="${trains.idTrain}" onClick="document.getElementById('myForm').submit()" >${trains.nameTrain}</button></td>
            <td><c:out value="${ trains.timeDeparture }" /></td>
            <td> <c:out value="${ trains.timeArrive }" /></td>
            <td> <c:out value="${ trains.travelTime }" /></td>
            <td> <c:out value="${ trains.numberOfAvailSeats }" /></td>
            <td > <input type="radio" onclick="javascript: submit()" name="idTrain"  value="${trains.idTrain}" /> </td>
            </c:forEach>
        </tr>

    </table>
    <input type="hidden" name="action" value="find-carriages-action" >
</form>

<form action="trains-sort" method="post">
<c:choose>
    <c:when test="${requestScope.checkbox != null}">
    <c:choose>
        <c:when test="${requestScope.checkbox=='sortTimeDep'}">
            <input type="radio"  name="sort"  value="sorttimetravel" onclick="javascript: submit()" >
           Сортировать по времени в пути
            <input type="radio" name="sort" disabled value="sorttimedeparture" onclick="javascript: submit()" >
            Сортировать по времени отправления
        </c:when>
        <c:when test="${requestScope.checkbox=='sortTimeTravel'}">
            <input type="radio"  name="sort" disabled value="sorttimetravel" onclick="javascript: submit()" >
           Сортировать по времени в пути
            <input type="radio" name="sort"  value="sorttimedeparture" onclick="javascript: submit()" >
          Сортировать по времени отправления
        </c:when>
    </c:choose>
    </c:when>
    <c:otherwise>
        <input type="radio"  name="sort"  value="sorttimetravel" onclick="javascript: submit()" >
     Сортировать по времени в пути
        <input type="radio" name="sort"  value="sorttimedeparture" onclick="javascript: submit()" >
     Сортировать по времени отправления
    </c:otherwise>
</c:choose>


<input type="hidden"  name="action"  value="sotr-trains-action">
    <input type="hidden"   name="date" value="${sessionScope.trainParam.date}">
    <input type="hidden" name="stationdeparture" value="${sessionScope.trainParam.department}">
    <input type="hidden" name="stationarrive" value="${sessionScope.trainParam.arrive}">
    <!--INPUT TYPE="RESET" onclick="resetform()" VALUE ="Сбросить"-->
</form>

</body>
</html>
