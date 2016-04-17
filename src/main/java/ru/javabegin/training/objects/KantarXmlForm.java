package ru.javabegin.training.objects;
import java.io.Serializable;
import java.util.List;

public class KantarXmlForm implements Serializable {

    private List<KantarXml> xmls;


    public List<KantarXml> getXmls() {
        return xmls;
    }

    public void setXmls(List<KantarXml> xmls) {
        this.xmls = xmls;
    }


}
