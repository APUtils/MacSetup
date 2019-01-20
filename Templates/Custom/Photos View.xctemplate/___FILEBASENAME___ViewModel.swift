//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

import APExtensions


struct ___FILEBASENAME___ {
    
    // ******************************* MARK: - Public Properties
    
    let cellVMs: [___VARIABLE_BASENAME___CellViewModel]
    
    // ******************************* MARK: - Initialization and Setup
    
    init(photos: [String]) {
        let photoURLs = photos.compactMap { $0.asUrl }
        self.init(photos: photoURLs)
    }
    
    init(photos: [URL]) {
        cellVMs = photos.map(___VARIABLE_BASENAME___CellViewModel.init)
    }
}
