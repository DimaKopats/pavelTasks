import UIKit





enum EventCategory: String {
    case country = "country 2"
    case performance = "performance"
    case behaviour = "behaviour"
    case register = "register"
    case facebookLogin = "facebook login"
    case login = "login"
    case ecomm = "ecomm"
    case alertas = "Alertas"
    case fitAnalytics = "Fit_Analytics"
    case productFilter = "productFilter"
    case search = "search"
    case launch = "launch"
    case uxTopBrands = "UX_top_brands"
    case ux = "ux"
    case shipping = "shipping"
}

let a = EventCategory.country
print(EventCategory.country.rawValue)

EventCategory.init(rawValue: "country")
EventCategory.init(rawValue: "country 2")


