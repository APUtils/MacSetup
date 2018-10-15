//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import APExtensions


final class ___FILEBASENAME___: UIView, InstantiatableContentView {
    
    // ******************************* MARK: - @IBOutlets
    
    // ******************************* MARK: - Private Properties
    
    // ******************************* MARK: - Initialization and Setup
    
    private func setup() {
        setupContentView()
    }
    
    private func setupContentView() {
        let contentView = createContentView()
        contentView.frame = bounds
        
        addSubview(contentView)
    }
    
    // ******************************* MARK: - Configuration
    
    // ******************************* MARK: - UIView Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    // ******************************* MARK: - Public Methods
    
    // ******************************* MARK: - Private Methods
}
