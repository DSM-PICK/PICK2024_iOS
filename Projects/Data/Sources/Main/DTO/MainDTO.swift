import Foundation

import Core
import Domain

public struct MainDTO: Decodable {
    let userID: UUID?
    let userName: String?
    let startTime: String?
    let endTime: String?
    let classroom: String?
    
    enum CodingKeys: String, CodingKey {
        case classroom
        case userID = "user_id"
        case userName = "username"
        case startTime = "start_time"
        case endTime = "end_time"
    }
    
}

extension MainDTO {
    func toDomain() -> MainEntity {
        return .init(
            userID: userID,
            userName: userName,
            startTime: startTime,
            endTime: endTime,
            classroom: classroom
        )
    }
    
}
