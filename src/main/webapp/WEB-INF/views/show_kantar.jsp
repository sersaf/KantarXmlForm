<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <link href="<c:url value="/resources/css/home.css" />" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Spring 3 MVC Multipe Row Submit - viralpatel.net</title>
</head>
<body>
<h2>Show xml</h2>
<form:form method="post" action="xmlgen" modelAttribute="kantarXmlForm">

<table width="50%">
    <tr>
        <th>order_id</th>
        <th>country</th>
        <th>date</th>
    </tr>
<tr>
    <td><input name="xmls[0].order_id" value="${kantarXmlForm.xmls[0].order_id}"/></td>
    <td><input name="xmls[0].country" value="${kantarXmlForm.xmls[0].order_id}"/></td>
    <td><input name="xmls[0].date" value="${kantarXmlForm.xmls[0].order_id}"/></td>
</tr>

    <tr>
        <th>No.</th>
        <th>id</th>
        <th>source</th>
        <th>issue</th>
        <th>date_issue</th>
        <th>page</th>
    </tr>

    <c:forEach items="${kantarXmlForm.xmls}" var="kantarXml" varStatus="status">
        <tr>

            <td align="center">${status.count}</td>
            <td><input readonly name="xmls[${status.index}].id" value="${kantarXml.id}"/></td>
            <td><input readonly name="xmls[${status.index}].source" value="${kantarXml.source}"/></td>
            <td><input readonly name="xmls[${status.index}].issue" value="${kantarXml.issue}"/></td>
            <td><input readonly name="xmls[${status.index}].date_issue" value="${kantarXml.date_issue}"/></td>
            <td><input readonly name="xmls[${status.index}].page" value="${kantarXml.page}"/></td>
        </tr>
        <th>info</th>
        <th>title</th>
        <th>body</th>
        <th>summary</th>
        <th>pdf_url</th>
         <tr>
            <td><input readonly name="xmls[${status.index}].info" value="${kantarXml.info}"/></td>
            <td><input readonly name="xmls[${status.index}].title" value="${kantarXml.title}"/></td>
            <td><input readonly name="xmls[${status.index}].body" value="${kantarXml.body}"/></td>
            <td><input readonly name="xmls[${status.index}].summary" value="${kantarXml.summary}"/></td>
            <td><input readonly name="xmls[${status.index}].pdf_url" value="${kantarXml.pdf_url}"/></td>
            </tr>

    </c:forEach>
</table>
<br/>
    <input type="submit" value="Generate XML" />
    <input type="button" value="Back" onclick="javascript:history.back()"/>
</form:form>
</body>
</html>