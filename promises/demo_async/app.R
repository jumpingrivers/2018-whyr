library("shiny")
library("future")
library("promises")
plan(multiprocess)

ui <- basicPage(
    h2("Asynchronous Data Generator"),
    actionButton("quick_plot", "Quick Plot"),
    actionButton("slow_plot", "Slow Plot"),
    plotOutput("quick_plot"),
    plotOutput("slow_plot")
)

server <- function(input, output, session) {
    
    display = function(n, delay){
        Sys.sleep(delay)
        sampl = data.frame(x = rnorm(n), 
                           y = rnorm(n))
        return(sampl)
    }
    
    quick_samp <- eventReactive(input$quick_plot, {
        future(display(1000, 0)) # Super fast!
    })
    
    slow_samp <- eventReactive(input$slow_plot, {
        future(display(1000, 10)) # Super fast!
    })
    
    output$quick_plot <- renderPlot({
        quick_samp() %...>% plot()
    })
    
    output$slow_plot <- renderPlot({
        slow_samp() %...>% plot()
    })
} 

shinyApp(ui = ui, server = server)
