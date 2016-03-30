<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>SETTINGS</h1>


<h1>Сколько файлов для загрузки? (max - 10)</h1>
<form:form method="POST" commandName="fields" action="set_settings"
           class="cd-form floating-labels">
    <fieldset class="boxBody">

        <form:select size="1" path="fields">
            <form:option value="1">1</form:option>
            <form:option value="2">2</form:option>
            <form:option value="3">3</form:option>
            <form:option value="4">4</form:option>
            <form:option value="5">5</form:option>
            <form:option value="6">6</form:option>
            <form:option value="7">7</form:option>
            <form:option value="8">8</form:option>
            <form:option value="9">9</form:option>
            <form:option value="10">10</form:option>
        </form:select>
        <p><input type="submit" value="Отправить"></p>

    </fieldset>

    <footer>


    </footer>


</form:form>
</body>
</html>
