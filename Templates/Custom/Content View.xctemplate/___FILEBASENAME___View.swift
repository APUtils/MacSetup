//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  ___COPYRIGHT___
//

import APExtensions
import UIKit

final class ___FILEBASENAME___: UIView {
    
    // ******************************* MARK: - @IBOutlets
    
    // ******************************* MARK: - Private Properties
    
    // ******************************* MARK: - Initialization and Setup
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        createAndAttachContentView()
    }
    
    // ******************************* MARK: - Configuration
    
    // ******************************* MARK: - UIView Overrides
    
    // ******************************* MARK: - Public Methods
    
    /// Configure view with provided view model
    /// - parameter vm: View model to use for setup
    func configure(vm: ___VARIABLE_BASENAME___VM) {
        
    }
    
    // ******************************* MARK: - Private Methods
}

// ******************************* MARK: - InstantiatableContentView

extension ___FILEBASENAME___: InstantiatableContentView {}
