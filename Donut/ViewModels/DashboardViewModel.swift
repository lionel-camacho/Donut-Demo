import Foundation
import UIKit

class DashboardViewModel {
    var networkManager: NetworkManager
    private let screenTitle = "Dashboard"
    var creditScoreResponse: CreditScore?
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getCreditScore(completion: @escaping (_ error: String?)->()) {
        networkManager.getCreditScore { [weak self] (response, error) in
            if error != nil {
                completion(error)
                return
            }
            if let creditScore = response {
                self?.creditScoreResponse = creditScore
                completion(nil)
                return
            }
            completion(NetworkManager.NetworkResponse.noData.rawValue)
        }
    }
    
    func title() -> String {
        return screenTitle
    }
    
    func creditScoreTitleText() -> String {
        return "Your credit score is"
    }
    
    func currentCreditScoreText() -> String? {
        if let currentScore = currentCreditScore() {
            return "\(currentScore)"
        }
        return nil
    }
    
    func maxCreditScoreText() -> String? {
        if let maxScore = maxCreditScore() {
            return "out of \(maxScore)"
        }
        return nil
    }
    
    func creditScorePercentage() -> CGFloat {
        if let currentScore = currentCreditScore(), let maxScore = maxCreditScore() {
            return CGFloat(currentScore) / CGFloat(maxScore)
        }
        return 0.0
    }
    
    private func currentCreditScore() -> Int? {
        return creditScoreResponse?.currentCreditScore
    }
    
    private func maxCreditScore() -> Int? {
        return creditScoreResponse?.maxCreditScore
    }
    
}

