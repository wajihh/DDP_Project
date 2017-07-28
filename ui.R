library(shiny)
shinyUI(pageWithSidebar(
  headerPanel(
    "Ploting of Probability Distributions"),
  sidebarPanel(
    radioButtons("dist","Distribution type:",
                 list("Normal"="norm","Uniform"="unif")),
    sliderInput("n","Sample size:",1,1000,500),
    uiOutput("dist1"),
    uiOutput("dist2"),
    checkboxInput("density","Show density curve",FALSE),
    conditionalPanel(
      condition="input.density==true",
      numericInput("bw","bandwidth:",1))),
  mainPanel(
    tabsetPanel(
      tabPanel("Plot",plotOutput("plot",height="600px")),
      tabPanel("Summary",verbatimTextOutput("summary")),
      tabPanel("Table",tableOutput("table"))
    ))))