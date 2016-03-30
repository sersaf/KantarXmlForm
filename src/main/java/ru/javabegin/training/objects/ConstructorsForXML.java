package ru.javabegin.training.objects;


import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.*;
import javax.xml.transform.stream.*;
import org.w3c.dom.*;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

public class ConstructorsForXML {
    DocumentBuilder builder;

    public ConstructorsForXML(KantarXmlForm kantarXmlForm) throws TransformerException, IOException {
        ParamLangXML();  //Инициализация XML

        WriteParamXML(kantarXmlForm.getXmls()); // запись
    }

    public void ParamLangXML() {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        try { builder = factory.newDocumentBuilder(); }
        catch (ParserConfigurationException e) { e.printStackTrace(); }
    }
    /**
     * Запись настроек в XML файл
     */
    //<NEWS>
//<order_id>181914</order_id>
//<country>Russia</country>
//<date>18.03.2016</date>

//<Article>
//<id>mywatch</id>
//<source></source>
//<issue></issue>
//<date_issue>March 2016</date_issue>
//<page></page>
//<info></info>
//<title></title>
//<body></body>
//<summary></summary>
//<pdf_url>www_mywatch_1603-2.pdf</pdf_url>
//</Article>
//</NEWS>

    public void WriteParamXML(List<KantarXml> xmls) throws TransformerException, IOException {

        Document doc=builder.newDocument();
        Element RootElementNews = doc.createElement("NEWS");

        Element NameElementOrder_id = doc.createElement("order_id");
        NameElementOrder_id.appendChild(doc.createTextNode(xmls.get(0).getOrder_id()));
        RootElementNews.appendChild(NameElementOrder_id);

        Element NameElementCountry = doc.createElement("country");
        NameElementCountry.appendChild(doc.createTextNode(xmls.get(0).getCountry()));
        RootElementNews.appendChild(NameElementCountry);

        Element NameElementDate = doc.createElement("date");
        NameElementDate.appendChild(doc.createTextNode(xmls.get(0).getDate()));
        RootElementNews.appendChild(NameElementDate);

        for (KantarXml xml : xmls) {

//            Element RootElementArticle = doc.createElement("Article");

            Element NameElementId = doc.createElement("id");
            NameElementId.appendChild(doc.createTextNode(xml.getId()));
            RootElementNews.appendChild(NameElementId);

            Element NameElementCompile = doc.createElement("source");
            NameElementCompile.appendChild(doc.createTextNode(xml.getSource()));
            RootElementNews.appendChild(NameElementCompile);

            Element NameElementIssue = doc.createElement("issue");
            NameElementIssue.appendChild(doc.createTextNode(xml.getIssue()));
            RootElementNews.appendChild(NameElementIssue);

            Element NameElementDate_Issue = doc.createElement("date_issue");
            NameElementDate_Issue.appendChild(doc.createTextNode(xml.getDate_issue()));
            RootElementNews.appendChild(NameElementDate_Issue);

            Element NameElementPage = doc.createElement("page");
            NameElementPage.appendChild(doc.createTextNode(xml.getPage()));
            RootElementNews.appendChild(NameElementPage);

            Element NameElementInfo = doc.createElement("info");
            NameElementInfo.appendChild(doc.createTextNode(xml.getInfo()));
            RootElementNews.appendChild(NameElementInfo);

            Element NameElementTitle = doc.createElement("title");
            NameElementTitle.appendChild(doc.createTextNode(xml.getTitle()));
            RootElementNews.appendChild(NameElementTitle);

            Element NameElementBody = doc.createElement("body");
            NameElementBody.appendChild(doc.createTextNode(xml.getTitle()));
            RootElementNews.appendChild(NameElementBody);

            Element NameElementSummary = doc.createElement("summary");
            NameElementSummary.appendChild(doc.createTextNode(xml.getTitle()));
            RootElementNews.appendChild(NameElementSummary);

            Element NameElementPdf_Url = doc.createElement("pdf_url");
            NameElementPdf_Url.appendChild(doc.createTextNode(xml.getTitle()));
            RootElementNews.appendChild(NameElementPdf_Url);

//            doc.appendChild(RootElementArticle);
        }
        doc.appendChild(RootElementNews);

        SavetoFile(doc);

    }

    public void SavetoFile(Document doc) throws TransformerException, FileNotFoundException {
        Transformer t=TransformerFactory.newInstance().newTransformer();
        t.setOutputProperty(OutputKeys.METHOD, "xml");
        t.setOutputProperty(OutputKeys.INDENT, "yes");
        t.transform(new DOMSource(doc), new StreamResult(new FileOutputStream("/home/sersaf/proxy.xml")));
    }
}