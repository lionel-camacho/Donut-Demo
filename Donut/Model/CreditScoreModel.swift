import Foundation

struct CreditScore {
    let currentCreditScore: Int
    let maxCreditScore: Int
}

extension CreditScore: Decodable {
    
    public enum creditReportInfoResponseCodingKeys: String, CodingKey {
        case creditReportInfo
    }
    
    private enum CreditScoreCodingKeys: String, CodingKey {
        case currentCreditScore = "score"
        case maxCeditScore = "maxScoreValue"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: creditReportInfoResponseCodingKeys.self)
        let creditScoreContainer = try container.nestedContainer(keyedBy: CreditScoreCodingKeys.self, forKey: .creditReportInfo)
        currentCreditScore = try creditScoreContainer.decode(Int.self, forKey: .currentCreditScore)
        maxCreditScore = try creditScoreContainer.decode(Int.self, forKey: .maxCeditScore)
    }
}
