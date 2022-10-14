//
//  HotSalesCollectionViewCell.swift
//  TestEcommerceConcept
//
//  Created by Линар Нигматзянов on 18/09/2022.
//

import UIKit
import SnapKit

final class BannersCollectionViewCell: UICollectionViewCell {
    static let identifier = "Cell"
    
    private let mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    public let imageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()
    
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubview()
        setConstraints()

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - setSubview
    private func setSubview() {
        addSubview(mainView)
        mainView.addSubview(imageView)

    }
    
    // MARK: - setConstraints
    private func  setConstraints() {
        mainView.snp.makeConstraints { make in
            make.leftMargin.equalToSuperview()
            make.rightMargin.equalToSuperview()
            make.topMargin.equalToSuperview()
            make.bottomMargin.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(mainView.snp.height)
            make.width.equalTo(mainView.snp.width)
        }
        
        
    }
}
