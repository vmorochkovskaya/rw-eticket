<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Вход в систему</title>
    <link rel='stylesheet' type='text/css' href="<c:url value="/resources/css/style.css"/> ">
</head>

<jsp:include page="locales.jsp"></jsp:include>
<jsp:include page="login.jsp"></jsp:include>


<ul id="breadcrumbs-one"><!-- Меню-->
    <li>   <form action="main" method="post"  name="startForm">
        <button> <spring:message code="start.page.main.button" /></button>
    </form></li>

    <li>
        <form action="passenger-services" method="post"  name="startForm">
            <button name="action"  value="passenger-services-action" onclick="submit ()">
                <spring:message code="start.page.forpassages.button" />
            </button>
            <!--На  passangerservices.jsp-->
        </form>
    </li>

    <li>
        <form method="post"   action="private-office">
            <button name = "Submit" onclick="submit ()" value = "">
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
<form:form modelAttribute="user"  name="f1" method="post" action="authorisation">

    <c:if test="${requestScope.login_attr!=null}">
        <span class="error">
          <img src="<c:url value="/resources/images/attention_login.png" />"alt="Картинка">&nbsp;
         <spring:message code="auth_reg.page.error.label" />  </span>
    </c:if>
    <br />
    <spring:message code="auth_reg.page.login.label" />: <br />
        <form:input path="login" size="25" maxlength="30" value="" /> <br />
        <form:errors path="login" cssClass="error"/>
    <br />

    <spring:message code="auth_reg.page.password.label" />: <br />
        <form:password path="password"  size="25" maxlength="30" value="" /> <br />
    <form:errors path="password" cssClass="error"/>
    <br />
    <input name="remember" type="checkbox" value="yes" /><spring:message code="auth_reg.page.remember.label" />  <br />
    <br />
    <input type="submit" name="enter" value="<spring:message code="auth_reg.page.enter.label" />" />
    </form:form>
</body>
</html>
