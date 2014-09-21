library(shiny); data(mtcars); data(state)

mvs             <- row.names(mtcars)
states          <- state.abb
#rm(state.area,state.division,state.region,state.x77,state.name)

shinyUI(pageWithSidebar(
    
    headerPanel("Driving Distance"),
    
    sidebarPanel(
        h3('Choose Your Trip'),
        selectInput("id1", "Origin:", choices = states),
        selectInput("id2", "Destination:", choices = states),
        selectInput("id3", "Driving a:", choices = mvs),
        submitButton('Submit') ,
        h6('Please select the origin and destination of your state, and select the type of car you would like to drive. This app uses latitude and longitude data from the state dataset to estimate the distance of your trip, along with motor trend data from mtcars to estimate your driving speed.')
    ),
    mainPanel(
        h3('Trip Summary'),
        h5('You selected to drive from:'),
        verbatimTextOutput('oid1'),
        h5('All the way to:'),
        verbatimTextOutput('oid2'),
        h5('In a:'),
        verbatimTextOutput('oid3'),
        h5('This trip will take'),
        verbatimTextOutput('oid4'),
        p('hours.')
    )
))

