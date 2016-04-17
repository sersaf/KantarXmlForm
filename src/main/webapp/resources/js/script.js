var countOfFields = 0; // Текущее число полей
var curFieldNameId = 0; // Уникальное значение для атрибута name
var maxFieldLimit = 25; // Максимальное число возможных полей



  function addField() {
    // Проверяем, не достигло ли число полей максимума
    if (countOfFields >= maxFieldLimit) {
        alert("Число полей достигло своего максимума = " + maxFieldLimit);
        return false;
    }
    // Увеличиваем текущее значение числа полей
    countOfFields++;
    // Увеличиваем ID
    curFieldNameId++;
      var id = curFieldNameId +1;
    // Создаем элемент ДИВ
    var div = document.createElement("div");
      div.className = "add_div";
      div.id = "div" + id;
    // Добавляем HTML-контент с пом. свойства innerHTML



    newitem ='<p id=\"status.count\">' + id + '</p>';

    newitem +='<label for=\"xmls[' + curFieldNameId + '].id\" path=\"xmls[' + curFieldNameId + '].id\">id</label>';
    newitem += '<input id=\"xmls[' + curFieldNameId + '].id\" name=\"xmls[' + curFieldNameId + '].id\" placeholder=\"123\" required />';

    newitem +='<label for=\"xmls[' + curFieldNameId + '].source\" path=\"xmls[' + curFieldNameId + '].source\">source</label>';
    newitem += '<input id=\"xmls[' + curFieldNameId + '].source\" name=\"xmls[' + curFieldNameId + '].source\" placeholder=\"komersant\" />';

    newitem +='<label for=\"xmls[' + curFieldNameId + '].issue\" path=\"xmls[' + curFieldNameId + '].issue\">issue</label>';
    newitem += '<input id=\"xmls[' + curFieldNameId + '].issue\" name=\"xmls[' + curFieldNameId + '].issue\" placeholder=\"4\" />';

    newitem +='<label for=\"xmls[' + curFieldNameId + '].date_issue\" path=\"xmls[' + curFieldNameId + '].date_issue\">date_issue</label>';
    newitem += '<input id=\"xmls[' + curFieldNameId + '].date_issue\" name=\"xmls[' + curFieldNameId + '].date_issue\" placeholder=\"24-02\" />';

    newitem +='<label for=\"xmls[' + curFieldNameId + '].page\" path=\"xmls[' + curFieldNameId + '].page\">page</label>';
    newitem += '<input id=\"xmls[' + curFieldNameId + '].page\" name=\"xmls[' + curFieldNameId + '].page\" placeholder=\"24\"  />';

    newitem +='<label for=\"xmls[' + curFieldNameId + '].info\" path=\"xmls[' + curFieldNameId + '].info\">info</label>';
    newitem += '<input id=\"xmls[' + curFieldNameId + '].info\" name=\"xmls[' + curFieldNameId + '].info\"   />';

    newitem +='<label for=\"xmls[' + curFieldNameId + '].title\" path=\"xmls[' + curFieldNameId + '].title\">title</label>';
    newitem += '<input id=\"xmls[' + curFieldNameId + '].title\" name=\"xmls[' + curFieldNameId + '].title\"   />';

    newitem +='<label for=\"xmls[' + curFieldNameId + '].body\" path=\"xmls[' + curFieldNameId + '].body\">body</label>';
    newitem += '<input id=\"xmls[' + curFieldNameId + '].body\" name=\"xmls[' + curFieldNameId + '].body\" placeholder=\"body\" />';

    newitem +='<label for=\"xmls[' + curFieldNameId + '].summary\" path=\"xmls[' + curFieldNameId + '].summary\"></label>';
    newitem += '<textarea id=\"xmls[' + curFieldNameId + '].summary\" name=\"xmls[' + curFieldNameId + '].summary\" cols=\"30\" rows=\"3\" placeholder=\"summary\" ></textarea>';

    newitem +='<label for=\"xmls[' + curFieldNameId + '].pdf_url\" path=\"xmls[' + curFieldNameId + '].pdf_url\">pdf_url</label>';
    newitem += '<input id=\"xmls[' + curFieldNameId + '].pdf_url\" name=\"xmls[' + curFieldNameId + '].pdf_url\" placeholder=\"pdf_url\" required />';



      div.innerHTML += newitem;
    // Добавляем новый узел в конец списка полей
    document.getElementById("add_div").appendChild(div);

      // Возвращаем false, чтобы не было перехода по сслыке
    return false;
}


function deleteField() {
    // Получаем доступ к ДИВу, содержащему поле
    var id = curFieldNameId+1;
    var div = document.getElementById("div"+id);
    alert("Вы учерены что хотите удалить последнее поле?");
    var contDiv = div.parentNode;
    // Удаляем этот ДИВ из DOM-дерева
    contDiv.removeChild(div);
    // Уменьшаем значение текущего числа полей
    countOfFields--;
    curFieldNameId--;
    // Возвращаем false, чтобы не было перехода по сслыке
    return false;
}