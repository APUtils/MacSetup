//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  Copyright © ___YEAR___ Anton Plebanovich. All rights reserved.
//

import AnimatableStackView
import APExtensions
import Foundation

struct ___FILEBASENAME___ {
    
    // ******************************* MARK: - Properties
    
    let title: String
    
    // ******************************* MARK: - Initialization and Setup
    
    init(title: String) {
        self.title = title
    }
    
    // ******************************* MARK: - Methods
}
// ******************************* MARK: - AnimatableStackView_ViewModel

extension ___FILEBASENAME___: AnimatableStackView_ViewModel {
    var animatableStackViewClass: AnimatableStackView_Subview.Type { ___VARIABLE_BASENAME___View.self }
    var id: String { title }
}
