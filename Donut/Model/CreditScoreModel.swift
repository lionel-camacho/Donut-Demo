import Foundation

struct CreditScore {
    let currentCreditScore: Int
    let maxCreditScore: Int
}

extension CreditScore: Decodable {
    private enum CreditScoreApiResponseCodingKeys: String, CodingKey {
        case currentCreditScore = "score"
        case maxCeditScore = "maxScoreValue"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CreditScoreApiResponseCodingKeys.self)
        currentCreditScore = try container.decode(Int.self, forKey: .currentCreditScore)
        maxCreditScore = try container.decode(Int.self, forKey: .maxCeditScore)
    }
}
