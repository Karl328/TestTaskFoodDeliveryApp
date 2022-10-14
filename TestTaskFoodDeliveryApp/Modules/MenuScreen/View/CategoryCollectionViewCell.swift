//
//  CategoryCollectionViewCell.swift
//  TestTaskFoodDeliveryApp
//
//  Created by Линар Нигматзянов on 14/10/2022.
//

import UIKit
import SnapKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "Cell"
    
    private let mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.layer.borderColor = #colorLiteral(red: 1, green: 0.3348149955, blue: 0.4859694839, alpha: 1)
        view.layer.borderWidth = 1
        return view
    }()
    
    public let categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 0.3348149955, blue: 0.4859694839, alpha: 1)
        return label
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
        mainView.addSubview(categoryLabel)

    }
    
    // MARK: - setConstraints
    private func  setConstraints() {
        mainView.snp.makeConstraints { make in
            make.leftMargin.equalToSuperview()
            make.rightMargin.equalToSuperview()
            make.topMargin.equalToSuperview()
            make.bottomMargin.equalToSuperview()
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.centerY.equalTo(mainView.snp.centerY)
            make.centerX.equalTo(mainView.snp.centerX)
        }
        

        
    }
    
    func show() {
        mainView.backgroundColor = #colorLiteral(red: 0.9716030955, green: 0.8543170094, blue: 0.8893242478, alpha: 1)
        categoryLabel.font = .boldSystemFont(ofSize: 20)
        mainView.layer.borderWidth = 0
    }
    func hide() {
        mainView.backgroundColor = .clear
        categoryLabel.font = .systemFont(ofSize: 20)
        mainView.layer.borderWidth = 1
    }

}

