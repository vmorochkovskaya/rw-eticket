<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 25.04.2017
  Time: 23:42
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title> <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
    <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">

</head>
<body>


<jsp:include page="locales.jsp"></jsp:include>
<jsp:include page="login.jsp"></jsp:include>

<ul id="breadcrumbs-one"><!-- Меню-->
    <li>   <form action="main" method="post"  name="startForm">
        <button> <spring:message code="start.page.main.button" /></button>
    </form></li>

    <li>
        <form action="passenger-services" method="post"  name="startForm">
            <button name="action" class="current" value="passenger-services-action" onclick="submit ()">
                <spring:message code="start.page.forpassages.button" />
            </button>
            <!--На  passangerservices.jsp-->
        </form>
    </li>

    <li>
        <form method="post"   action="private-office">
            <button   name = "Submit" onclick="submit ()" value = "">
                <spring:message code="start.page.account.button" />
            </button>
        </form>
    </li>


    <li>
        <form method="post"   action="about-us"><!--О нас-->
            <button name = "Submit"  onclick="submit ()" value = "" >
                <spring:message code="start.page.aboutUs.button" />
            </button>
        </form>
    </li>

    <li>
        <form method="post"   action="feedbacks"><!--Отзывы -->
            <button name = "Submit"  onclick="submit ()" value = "" >
                <spring:message code="start.page.feedbacks.button" />&nbsp; ${sessionScope.colFeedbacks}
            </button>
        </form>
    </li>
</ul>
<br/>
<br/>
<br/>
<br/>
<form action="leave-feedback" method="post" id="leaveFId">
<h4>Введите текст отзыва</h4>
    <textarea name="feedback"></textarea>
    <input type = "submit" name = "Submit" value = "Отправить"/>
</form>
</body>
</html>
