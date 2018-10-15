//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  ___COPYRIGHT___
//

import UIKit

import APExtensions


final class ___FILEBASENAME___: UIViewController, InstantiatableFromStoryboard {
    
    // ******************************* MARK: - @IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // ******************************* MARK: - Private Properties
    
    private var viewModels: [___VARIABLE_BASENAME___CellViewModel] = []
    
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
    }
    
    // ******************************* MARK: - Configuration
    
    private func configure() {
        
    }
    
    // ******************************* MARK: - UIViewController Overrides
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configure()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        tableView.setEditing(editing, animated: animated)
    }
    
    // ******************************* MARK: - Actions
    
    // ******************************* MARK: - Notifications
}

// ******************************* MARK: - UITableViewDelegate, UITableViewDataSource

extension ___FILEBASENAME___: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModels[indexPath.row].cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        let cell: ___VARIABLE_BASENAME___Cell = tableView.dequeue(for: indexPath)
        
        cell.configure(viewModel: viewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
