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
import UIKit

final class ___FILEBASENAME___: UIView, InstantiatableFromXib {
    
    // ******************************* MARK: - @IBOutlets
    
    @IBOutlet fileprivate var titleLabel: UILabel!
    
    // ******************************* MARK: - Private Properties
    
    @LateInitialized fileprivate var vm: ___VARIABLE_BASENAME___VM
    
    // ******************************* MARK: - Initialization and Setup
    
    // ******************************* MARK: - Configuration
    
    fileprivate func configure(vm: ___VARIABLE_BASENAME___VM) {
        self.vm = vm
        
        titleLabel.text = vm.title
    }
    
    // ******************************* MARK: - UIView Overrides
    
    // ******************************* MARK: - Public Methods
    
    // ******************************* MARK: - Private Methods
    
    // ******************************* MARK: - Actions
}

// ******************************* MARK: - Identifiable

extension ___FILEBASENAME___: Identifiable {
    var id: String { vm.id }
}

// ******************************* MARK: - AnimatableView_Subview

extension ___FILEBASENAME___: AnimatableView_Subview {
    var animatableViewModel: Any? { vm }

    func configure(viewModel: Any) {
        guard let vm = viewModel as? ___VARIABLE_BASENAME___VM else { return }
        configure(vm: vm)
    }
}

// ******************************* MARK: - AnimatableStackView_Subview

extension ___FILEBASENAME___: AnimatableStackView_Subview {
    func configure(viewModel: Any) {
        guard let vm = viewModel as? ___VARIABLE_BASENAME___VM else { return }
        configure(vm: vm)
    }
}
