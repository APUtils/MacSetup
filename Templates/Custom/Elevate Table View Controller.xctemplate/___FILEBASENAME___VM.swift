//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit
import RxCocoa
import RxSwift


class ___FILEBASENAME___ {
    
    // ******************************* MARK: - Public Properties
    
    lazy private(set) var cellVMs: Driver<[___VARIABLE_BASENAME___CellVM]> = {
        return cellVMsValue.asDriver()
    }()
    
    // ******************************* MARK: - Private Properties
    
    private let cellVMsValue = Variable<[___VARIABLE_BASENAME___CellVM]>([])
    private let disposeBag = DisposeBag()
    
    // ******************************* MARK: - Initialization and Setup
    
    init() {
        setup()
    }
    
    private func setup() {
        loadViewModels()
    }
    
    // ******************************* MARK: - Private Methods
    
    private func loadViewModels() {
//        Service.getModels()
//            .map { $0.map(___VARIABLE_BASENAME___CellVM.init(<#API_MODEL#>:)) }
//            .bind(to: cellVMsValue)
//            .disposed(by: disposeBag)
    }
}
