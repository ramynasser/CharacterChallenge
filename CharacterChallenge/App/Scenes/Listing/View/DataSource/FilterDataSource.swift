//
//  FilterDataSource.swift
//  CharacterChallenge
//
//  Created by Ramy Nasser on 12/09/2024.
//

import UIKit
import SwiftUI
import Core
import DesignSystem
import CharacterDomain
typealias DidSelectItemCallback = ((CharacterStatus?) -> Void)

class FilterDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private var filters: [CharacterStatus] = []
    private var callback: DidSelectItemCallback?
    private let cellReuseID = "FilterItemView"
    private var selectedFilter: CharacterStatus?
    private var collectionView: UICollectionView
    
    init(
        collectionView: UICollectionView,
        filters: [CharacterStatus],
        selectedFilter: CharacterStatus?,
        callback: @escaping DidSelectItemCallback
    ) {
        self.filters = filters
        self.callback = callback
        self.selectedFilter = selectedFilter
        self.collectionView = collectionView
        super.init()
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "FilterItemView")
        collectionView.delegate = self
        
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let filters = filters.map { $0.rawValue }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseID, for: indexPath)
        cell.contentConfiguration = UIHostingConfiguration(content: {
            GridView(items: filters, selectedItem:  Binding(get: {
                self.selectedFilter?.rawValue
            }, set: { selected in
                self.selectedFilter = CharacterStatus(rawValue: selected ?? "")
                self.callback?(self.selectedFilter)
            }))
        })
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width, height: 50)
    }
    
}

