library(shiny)
library(datasets)
shinyServer(function(input,output){
  dat <- reactive({
    dist <- switch(input$dist,
                   norm=rnorm,	unif=runif)
    
    def.args <- switch(input$dist,
                       norm=c(input$mean,input$sd), unif=c(input$min,input$max))
    
    f <- formals(dist);	f <- f[names(f)!="n"]; len <- min(length(f),3-1); f <- f[1:len]
    argList <- list(n=input$n)
    for(i in 1:len) argList[[names(f)[i]]] <- def.args[i]
    return(list(do.call(dist,argList),names(f)))
  })
  output$dist1 <- renderUI({
    lab <- switch(input$dist,
                  norm="Mean:", unif="Minimum:")
    ini <- switch(input$dist,
                  norm=0, unif=0)
    numericInput(dat()[[2]][1],lab,ini)
  })
  output$dist2 <- renderUI({
    lab <- switch(input$dist,
                  norm="Standard deviation:", unif="Maximum:")
    ini <- switch(input$dist,
                  norm=1, unif=1, F=15, gam=1, lnorm=1, beta=2)
    if(any(input$dist==c("norm","unif"))) numericInput(dat()[[2]][2],lab,ini)
  })
  output$plot <- renderPlot({
    dist <- input$dist
    n <- input$n
    hist(dat()[[1]],main="",xlab="Observations",col="Yellow",cex.axis=1.2,cex.lab=1.2,prob=T)
    if(input$density) lines(density(dat()[[1]],adjust=input$bw),lwd=2)
  })
  
  output$summary <- renderPrint({
    summary(dat()[[1]])
  })
  
  output$table <- renderTable({
    data.frame(x=dat()[[1]])
  })
})