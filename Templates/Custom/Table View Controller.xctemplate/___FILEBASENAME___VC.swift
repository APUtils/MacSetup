//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  Copyright © ___YEAR___ Anton Plebanovich. All rights reserved.
//

import APControllers
import APExtensions
import APPropertyWrappers
import UIKit

final class ___FILEBASENAME___: ViewController {
    
    // ******************************* MARK: - @IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // ******************************* MARK: - Private Properties
    
    @LateInitialized private var vm: ___VARIABLE_BASENAME___VM
    
    // ******************************* MARK: - Initialization and Setup
    
    override func viewDidLoad() {
        setup()
        super.viewDidLoad()
    }
    
    private func setup() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.registerNib(class: ___VARIABLE_BASENAME___Cell.self)
        tableView.optimizeCellHeightComputations(cell: ___VARIABLE_BASENAME___Cell.instantiateFromXib()) { [vm] cell, indexPath in
            let cellVM = vm.cellVMs[indexPath.row]
            cell.configure(vm: cellVM)
        }
    }
    
    // ******************************* MARK: - UIViewController Overrides
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
    
    // ******************************* MARK: - Actions
    
    
}

// ******************************* MARK: - InstantiatableFromStoryboard

extension ___FILEBASENAME___: InstantiatableFromStoryboard {
    static func instantiateFromStoryboard(vm: ___VARIABLE_BASENAME___VM) -> Self {
        let vc = instantiateFromStoryboard()
        vc.vm = vm
        return vc
    }
}

// ******************************* MARK: - UITableViewDelegate, UITableViewDataSource

extension ___FILEBASENAME___: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.cellVMs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellVM = vm.cellVMs[indexPath.row]
        let cell = tableView.dequeue(___VARIABLE_BASENAME___Cell.self, for: indexPath)
        cell.configure(vm: cellVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let cellVM = vm.cellVMs[indexPath.row]
    }
}
