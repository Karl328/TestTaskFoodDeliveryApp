//
//  MenuTableViewCell.swift
//  TestTaskFoodDeliveryApp
//
//  Created by Линар Нигматзянов on 13/10/2022.
//

import UIKit
import Kingfisher
import SnapKit

final class MenuTableViewCell: UITableViewCell {
    static let identifier = "Cell"
    
   
    
    public var pizzaImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 75
        return image
    }()
    
    public var namePizzaLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    public var descriptionPizzaLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        return label
    }()
    
    private let priceView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = #colorLiteral(red: 1, green: 0.3348149955, blue: 0.4859694839, alpha: 1)
        view.layer.borderWidth = 1.3
        return view
    }()
    
    public var priceLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 0.3348149955, blue: 0.4859694839, alpha: 1)
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        labelConfig()
        configContentview()
        setConstraints()

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func labelConfig() {
        
    }
    private func setConstraints() {
        pizzaImage.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp_leftMargin).offset(20)
            make.top.equalTo(contentView.snp_topMargin).offset(20)
            make.height.equalTo(150)
            make.width.equalTo(150)
        }
        
        namePizzaLabel.snp.makeConstraints { make in
            make.left.equalTo(pizzaImage.snp.right).offset(50)
            make.top.equalTo(contentView.snp_topMargin).offset(20)
            make.right.equalTo(contentView.snp_rightMargin).offset(-10)
        }
        descriptionPizzaLabel.snp.makeConstraints { make in
            make.left.equalTo(pizzaImage.snp.right).offset(50)
            make.top.equalTo(namePizzaLabel.snp_bottomMargin).offset(10)
            make.right.equalTo(contentView.snp_rightMargin).offset(-10)
        }
        
        priceView.snp.makeConstraints { make in
            make.top.equalTo(descriptionPizzaLabel.snp_bottomMargin).offset(15)
            make.right.equalTo(contentView.snp_rightMargin).offset(-10)
            make.width.equalTo(100)
            make.height.equalTo(45)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.centerX.equalTo(priceView.snp.centerX)
            make.centerY.equalTo(priceView.snp.centerY)
        }
        
  
    }
 
    private func configContentview () {
        contentView.addSubview(pizzaImage)
        contentView.addSubview(namePizzaLabel)
        contentView.addSubview(descriptionPizzaLabel)
        contentView.addSubview(priceView)
        priceView.addSubview(priceLabel)
    }

}
