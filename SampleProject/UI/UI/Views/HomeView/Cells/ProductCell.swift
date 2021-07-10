//
//  ProductCell.swift
//  UI
//
//  Created by Renan Germano on 09/07/21.
//

import UIKit

import Models

protocol ProductCellDelegate: AnyObject {
    
    func productCellDelegate(didPressAddProductToCart product: SearchProduct)
    
}

class ProductCell: UICollectionViewCell {
    
    public static let defaultNib = UINib(nibName: "ProductCell", bundle: Bundle(for: ProductCell.self))
    
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var productPrice: UILabel!
    @IBOutlet private weak var buyButton: UIButton!
    
    weak var delegate: ProductCellDelegate?
    var product: SearchProduct!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(withProduct product: SearchProduct) {
        self.product = product
        // update views
    }
    
    @IBAction private func didPressBuyButton() {
        delegate?.productCellDelegate(didPressAddProductToCart: product)
    }
    
}
