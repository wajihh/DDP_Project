
Developing Data Products Project
================================

This document explains the Developing Data Products course Project. An application has been developed using shiny package which plots  Normal and Uniform probablity distributions on a webpage using simple interactive widgets.

## Introduction

This application is very helpful for anyone interested in understanding the different kinds of Probality Distrubutions used in analysis of data and the effects of changing some parameters of the given data.

The dataset used for calculations is the Rstudio built in dataset which is called by the library function in shiny server.

The following script files perform the required functions:

* ui.R
* server.R

On running the above files in Rstudio a webpage is created showing the input selections and corresponding results.How to use this webpage is explained below. The links to the deployed webpage are also provided.

## Webpage Side Bar Panel

The inputs are provided in the following way:

* Buttons are used for selection of the Distribution type.
* Slide Bar is used to choose the sample size.
* Boxes are built for Input of required  statistical parameters such as Mean, standard deviation,etc
* A box is used to overlay density curve on histogram displaed in main panel. 

## Webpage Main Panel 

The output based on script functions is obtained using the following three tabs of the main panel: 

* Plot
* Summary 
* Table

When the plot tab is pressed a histogram of Observations vs Density apperas. A density curve can be overlaid on the histogram by inserting a check mark in side bar panel.Selecting the Summary tab provides the summary of statistical values and the table ouputs all the data values used for ploting. 

## Web Deployment

The application is accesible at:  https://wajihh.shinyapps.io//

A presentation of the above application is prepared using Rstdio Presenter and can be viewed at:  http://rpubs.com/wajihh/...
