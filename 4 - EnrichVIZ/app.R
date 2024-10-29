#Load necessary libraries
library(shiny)
library(shinydashboard)
library(TCGAbiolinks)
library(EDASeq)
library(DT)

# UI
ui <- fluidPage(
  tags$head(
    tags$style(HTML("
       @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap'); /* Font Import */
       @import url('https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;700&display=swap'); /* Space-like font */

      body { 
        font-family: 'Roboto', sans-serif; 
        background-color: #f9fafb; /* Softer background color */
        margin: 0; 
        padding: 0;
        color: #333; /* Dark grey text for contrast */
      }
      
      /* Header (Navbar) with gradient */
.navbar {
  background: linear-gradient(90deg, #ede7c9, #D1E8F2); /* Light pearl to soft blue gradient */
  height: 75px; /* Compact, yet comfortable */
  box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1), -5px -5px 10px rgba(255, 255, 255, 0.5); /* Soft shadow */
  padding: 0 40px;
  display: flex; 
  justify-content: space-between;
  align-items: center;
  border-radius: 20px;
}

      .navbar-brand {
        display: flex;
        align-items: center;
      }

      /* App Name */
      .app-name {
        font-family: 'Space Grotesk', sans-serif; /* Change to space-like font */
        font-size: 1.9em;
        color: #333; /* Black color */
        font-weight: 700;
        margin: 0; /* Remove default margin for better alignment */
      }

      .app-name:hover {
        letter-spacing: 1.5px;
        transform: scale(1.02); /* Subtle zoom effect on hover */
      }

      .highlight {
        background-color: #A0D1CE; 
        color: #333; 
        padding: 3px 10px;
        border-radius: 5px; /* Rounded for smooth look */
        font-weight: 700; 
        margin-left: -5px; 
        font-size: 0.9em;
        transition: background-color 0.3s ease, transform 0.2s ease;
      }

      .highlight:hover {
        background-color: #00A1C1; 
        transform: scale(1.08); /* Lift effect */
      }

      /* Navigation Links */
      .navbar-nav a {
        color: #333;
        text-decoration: none;
        font-size: 1.1em; 
        padding: 10px 15px;
        font-weight: 600; 
        transition: color 0.3s ease, transform 0.2s ease;
      }
      .navbar-nav a:hover {
        color: #00A1C1;
        transform: scale(1.02); /* Slight zoom on hover */
      }

      /* Glassmorphism on Main Banner */
      .main-banner {
        background-image: url('https://images.pexels.com/photos/2246476/pexels-photo-2246476.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
        background-size: cover;
        background-position: center;
        height: 400px;
        position: relative;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
        color: black; /* White text color for description */
      }
      
      .main-banner::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        backdrop-filter: blur(12px); /* Stronger glassmorphism */
        background: rgba(255, 255, 255, 0.1); 
        z-index: 1;
      }

      .main-banner-content {
        position: relative;
        text-align: center;
        color: white;
        z-index: 2;
        background: rgba(255, 255, 255, 0.15); /* Frosted glass */
        padding: 30px;
        border-radius: 20px;
        box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.3); 
        backdrop-filter: blur(10px); 
      }

      .main-banner-content h1 {
        font-size: 3em;
        font-weight: 700;
        letter-spacing: 2px;
        margin-bottom: 20px;
      }

      .main-banner-content p {
        font-size: 1.4em;
        margin-top: 10px;
        letter-spacing: 1px;
      }

      .main-banner-content button {
        background-color: #00A1C1;
        border: none;
        padding: 12px 35px;
        font-size: 1.4em;
        color: black;
        cursor: pointer;
        border-radius: 20px;
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
        transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
      }

      .main-banner-content button:hover {
        background-color: #007D8E;
        transform: translateY(-3px); 
        box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.3); 
      }

      /* Main Content Area - Using cards */
      .main-content {
        margin-top: -10px;
        padding: 40px;
        background-color: #fff; 
        border-radius: 20px; 
        box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1); 
      }

      .widget-gradient {
      background: linear-gradient(90deg, #ede7c9, #D1E8F2); /* Replace with your gradient colors */
      color: black; /* Adjust text color for better visibility */
      padding: 30px;
        border-radius: 15px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.05);
        margin-bottom: 30px;
    }

      .content-card h2 {
        font-size: 1.8em;
        font-weight: 700;
        margin-bottom: 15px;
      }

      .content-card p {
        font-size: 1.2em;
        line-height: 1.6;
      }


     /* Footer */
.footer {
  background: linear-gradient(90deg, #ede7c9, #D1E8F2); /* Lighter pearl to a very soft blue */
  padding: 20px 0;
  text-align: center;
  font-size: 1em;
  color: #333;
  margin-top: 50px;
  box-shadow: 0px -4px 10px rgba(0, 0, 0, 0.1);
  border-radius: 0 0 20px 20px;
}

      /* Responsive Design */
      @media (max-width: 768px) {
        .navbar {
          height: 70px;
          padding: 0 20px; 
        }
        .app-name {
          font-size: 1.2em; 
        }
        .main-banner-content h1 {
          font-size: 1.5em; 
        }
        .navbar-custom {}
        
        .content-card{}
        
        .main-banner-content p {
          font-size: 1.2em;
        }
        .main-banner-content button {
          padding: 10px 25px;
        }
      }
      .geneInput {
    background-color: rgba(255, 255, 255, 0.7);
    border-radius: 8px;
    padding: 10px;
  }
    "))
  ),
  
  # App layout
  navbarPage(
    title = div(class = "navbar-brand",
                span(class = "app-name", 
                     "Enrich", 
                     span(class = "highlight", "VIZ")
                )
    ),
    id = "mainNavbar",
    
    tabPanel("Home", tabName = "home", icon = icon("home"), 
             div(class = "main-banner",
                 div(class = "main-banner-content",
                     h1("Bring Data to Life"),
                     p("Visualize and explore data interactively.")
                     
                 )
             ),
             
             div(class = "main-content",
                 div(class = "widget-gradient",
                     h2("Welcome to EnrichVIZ!"),
                     p("EnrichVIZ offers powerful tools to explore gene ontology enrichment analysis. 
                     With an intuitive interface and the ability to interactively visualize enriched pathways, EnrichVIZ 
                     brings advanced data analysis to researchers' fingertips, enabling them to quickly identify significant 
                     biological terms, pathways, and gene ontologies.")
                 ),
                 div(class = "widget-gradient",
                     h2("Why Choose Us?"),
                     p("EnrichVIZ was built to simplify the complex task of functional enrichment analysis. Our tool 
                     integrates with popular datasets and provides seamless visual representations of the results, making
                     it easier to uncover insights. With EnrichVIZ, you can:"),
                     tags$ul(
                       tags$li("Perform advanced functional enrichment analysis quickly and efficiently."),
                       tags$li("Explore interactive visualizations of enriched pathways and terms."),
                       tags$li("Seamlessly integrate with various gene expression data sources."),
                       tags$li("Generate comprehensive reports for further analysis or sharing.")
                     ) )
             ),
             
             # Footer section
             div(class = "footer",
                 p("Â© 2024 EnrichVIZ. All rights reserved.")
             )
    ),
    
    tabPanel("Enrichment Analysis", tabName = "analysis", icon = icon("bar-chart"), 
             fluidRow(
               box(
                 title = "Enrichment Parameters", status = "primary", solidHeader = TRUE, width = 3,
                 style = "background: linear-gradient(90deg, #ede7c9, #D1E8F2); border-radius: 10px; box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1); padding: 15px;",
                 
                 textAreaInput("geneInput", "Enter Gene Symbols (comma-separated):", 
                               rows = 5, placeholder = "e.g. TP53, BRCA1, EGFR"),
                 actionButton("runAnalysis", "Run Enrichment Analysis")
               ),
               mainPanel(
                 tabsetPanel(
                   id = "results",
                   tabPanel("Biological Processes", plotOutput("bpPlot"), DTOutput("bpTable")),
                   tabPanel("Molecular Functions", plotOutput("mfPlot"), DTOutput("mfTable")),
                   tabPanel("Cellular Components", plotOutput("ccPlot"), DTOutput("ccTable")),
                   tabPanel("Pathways", plotOutput("patPlot"), DTOutput("patTable"))
                 )
               )
             )
    )
  ) 
)

# Server logic
server <- function(input, output, session) {
  # Create a reactive expression to perform analysis when the user clicks "Run Analysis"
  observeEvent(input$runAnalysis, {  # Changed to "runAnalysis"
    # Parse the input genes
    geneList <- unlist(strsplit(input$geneInput, ","))  # Changed to "geneInput"
    geneList <- trimws(geneList)  # Trim any white space
    
    # Show status
    output$status <- renderText({ "Analysis in progress, please wait..." })
    
    # Create a progress bar
    progress <- Progress$new(session, min = 0, max = 1)  # Added "session"
    progress$set(message = "Analyzing genes...", value = 0)
    
    # Run the analysis
    EA_result <- TCGAanalyze_EAcomplete(
      TFname = "DEA genes", 
      RegulonList = geneList
    )
    
    progress$close()
    output$status <- renderText({ "Analysis complete." })
    
    # Define gradient colors
    gradient_bp <- colorRampPalette(c("#FF7F50", "#FF4500", "#FFD700"))(10)  # Gradient for Biological Processes
    gradient_mf <- colorRampPalette(c("#00FF7F", "#32CD32", "#7CFC00"))(10)  # Gradient for Molecular Functions
    gradient_cc <- colorRampPalette(c("#1E90FF", "#00BFFF", "#87CEFA"))(10)  # Gradient for Cellular Components
    gradient_pat <- colorRampPalette(c("#FF69B4", "#FF1493", "#FF6347"))(10) # Gradient for Pathways
    
    
    # Biological Processes Tab
    output$bpPlot <- renderPlot({
      TCGAvisualize_EAbarplot(
        tf = rownames(EA_result$ResBP),
        GOBPTab = EA_result$ResBP,
        nBar = 10,
        nRGTab = geneList,
        filename = NULL,  
        text.size = 1,
        mfrow = c(1, 1),
        xlim = NULL,
        fig.width = 10,
        fig.height = 7,
        color = gradient_bp
      )
    })
    
    output$bpTable <- renderDT({
      datatable(EA_result$ResBP)
    })
    
    # Molecular Function Tab
    output$mfPlot <- renderPlot({
      TCGAvisualize_EAbarplot(
        tf = rownames(EA_result$ResMF),
        GOMFTab = EA_result$ResMF,
        nBar = 10,
        nRGTab = geneList,
        filename = NULL,  
        text.size = 1,
        mfrow = c(1, 1),
        xlim = NULL,
        fig.width = 10,
        fig.height = 7,
        color = gradient_mf
      )
    })
    
    output$mfTable <- renderDT({
      datatable(EA_result$ResMF)
    })
    
    # Cellular Components Tab
    output$ccPlot <- renderPlot({
      TCGAvisualize_EAbarplot(
        tf = rownames(EA_result$ResCC),
        GOCCTab = EA_result$ResCC,
        nBar = 10,
        nRGTab = geneList,
        filename = NULL,  
        text.size = 1,
        mfrow = c(1, 1),
        xlim = NULL,
        fig.width = 10,
        fig.height = 7,
        color = gradient_cc
      )
    })
    
    output$ccTable <- renderDT({
      datatable(EA_result$ResCC)
    })
    
    #Pathways Tab
    output$patPlot <- renderPlot({
      TCGAvisualize_EAbarplot(
        tf = rownames(EA_result$ResPat),
        GOPATTab = EA_result$ResPat,
        nBar = 10,
        nRGTab = geneList,
        filename = NULL,  
        text.size = 1,
        mfrow = c(1, 1),
        xlim = NULL,
        fig.width = 10,
        fig.height = 7,
        color = gradient_pat
      )
    })
    
    output$patTable <- renderDT({
      datatable(EA_result$ResPat)
    })
    
  })
}


# Run the application
shinyApp(ui = ui, server = server)