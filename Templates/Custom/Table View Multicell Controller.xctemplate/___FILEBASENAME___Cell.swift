//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import APExtensions
import BaseClasses


final class ___FILEBASENAME___: TableViewCell {
    
    // ******************************* MARK: - @IBOutlets
    
    // ******************************* MARK: - Initialization and Setup
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        
    }
}

// ******************************* MARK: - Configurable

extension ___FILEBASENAME___: Configurable {
    func configure(viewModel: Any) {
        guard let viewModel = viewModel as? ___VARIABLE_BASENAME___CellViewModel else { return }
        
        
    }
}
