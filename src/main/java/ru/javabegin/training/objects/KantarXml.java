package ru.javabegin.training.objects;

import java.io.Serializable;

public class KantarXml implements Serializable {
    private String id;

    private String source;
    private String issue;
    private String date_issue;
    private String page;
    private String info;
    private String title;
    private String body;
    private String summary;
    private String pdf_url;
    private String order_id;
    private String country;
    private String date;

    public KantarXml() {
    }

    public KantarXml(String id, String source, String issue, String date_issue, String page, String info, String title, String body, String summary, String pdf_url, String order_id, String country, String date) {
        this.id = id;
        this.source = source;
        this.issue = issue;
        this.date_issue = date_issue;
        this.page = page;
        this.info = info;
        this.title = title;
        this.body = body;
        this.summary = summary;
        this.pdf_url = pdf_url;
        this.order_id = order_id;
        this.country = country;
        this.date = date;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }



    public String getIssue() {
        return issue;
    }

    public void setIssue(String issue) {
        this.issue = issue;
    }

    public String getDate_issue() {
        return date_issue;
    }

    public void setDate_issue(String date_issue) {
        this.date_issue = date_issue;
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getPdf_url() {
        return pdf_url;
    }

    public void setPdf_url(String pdf_url) {
        this.pdf_url = pdf_url;
    }




    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }



}




