// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let authResponseDataEntity = try UserAuthenticationEntity(json)

import Foundation

// MARK: - AuthResponseDataEntity
class UserAuthenticationEntity: UserAuthentication {
    
    fileprivate let authSub, authToken, authType: String
    
    enum CodingKeys: String, CodingKey {
        case sub, token, type
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authSub = try container.decode(String.self, forKey: .sub)
        self.authToken = try container.decode(String.self, forKey: .token)
        self.authType = try container.decode(String.self, forKey: .type)
        super.init(sub: authSub, token: authToken, type: authType)
    }
}

