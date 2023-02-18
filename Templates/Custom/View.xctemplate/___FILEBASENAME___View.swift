//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  Copyright © ___YEAR___ Anton Plebanovich. All rights reserved.
//

import APExtensions
import APPropertyWrappers
import UIKit

final class ___FILEBASENAME___: UIView {
    
    // ******************************* MARK: - @IBOutlets
    
    // ******************************* MARK: - Private Properties
    
    @LateInitialized private var vm: ___VARIABLE_BASENAME___VM
    
    // ******************************* MARK: - Initialization and Setup
    
    private func setup() {
        
    }
    
    // ******************************* MARK: - Configuration
    
    // ******************************* MARK: - UIView Overrides
    
    // ******************************* MARK: - Public Methods
    
    // ******************************* MARK: - Private Methods
    
    // ******************************* MARK: - Actions
}

// ******************************* MARK: - InstantiatableFromXib

extension ___FILEBASENAME___: InstantiatableFromXib {
    static func instantiateFromXib(vm: ___VARIABLE_BASENAME___VM) -> Self {
        let view = instantiateFromXib()
        view.vm = vm
        view.setup()
        
        return view
    }
}
