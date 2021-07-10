//
//  ProductsCollectionCell.swift
//  UI
//
//  Created by Renan Germano on 09/07/21.
//

import UIKit

import Models
import Service

protocol ProductsCollectionCellDelegate: AnyObject {
    
    func productsCollectionCellDelegate(didSelectProduct product: SearchProduct)
    func productsCollectionCellDelegate(didPressAddProductToCart product: SearchProduct)
    
}

class ProductsCollectionCell: UITableViewCell {
    
    public static let defaultNib = UINib(nibName: "ProductsCollectionCell", bundle: Bundle(for: ProductsCollectionCell.self))
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    weak var delegate: ProductsCollectionCellDelegate?
    private var products = [SearchProduct]()
    private let api = SearchAPI()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(ProductCell.defaultNib, forCellWithReuseIdentifier: "ProductCell")
    }
    
    func configure(withProductsSearch search: Search) {
        api.search(usingSearch: search,
                   onSuccess: { products in
                    self.products = products
                    DispatchQueue.main.async {
                        self.activityIndicator.stopAnimating()
                        self.collectionView.reloadData()
                    }
                   },
                   onError: { })
    }
    
}

extension ProductsCollectionCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell else {
            return UICollectionViewCell()
        }
        
        // cell.configure(withProduct: products[indexPath.item]
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.cornerRadius = 10
        cell.delegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 334)
    }
    
    
}

extension ProductsCollectionCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.productsCollectionCellDelegate(didSelectProduct: products[indexPath.item])
    }
    
}

extension ProductsCollectionCell: ProductCellDelegate {
    
    func productCellDelegate(didPressAddProductToCart product: SearchProduct) {
        delegate?.productsCollectionCellDelegate(didPressAddProductToCart: product)
    }
    
}
