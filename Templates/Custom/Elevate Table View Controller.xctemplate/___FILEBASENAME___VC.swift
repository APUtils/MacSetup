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


final class ___FILEBASENAME___: UIViewController, InstantiatableFromStoryboard {
    
    // ******************************* MARK: - @IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // ******************************* MARK: - Private Properties
    
    private var viewModel: ___VARIABLE_BASENAME___VM!
    private let disposeBag = DisposeBag()
    
    // ******************************* MARK: - Initialization and Setup
    
    static let storyboardName = <#StroyboardName#>
    
    static func create(viewModel: ___VARIABLE_BASENAME___VM) -> Self {
        let vc = create()
        vc.viewModel = viewModel
        
        return vc
    }
    
    override func viewDidLoad() {
        setup()
        
        super.viewDidLoad()
    }
    
    private func setup() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.registerNib(class: ___VARIABLE_BASENAME___Cell.self)
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        
        viewModel.cellVMs
            .drive(tableView.rx.items) { tableView, row, viewModel in
                let cell: ___VARIABLE_BASENAME___Cell = tableView.dequeue(for: IndexPath(row: row, section: 0))
                cell.configure(viewModel: viewModel)
                
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    // ******************************* MARK: - Configuration
    
    // ******************************* MARK: - UIViewController Overrides
    
    // ******************************* MARK: - Actions
    
    // ******************************* MARK: - Notifications
}

// ******************************* MARK: - UITableViewDelegate, UITableViewDataSource

extension ___FILEBASENAME___: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
