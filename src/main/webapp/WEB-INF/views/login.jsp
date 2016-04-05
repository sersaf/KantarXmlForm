<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="<c:url value="/resources/css/home.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-1.2.6.pack.js" />"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Kantar XML Form</title>
    <script type="text/javascript" src="<c:url value="/resources/js/script.js"/>"></script>

</head>

<body>


<form:form class="contact_form" method="post" action="save" modelAttribute="kantarXmlForm">

        <h2>Kantar XML Form</h2>
        <span class="required_notification">* Denotes Required Field</span>

        <div id="set">
                <form:label for="xmls[0].order_id" path="xmls[0].order_id">order_id</form:label>
                <input id="xmls[0].order_id" name="xmls[0].order_id" value="${kantarXmlForm.xmls[0].order_id}" type="text"  placeholder="181914" required />

                <form:label for="xmls[0].country" path="xmls[0].country">country</form:label>
                <input id="xmls[0].country" name="xmls[0].country" value="${kantarXmlForm.xmls[0].country}" type="text"  placeholder="Russia" required />

                <form:label for="xmls[0].date" path="xmls[0].date">date</form:label>
                <input id="xmls[0].date" name="xmls[0].date" id="date" value="${kantarXmlForm.xmls[0].date}" type="date"  placeholder="18.03.2016" required />
        </div>


        <c:forEach items="${kantarXmlForm.xmls}" var="kantarXml" varStatus="status">
        <div id="add_div">
            <div class="add_div">

                <p id="status.count"> ${status.count}</p>

               <form:label for="xmls[${status.index}].id" path="xmls[${status.index}].id">id</form:label>
               <input id="xmls[${status.index}].id" name="xmls[${status.index}].id" value="${kantarXml.id}" placeholder="123" required/>

                <form:label for="xmls[${status.index}].source" path="xmls[${status.index}].source">source</form:label>
                <input id="xmls[${status.index}].source" name="xmls[${status.index}].source" value="${kantarXml.source}" placeholder="Komersant"/>


                <form:label for="xmls[${status.index}].issue" path="xmls[${status.index}].issue">issue</form:label>
                <input id="xmls[${status.index}].issue" name="xmls[${status.index}].issue" value="${kantarXml.issue}" placeholder="4"/>


                <form:label for="xmls[${status.index}].date_issue" path="xmls[${status.index}].issue">date_issue</form:label>
                <input id="xmls[${status.index}].date_issue" name="xmls[${status.index}].date_issue" value="${kantarXml.date_issue}" style="width: 80px" placeholder="24-02"/>


                <form:label for="xmls[${status.index}].page" path="xmls[${status.index}].page">page</form:label>
                <input id="xmls[${status.index}].page" name="xmls[${status.index}].page" value="${kantarXml.page}" placeholder="24"/>


                <form:label for="xmls[${status.index}].info" path="xmls[${status.index}].info">info</form:label>
                <input id="xmls[${status.index}].info" name="xmls[${status.index}].info" value="${kantarXml.info}"/>


                <form:label for="xmls[${status.index}].title" path="xmls[${status.index}].title">title</form:label>
                <input id="xmls[${status.index}].title" name="xmls[${status.index}].title" value="${kantarXml.title}"/>


                <form:label for="xmls[${status.index}].body" path="xmls[${status.index}].body">body</form:label>
                <input id="xmls[${status.index}].body" name="xmls[${status.index}].body" value="${kantarXml.body}" placeholder="body"/>


                <form:label for="xmls[${status.index}].summary" path="xmls[${status.index}].summary"></form:label>
                <textarea id="xmls[${status.index}].summary" name="xmls[${status.index}].summary"  placeholder="summary" cols="30" rows="3" required >${kantarXml.summary}</textarea>


                <form:label for="xmls[${status.index}].pdf_url" path="xmls[${status.index}].pdf_url">pdf_url</form:label>
                <input id="xmls[${status.index}].pdf_url" name="xmls[${status.index}].pdf_url" value="${kantarXml.pdf_url}" placeholder="pdf_url" required/>


            </div>

            </div>


        </c:forEach>

    <br/>
    <input type="submit" value="Save" />
    <input type="button" value="Добавить поле" id="add" onclick="return addField()">
    <a href="#" onclick="return deleteField()" class="ico_delete"> <img src="<c:url value="/resources/img/delete.png"/>" alt="del" border="0"></a>
    <%--<a style="color:green;" onclick="return addField()" href="#">[+]</a>--%>


</form:form>

</body>

</html>


<%--<form:label path="id">id:</form:label>--%>
<%--<form:input path="id" />--%>
<%--<form:errors path="id" cssClass="error"/>--%>

<%--<form:label path="source">Password:</form:label>--%>
<%--<form:password path="source" />--%>
<%--<form:errors path="source" cssClass="error"/>--%>

<%--<form:label path="id">id:</form:label>--%>
<%--<form:input path="id" />--%>
<%--<form:errors path="id" cssClass="error"/>--%>

<%--<form:label path="source">Password:</form:label>--%>
<%--<form:password path="source" />--%>
<%--<form:errors path="source" cssClass="error"/>--%>