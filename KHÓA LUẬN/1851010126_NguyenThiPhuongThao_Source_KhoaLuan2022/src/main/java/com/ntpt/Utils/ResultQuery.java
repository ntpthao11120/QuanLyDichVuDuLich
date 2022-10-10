/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ntpt.Utils;

/**
 *
 * @author ntpth
 */
public class ResultQuery {
    private Float timeTook;
    private Integer numberOfResults;
    private String elements;

    public ResultQuery() {
    }

    public ResultQuery(Float timeTook, Integer numberOfResults, String resultQuery) {
        this.timeTook = timeTook;
        this.numberOfResults = numberOfResults;
        this.elements = resultQuery;
    }

    public Float getTimeTook() {
        return timeTook;
    }

    public void setTimeTook(Float timeTook) {
        this.timeTook = timeTook;
    }

    public Integer getNumberOfResults() {
        return numberOfResults;
    }

    public void setNumberOfResults(Integer numberOfResults) {
        this.numberOfResults = numberOfResults;
    }

    public String getElements() {
        return elements;
    }

    public void setElements(String elements) {
        this.elements = elements;
    }
}
