//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  ___COPYRIGHT___
//

import Foundation

import APExtensions


final class ___FILEBASENAME___ {
    
    // ******************************* MARK: - Class Properties
    
    static private(set) var shared = ___FILEBASENAME___()
    
    // ******************************* MARK: - Initialization, Setup and Configuration
    
    private init() {
        setup()
    }
    
    private func setup() {
        
    }
    
    // ******************************* MARK: - Public Methods
    
    // ******************************* MARK: - Private Methods
}

// ******************************* MARK: - Manager

extension ___FILEBASENAME___: Manager {
    static func start() {
        _ = shared
    }
    
    static func reset() {
        shared = ___FILEBASENAME___()
    }
}
