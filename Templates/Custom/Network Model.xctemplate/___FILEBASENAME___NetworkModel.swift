//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  Copyright © ___YEAR___ Anton Plebanovich. All rights reserved.
//

import APExtensions
import Foundation
import ObjectMapper
import ObjectMapperAdditions

struct ___FILEBASENAME___: Codable, Equatable, JSONFileMockable, JSONArrayFileMockable {
    var <#var#>: <#type#>?
}

// ******************************* MARK: - Mappable

extension SymbolsNetworkModel: Mappable {

    fileprivate enum SerializationKeys: String {
        case <#case#>
    }
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        <#var#> <- (map[SerializationKeys.<#var#>], TypeCastTransform())
    }
}
