<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 16.04.2017
  Time: 02:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Уведомление о возврате</title>
    <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
</head>
<body>
<jsp:include page="locales.jsp"></jsp:include>
<jsp:include page="login.jsp"></jsp:include>


<div class="menu">
    <form action="passenger-services" method="post"  name="startForm">
        <button name="action"  value="passenger-services-action" onclick="submit ()">
            <spring:message code="start.page.forpassages.button" />
        </button>
        <!--На  passangerservices.jsp-->
    </form>

    <form method="post"   action="private-office">
        <input type = "submit" name = "Submit" value = " <spring:message code="start.page.account.button" />" >
    </form>



    <form method="post"   action="about-us"><!--О нас-->
        <input type = "submit" name = "Submit" value = " <spring:message code="start.page.aboutUs.button" />" >
    </form>
</div>


<form method="post"   action="feedbacks"><!--Отзывы -->
    <input type = "submit" name = "Submit" value = " <spring:message code="start.page.feedbacks.button" />" >
</form>
</div>
<spring:message code="returnNotice.page.text1" /> ${requestScope.ticketNumber} <spring:message code="returnNotice.page.text2" />.
<spring:message code="returnNotice.page.text3" /> ${ user.email} <spring:message code="returnNotice.page.text4" />
</body>
</html>
