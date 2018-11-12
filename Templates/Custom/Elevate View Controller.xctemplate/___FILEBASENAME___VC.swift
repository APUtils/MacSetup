//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit


final class ___FILEBASENAME___: ReactiveVC {
    
    // ******************************* MARK: - @IBOutlets
    
    // ******************************* MARK: - Private Properties
    
    private var vm: ___VARIABLE_BASENAME___VM!
    
    // ******************************* MARK: - Initialization and Setup
    
    static func create(vm: ___FILEBASENAME___VM) -> ___FILEBASENAME___ {
        let vc = create()
        vc.vm = vm
        
        return vc
    }
    
    override func viewDidLoad() {
        setup()
        
        super.viewDidLoad()
    }
    
    private func setup() {
        
    }
    
    // ******************************* MARK: - UIViewController Methods
    
    // ******************************* MARK: - Actions
    
    // ******************************* MARK: - Notifications
}

// ******************************* MARK: - InstantiatableFromStoryboard

extension ___FILEBASENAME___: InstantiatableFromStoryboard {
    static var storyboardName = <#Storyboard Name#>
}
