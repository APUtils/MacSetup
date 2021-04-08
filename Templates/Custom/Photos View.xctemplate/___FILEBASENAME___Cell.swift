//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  Copyright © ___YEAR___ Anton Plebanovich. All rights reserved.
//

import BaseClasses
import UIKit

final class ___FILEBASENAME___: CollectionViewCell {
    
    // ******************************* MARK: - @IBOutlets
    
    @IBOutlet private weak var imageView: UIImageView!
    
    // ******************************* MARK: - Configuration
    
    func configure(vm: ___VARIABLE_BASENAME___CellViewModel) {
        imageView.setImage(url: vm.photo)
    }
    
    // ******************************* MARK: - Actions
}
