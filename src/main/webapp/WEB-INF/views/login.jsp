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
    <title>Insert title here</title>
</head>

<body>

<script type="text/javascript">
    var total = 3;
    function add_new_image(){
        total++;
        $('<tr>')
                .attr('id','tr_image_'+Fields())
                .css({lineHeight:'20px'})
                .append( $("<td align='center'>" +total +"</td>")
                        .attr('align','center')

                )
                .append (
                        $('<td>')
                                .attr('id','td_title_'+total)
                                .css({paddingRight:'5px',width:'126px'})
                                .append(
                                        $('<input type="text" />')
                                                .css({width:'126px'})
                                                .attr('id','input_title_'+total)
                                                .attr('name','xmls[' +(total-1) + '].id')

                                )
                )
                .append(
                        $('<td>')
                                .attr('id','td_title_'+total)
                                .css({paddingRight:'5px',width:'126px'})
                                .append(
                                        $('<input type="text" />')
                                                .css({width:'126px'})
                                                .attr('id','input_title_'+total)
                                                .attr('name','xmls[' +(total-1) + '].source')

                                )
                )

                .appendTo('#table_container');
    }
    $(document).ready(function() {
        add_new_image();
    });
    function Fields(){
        return total = table_container.rows.length;
    }
    function deleteField(){
        $('#tr_image_'+total).remove();
        total--;
    }

    function f(){
        var n1=document.getElementById('i1').value;
        var n2=document.getElementById('i2').value;
        document.getElementById('i3').value=Number(n1)*Number(n2);
    }

</script>




<form:form class="contact_form" method="post" action="save" modelAttribute="kantarXmlForm">

        <h2>Contact Us</h2>
        <span class="required_notification">* Denotes Required Field</span>

        <ul class="same">
            <li>
                <form:label path="xmls[0].order_id">order_id</form:label>
                <input name="xmls[0].order_id" value="${kantarXml.order_id}" type="text"  placeholder="181914" required />
            </li>
            <li>
                <form:label path="xmls[0].country">country</form:label>
                <input name="xmls[0].country" value="${kantarXml.country}" type="text"  placeholder="Russia" required />
            </li>
            <li>
                <form:label path="xmls[0].date">date</form:label>
                <input name="xmls[0].date" value="${kantarXml.date}" type="text"  placeholder="18.03.2016" required />
            </li>
        </ul>
    <table width="50%">
        <c:forEach items="${kantarXmlForm.xmls}" var="kantarXml" varStatus="status">
            <tr>

                ${status.count}
                <td> <input name="xmls[${status.index}].id" value="${kantarXml.id}" placeholder="John Doe" required/></td>
                <td><input name="xmls[${status.index}].source" value="${kantarXml.source}"/></td>
                <td><input name="xmls[${status.index}].issue" value="${kantarXml.issue}"/></td>
                <td><input name="xmls[${status.index}].date_issue" value="${kantarXml.date_issue}"/></td>
                <td><input name="xmls[${status.index}].page" value="${kantarXml.page}"/></td>
            </tr>
            <th>info</th>
            <th>title</th>
            <th>body</th>
            <th>summary</th>
            <th>pdf_url</th>
            <tr>
                <td><input name="xmls[${status.index}].info" value="${kantarXml.info}"/></td>
                <td><input name="xmls[${status.index}].title" value="${kantarXml.title}"/></td>
                <td><input name="xmls[${status.index}].body" value="${kantarXml.body}"/></td>
                <td><input name="xmls[${status.index}].summary" value="${kantarXml.summary}"/></td>
                <td><input name="xmls[${status.index}].pdf_url" value="${kantarXml.pdf_url}"/></td>
            </tr>

        </c:forEach>
    </table>
    <br/>
    <input type="submit" value="Save" />
    <input type="button" value="Добавить поле" id="add" onclick="return add_new_image();">
    <a href="#" onclick="deleteField();" class="ico_delete"> <img src="<c:url value="/resources/img/delete.png"/>" alt="del" border="0"></a>

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