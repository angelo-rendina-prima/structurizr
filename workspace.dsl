workspace {
    model {
        user = person "User"
        softwareSystem = softwareSystem "Software System" {
            !include "partials/web.dsl"
            !include "partials/database.dsl"
        }
    }

    views {
        container softwareSystem {
            include *
            autolayout lr
        }

        theme default
    }
}
