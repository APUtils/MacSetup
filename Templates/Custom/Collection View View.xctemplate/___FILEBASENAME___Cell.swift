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
    
    // ******************************* MARK: - Private Properties
    
    private var vm: ___VARIABLE_BASENAME___CellViewModel!
    
    // ******************************* MARK: - Initialization and Setup
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        
    }
    
    // ******************************* MARK: - Configuration
    
    func configure(vm: ___VARIABLE_BASENAME___CellViewModel) {
        self.vm = vm
        
        
    }
}
