//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  Copyright © ___YEAR___ Anton Plebanovich. All rights reserved.
//

import AnimatableView
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

// ******************************* MARK: - Identifiable

extension ___FILEBASENAME___: Identifiable {
    var id: String { title }
}

// ******************************* MARK: - AnimatableView_ViewModel

extension ___FILEBASENAME___: AnimatableView_ViewModel {
    var animatableViewClass: AnimatableView_Subview.Type { ___VARIABLE_BASENAME___View.self }
}
