//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by Anton Plebanovich on ___DATE___.
//  ___COPYRIGHT___
//

import APExtensions
import UIKit

final class ___FILEBASENAME___: UIView {
    
    // ******************************* MARK: - @IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // ******************************* MARK: - Private Properties
    
    private var vm: ___VARIABLE_BASENAME___ViewModel!
    
    // ******************************* MARK: - Initialization and Setup
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        setupContentView()
        setupCollectionView()
    }
    
    private func setupContentView() {
        let contentView = createContentView()
        contentView.frame = bounds
        addSubview(contentView)
        contentView.constraintSides(to: self)
    }
    
    private func setupCollectionView() {
        collectionView.registerNib(cellClass: ___VARIABLE_BASENAME___Cell.self)
    }
    
    // ******************************* MARK: - UIView Overrides
    
    // ******************************* MARK: - Configuration
    
    func configure(vm: ___VARIABLE_BASENAME___ViewModel) {
        self.vm = vm
        collectionView.reloadData()
    }
    
    // ******************************* MARK: - Private Methods
}

// ******************************* MARK: - InstantiatableContentView

extension ___FILEBASENAME___: InstantiatableContentView {}

// ******************************* MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ___FILEBASENAME___: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.cellVMs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ___VARIABLE_BASENAME___Cell = collectionView.dequeueCell(for: indexPath)
        cell.configure(vm: vm.cellVMs[indexPath.row])
        return cell
    }
}
