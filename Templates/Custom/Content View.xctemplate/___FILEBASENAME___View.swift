//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import APExtensions


final class ___FILEBASENAME___: UIView {
    
    // ******************************* MARK: - @IBOutlets
    
    // ******************************* MARK: - Private Properties
    
    private var vm: ___VARIABLE_BASENAME___VM!
    
    // ******************************* MARK: - Initialization and Setup
    
    private func setup() {
        setupContentView()
    }
    
    private func setupContentView() {
        let contentView = createContentView()
        contentView.frame = bounds
        addSubview(contentView)
        contentView.constraintSides(to: self)
    }
    
    // ******************************* MARK: - Configuration
    
    // ******************************* MARK: - UIView Overrides
    
    // ******************************* MARK: - Public Methods
    
    // ******************************* MARK: - Private Methods
}

// ******************************* MARK: - InstantiatableContentView

extension ___FILEBASENAME___: InstantiatableContentView {
    static func create(vm: ___VARIABLE_BASENAME___VM) -> ___FILEBASENAME___ {
        let view = create()
        view.vm = vm
        view.setup()
        
        return view
    }
}
