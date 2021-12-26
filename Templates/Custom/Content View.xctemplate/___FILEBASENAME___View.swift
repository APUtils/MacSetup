//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  Copyright © ___YEAR___ Anton Plebanovich. All rights reserved.
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
        instantiateAndAttachContentView()
    }
    
    // ******************************* MARK: - Configuration
    
    // ******************************* MARK: - UIView Overrides
    
    // ******************************* MARK: - Public Methods
    
    func configure(vm: ___VARIABLE_BASENAME___VM) {
        
    }
    
    // ******************************* MARK: - Private Methods
    
    // ******************************* MARK: - Actions
}

// ******************************* MARK: - InstantiatableContentView

extension ___FILEBASENAME___: InstantiatableContentView {}
