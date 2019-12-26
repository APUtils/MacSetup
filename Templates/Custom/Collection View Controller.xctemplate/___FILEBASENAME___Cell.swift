//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  ___COPYRIGHT___
//

import APExtensions
import BaseClasses
import UIKit

final class ___FILEBASENAME___: CollectionViewCell {
    
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
    func configure(model: Any) {
        guard let model = model as? ___VARIABLE_BASENAME___CellViewModel else { return }
        
        
    }
}
