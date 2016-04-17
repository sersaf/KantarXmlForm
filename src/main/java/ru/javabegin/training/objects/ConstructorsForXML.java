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

    public void WriteParamXML(List<KantarXml> xmls) throws TransformerException, IOException {

        Document doc=builder.newDocument();
        Element RootElementNews = doc.createElement("NEWS");
        doc.appendChild(RootElementNews);

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

            Element RootElementArticle = doc.createElement("Article");
            RootElementNews.appendChild(RootElementArticle);

            Element NameElementId = doc.createElement("id");
            NameElementId.appendChild(doc.createTextNode(xml.getId()));
            RootElementArticle.appendChild(NameElementId);

            Element NameElementCompile = doc.createElement("source");
            NameElementCompile.appendChild(doc.createTextNode(xml.getSource()));
            RootElementArticle.appendChild(NameElementCompile);

            Element NameElementIssue = doc.createElement("issue");
            NameElementIssue.appendChild(doc.createTextNode(xml.getIssue()));
            RootElementArticle.appendChild(NameElementIssue);

            Element NameElementDate_Issue = doc.createElement("date_issue");
            NameElementDate_Issue.appendChild(doc.createTextNode(xml.getDate_issue()));
            RootElementArticle.appendChild(NameElementDate_Issue);

            Element NameElementPage = doc.createElement("page");
            NameElementPage.appendChild(doc.createTextNode(xml.getPage()));
            RootElementArticle.appendChild(NameElementPage);

            Element NameElementInfo = doc.createElement("info");
            NameElementInfo.appendChild(doc.createTextNode(xml.getInfo()));
            RootElementArticle.appendChild(NameElementInfo);

            Element NameElementTitle = doc.createElement("title");
            NameElementTitle.appendChild(doc.createTextNode(xml.getTitle()));
            RootElementArticle.appendChild(NameElementTitle);

            Element NameElementBody = doc.createElement("body");
            NameElementBody.appendChild(doc.createTextNode(xml.getTitle()));
            RootElementArticle.appendChild(NameElementBody);

            Element NameElementSummary = doc.createElement("summary");
            NameElementSummary.appendChild(doc.createTextNode(xml.getTitle()));
            RootElementArticle.appendChild(NameElementSummary);

            Element NameElementPdf_Url = doc.createElement("pdf_url");
            NameElementPdf_Url.appendChild(doc.createTextNode(xml.getTitle()));
            RootElementArticle.appendChild(NameElementPdf_Url);

        }

        SavetoFile(doc);

    }

    public void SavetoFile(Document doc) throws TransformerException, FileNotFoundException {
        Transformer t=TransformerFactory.newInstance().newTransformer();
        t.setOutputProperty(OutputKeys.METHOD, "xml");
        t.setOutputProperty(OutputKeys.INDENT, "yes");
//        t.transform(new DOMSource(doc), new StreamResult(new FileOutputStream("/Users/sergejsafonov/proxy.xml")));
        t.transform(new DOMSource(doc), new StreamResult(new FileOutputStream("/home/sersaf/Rolex_.xml")));
    }
}