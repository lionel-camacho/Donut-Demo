import Foundation

//Can be extended for more endpoints
public enum CreditScoreApi {
    case creditScore
}

extension CreditScoreApi: EndpointType {
    
    var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .production:
            return "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/"
        case .qa:
            return "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/qa/"
        case .staging:
            return "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/staging/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            fatalError("BaseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .creditScore:
            return "mockcredit/values"
        }
    }
    
    var httpMethod: HttpMethod {
        return.get
    }
    
    var task: HTTPTask {
        return .request
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    
}

