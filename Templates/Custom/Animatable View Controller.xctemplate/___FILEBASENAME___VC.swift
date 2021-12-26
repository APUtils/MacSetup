//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  Copyright © ___YEAR___ Anton Plebanovich. All rights reserved.
//

import AnimatableStackView
import APExtensions
import APPropertyWrappers
import RxUtils
import UIKit

final class ___FILEBASENAME___: ViewController {
    
    // ******************************* MARK: - @IBOutlets
    
    @IBOutlet fileprivate var scrollView: UIScrollView!
    @IBOutlet private var animatableView: AnimatableView!
    
    // ******************************* MARK: - Private Properties
    
    @LateInitialized private var vm: ___VARIABLE_BASENAME___VM
    
    // ******************************* MARK: - Initialization and Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUpdate()
    }
    
    private func setupUpdate() {
        vm.rx
            .vms.driveOnNext { [weak self] vms in
                guard let _self = self else { return }
                
                _self.view.animateIfNeeded {
                    _self.animatableView.update(viewModels: vms)
                }
            }
            .disposed(by: disposeBag)
    }
    
    // ******************************* MARK: - UIViewController Overrides
    
    // ******************************* MARK: - Actions
    
    // ******************************* MARK: - Notifications
}

// ******************************* MARK: - InstantiatableFromStoryboard

extension ___FILEBASENAME___: InstantiatableFromStoryboard {
    static func create(vm: ___VARIABLE_BASENAME___VM) -> ___FILEBASENAME___ {
        let vc = instantiateFromStoryboard()
        vc.vm = vm
        return vc
    }
}