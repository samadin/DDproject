library(shiny); data(mtcars); data(state)

#rm(state.area,state.division,state.region,state.x77,state.name)

# data
mvs             <- row.names(mtcars)
states          <- state.abb
mpgs            <- mtcars$mpg
speed           <- 3600*(1/(4*mtcars$qsec))
XY              <- as.data.frame(state.center)
rownames(XY)    <- state.abb

getXY       <- function(S) as.numeric(XY[S,])
calcdist    <- function(A,B) 69 * sqrt(sum((A-B)^2))
getspeed    <- function(me,mvs,speed) speed[me==mvs]
calctime    <- function(D,s) D/s

shinyServer(
    function(input,output){
        
        output$oid1     <- renderPrint({input$id1})
        output$oid2     <- renderPrint({input$id2})
        output$oid3     <- renderPrint({input$id3})
        output$oid4     <- renderPrint(T)
        output$oid4     <- renderPrint(   calctime(calcdist(getXY({input$id1}),getXY({input$id2})),getspeed({input$id3},mvs,speed))   )
    }
    )