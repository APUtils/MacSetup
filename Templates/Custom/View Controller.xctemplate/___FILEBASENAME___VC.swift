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

final class ___FILEBASENAME___: ViewController {
    
    // ******************************* MARK: - @IBOutlets
    
    @IBOutlet fileprivate var scrollView: UIScrollView!
    
    // ******************************* MARK: - Private Properties
    
    @LateInitialized 
    private var vm: ___VARIABLE_BASENAME___VM
    
    // ******************************* MARK: - Initialization and Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
    }
    
    // ******************************* MARK: - Actions
    
    
}

// ******************************* MARK: - InstantiatableFromStoryboard

extension ___FILEBASENAME___: InstantiatableFromStoryboard {
    static func instantiateFromStoryboard(vm: ___VARIABLE_BASENAME___VM) -> ___FILEBASENAME___ {
        let vc = instantiateFromStoryboard()
        vc.vm = vm
        return vc
    }
}
