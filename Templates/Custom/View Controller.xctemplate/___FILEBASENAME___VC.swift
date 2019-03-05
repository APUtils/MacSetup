//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

import APExtensions


final class ___FILEBASENAME___: UIViewController {
    
    // ******************************* MARK: - @IBOutlets
    
    // ******************************* MARK: - Private Properties
    
    private var vm: ___VARIABLE_BASENAME___VM!
    
    // ******************************* MARK: - Initialization and Setup
    
    override func viewDidLoad() {
        setup()
        super.viewDidLoad()
    }
    
    private func setup() {
        
    }
    
    // ******************************* MARK: - UIViewController Overrides
    
    // ******************************* MARK: - Actions
    
    // ******************************* MARK: - Notifications
}

// ******************************* MARK: - InstantiatableFromStoryboard

extension ___FILEBASENAME___: InstantiatableFromStoryboard {
    static func create(vm: ___VARIABLE_BASENAME___VM) -> ___FILEBASENAME___ {
        let vc = create()
        vc.vm = vm
        return vc
    }
}
