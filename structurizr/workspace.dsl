workspace "Platform Global" "Platform Global system architecture" {
    !identifiers hierarchical
    model {
        user = person "Anonymous User"
        enterprise "Prima" {
            group "Platform Global" {
                backend = softwareSystem "Platform Global BE" "Provides Platform Global funtionalities via GraphQl and REST APIs."
                frontend = softwareSystem "Platform Global FE" "Provides all of the functionality to users via their web browser." "Web Browser"
                engine = softwareSystem "Platfrom Global Engine" "Provides quotability and sellability of Prima products via REST API."
                database = softwareSystem "Database" "Stores applications, quotes, offers, proposer data, etc." "Database"
                
                frontend -> backend "Makes API calls to" "GraphQl"
                backend -> engine "Makes API calls to" "REST"
            }
            
            # External systems
            tecton = softwareSystem "Tecton" "Features store" "Existing System"
            lira = softwareSystem "Lira" "Provides payment functionalities" "Existing System"
            
            frontend -> lira "Makes API calls to" "GraphQl"
            engine -> tecton "Reads features" "REST"
        }
        
        pcw = softwareSystem "Price Comparison Website" "Allows users to compare prices." "Existing System"
        
        braintree = softwareSystem "Braintree" "Payment gateway" "Existing System"
        
        user -> frontend "Makes quotes and purchases offers"
        user -> pcw "Compares prices"
        
        pcw -> backend "Makes Api calls to" "REST"
        
        lira -> braintree "Makes Api calls to" "GraphQl"
        
    }
    
    views {
        systemLandscape {
            include * *
            autoLayout
        }
        
        systemContext backend {
            include * *
            autoLayout
        }
        
        theme default
        
        styles {
            element "Existing System" {
                background #999999
                color #ffffff
            }
            
            element "Database" {
                shape Cylinder
            }
            element "Web Browser" {
                shape WebBrowser
            }
        }
    }
}
