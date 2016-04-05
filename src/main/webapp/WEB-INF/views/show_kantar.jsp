<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <link href="<c:url value="/resources/css/home.css" />" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>XMl Form</title>
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
<h2>Проверьте правильность введенных данных</h2>
<form:form method="post" action="xmlgen" modelAttribute="kantarXmlForm">


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
                <input id="xmls[${status.index}].date_issue" name="xmls[${status.index}].date_issue" value="${kantarXml.date_issue}" placeholder="24-02"/>


                <form:label for="xmls[${status.index}].page" path="xmls[${status.index}].page">page</form:label>
                <input id="xmls[${status.index}].page" name="xmls[${status.index}].page" value="${kantarXml.page}" placeholder="24"/>


                <form:label for="xmls[${status.index}].info" path="xmls[${status.index}].info">info</form:label>
                <input id="xmls[${status.index}].info" name="xmls[${status.index}].info" value="${kantarXml.info}"/>


                <form:label for="xmls[${status.index}].title" path="xmls[${status.index}].title">title</form:label>
                <input id="xmls[${status.index}].title" name="xmls[${status.index}].title" value="${kantarXml.title}"/>


                <form:label for="xmls[${status.index}].body" path="xmls[${status.index}].body">body</form:label>
                <input id="xmls[${status.index}].body" name="xmls[${status.index}].body" value="${kantarXml.body}" placeholder="body"/>


                <form:label for="xmls[${status.index}].summary" path="xmls[${status.index}].summary"></form:label>
                <input id="xmls[${status.index}].summary" name="xmls[${status.index}].summary" value="${kantarXml.summary}" cols="30" rows="3" required />


                <form:label for="xmls[${status.index}].pdf_url" path="xmls[${status.index}].pdf_url">pdf_url</form:label>
                <input id="xmls[${status.index}].pdf_url" name="xmls[${status.index}].pdf_url" value="${kantarXml.pdf_url}" placeholder="pdf_url" required/>

            </div>
        </div>

    </c:forEach>
<br/>
    <input type="submit" value="Generate XML" />
</form:form>
<input type="button" value="Back" onclick="javascript:history.back()"/>
</body>
</html>