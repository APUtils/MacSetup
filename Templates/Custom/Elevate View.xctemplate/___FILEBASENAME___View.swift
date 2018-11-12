//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit


final class ___FILEBASENAME___: UIView, InstantiatableFromXib {
    
    // ******************************* MARK: - @IBOutlets
    
    // ******************************* MARK: - Private Properties
    
    private var vm: ___VARIABLE_BASENAME___VM!
    
    // ******************************* MARK: - Initialization and Setup
    
    static func create(vm: ___VARIABLE_BASENAME___VM) -> Self {
        let view = create()
        view.vm = vm
        view.setup()
        
        return view
    }
    
    private func setup() {
        
    }
}
