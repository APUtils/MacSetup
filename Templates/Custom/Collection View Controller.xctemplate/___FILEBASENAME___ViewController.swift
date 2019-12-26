//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  ___COPYRIGHT___
//

import APExtensions
import UIKit

final class ___FILEBASENAME___: UIViewController {
    
    // ******************************* MARK: - @IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // ******************************* MARK: - Private Properties
    
    private var models: [___VARIABLE_BASENAME___CellViewModel] = []
    
    // ******************************* MARK: - Initialization and Setup
    
    override func viewDidLoad() {
        setup()
        super.viewDidLoad()
    }
    
    private func setup() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.registerNib(class: ___VARIABLE_BASENAME___Cell.self)
    }
    
    // ******************************* MARK: - UIViewController Overrides
    
    // ******************************* MARK: - Actions
    
    // ******************************* MARK: - Notifications
}

// ******************************* MARK: - InstantiatableFromStoryboard

extension ___FILEBASENAME___: InstantiatableFromStoryboard {}

// ******************************* MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ___FILEBASENAME___: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ___VARIABLE_BASENAME___Cell = collectionView.dequeue(for: indexPath)
        
        cell.configure(model: models[indexPath.row])
        
        return cell
    }
}
