//
//  ViewController.swift
//  TestTaskFoodDeliveryApp
//
//  Created by Линар Нигматзянов on 13/10/2022.
//

import UIKit
import SnapKit
import Kingfisher

final class MenuViewController: UIViewController {
    
    var presenter: MenuViewPresenterProtocol!
    
    private var menuTableView: UITableView!
    private var bannersCollectionView : UICollectionView!
    private var categoryCollectionView : UICollectionView!
    private let progress = UIActivityIndicatorView(style: .large)
    private let mainScrollView = UIScrollView()
    private let mainView = UIView()
    
    private var cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20)
        label.text = "Москва"
        return label
    }()
    
    private var cityButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "arrowIcon"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configMainScrollView()
        configTableView()
        configCategoryCollectionView()
        configBannersCollectionView()
        addSubviews()
        setConstraints()
        setupUI()
    }
    
    
    private func setupUI () {
        view.backgroundColor = #colorLiteral(red: 0.9594156146, green: 0.9598115087, blue: 0.9719882607, alpha: 1)
        progress.color = .red
        progress.startAnimating()
        mainView.backgroundColor = #colorLiteral(red: 0.9594156146, green: 0.9598115087, blue: 0.9719882607, alpha: 1)
        
        guard let nc = self.navigationController else {return}
        setupAppearanceNavigationBar(with: nc)
    }
    
    private func configMainScrollView () {
        mainScrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height  )
        mainScrollView.showsVerticalScrollIndicator = true
        mainScrollView.delegate = self
        mainScrollView.isScrollEnabled = false
        
    }
    
    private func configTableView() {
        menuTableView = UITableView(frame: .zero, style: .grouped)
        menuTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier)
        menuTableView.dataSource = self
        menuTableView.delegate = self
        menuTableView.showsVerticalScrollIndicator = false
    }
    
    private func addSubviews() {
        
        mainScrollView.addSubview(mainView)
        view.addSubview(mainScrollView)
        view.addSubview(cityLabel)
        view.addSubview(cityButton)
        mainView.addSubview(menuTableView)
        mainView.addSubview(progress)
        mainView.addSubview(bannersCollectionView)
        mainView.addSubview(categoryCollectionView)
        
        
    }
    
    private func configCategoryCollectionView () {
        let layoutCategoryCV = UICollectionViewFlowLayout()
        categoryCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0 , height: 0), collectionViewLayout: layoutCategoryCV)
        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        categoryCollectionView.showsHorizontalScrollIndicator = false
        layoutCategoryCV.scrollDirection = .horizontal
        categoryCollectionView.backgroundColor = .clear
        layoutCategoryCV.minimumLineSpacing = 15
        categoryCollectionView.clipsToBounds = true
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        
    }
    
    private func configBannersCollectionView () {
        let layoutBannersCV = UICollectionViewFlowLayout()
        bannersCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0 , height: 0), collectionViewLayout: layoutBannersCV)
        bannersCollectionView.register(BannersCollectionViewCell.self, forCellWithReuseIdentifier: BannersCollectionViewCell.identifier)
        bannersCollectionView.showsHorizontalScrollIndicator = false
        layoutBannersCV.scrollDirection = .horizontal
        bannersCollectionView.backgroundColor = .clear
        bannersCollectionView.layer.cornerRadius = 15
        layoutBannersCV.minimumLineSpacing = 20
        bannersCollectionView.clipsToBounds = true
        bannersCollectionView.delegate = self
        bannersCollectionView.dataSource = self
        
    }
    
    //MARK: - extension setConstraints
    private func setConstraints() {
        mainScrollView.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        mainView.snp.makeConstraints { make in
            make.width.equalTo(mainScrollView.snp.width)
            make.top.equalTo(mainScrollView.snp.top)
            make.bottom.equalTo(mainView.snp.bottom)
            make.left.equalTo(mainScrollView.snp.left)
        }
        
        bannersCollectionView.snp.makeConstraints { make in
            make.height.equalTo(140)
            make.leftMargin.equalTo(mainView.snp_leftMargin).offset(15)
            make.rightMargin.equalTo(mainView.snp_rightMargin).offset(-15)
            make.top.equalTo(mainView.snp.top)
        }
        
        categoryCollectionView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leftMargin.equalTo(mainView.snp_leftMargin).offset(15)
            make.rightMargin.equalTo(mainView.snp_rightMargin).offset(-15)
            make.top.equalTo(bannersCollectionView.snp.bottom).offset(20)
        }
        
        menuTableView.snp.makeConstraints { make in
            make.left.equalTo(mainView.snp.left)
            make.right.equalTo(mainView.snp.right)
            make.top.equalTo(bannersCollectionView.snp.bottom).offset(70)
            make.bottom.equalTo(mainView.snp.bottom)
            make.height.equalTo(mainScrollView.snp.height)
        }
        
        progress.snp.makeConstraints { make in
            make.centerY.equalTo(mainView.snp.centerY)
            make.centerX.equalTo(mainView.snp.centerX)
        }
        
        cityLabel.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(40)
            make.width.equalTo(70)
        }
        
        cityButton.snp.makeConstraints { make in
            make.left.equalTo(cityLabel.snp.right).offset(5)
            make.centerY.equalTo(cityLabel.snp.centerY)
            make.height.equalTo(20)
            make.width.equalTo(20)
            
        }
        
        
        
    }
    
}
//MARK: - extension UICollectionViewDelegate, UICollectionViewDataSource
extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case bannersCollectionView:
            return presenter.bannerArray.count
        case categoryCollectionView:
            return presenter.categoryArray.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
        case categoryCollectionView:
            if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
                cell.show()
            }
            switch indexPath.row {
            case 0 :
                menuTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .bottom, animated: true)
            case 1 :
                menuTableView.scrollToRow(at: IndexPath(row: 14, section: 0), at: .bottom, animated: true)
            case 2:
                menuTableView.scrollToRow(at: IndexPath(row: 18, section: 0), at: .bottom, animated: true)
            default:
               break
            }
            
        default:
           break
        }
       
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
            cell.hide()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch  collectionView {
            
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CategoryCollectionViewCell
            cell.categoryLabel.text = presenter.categoryArray[indexPath.row]
            return cell
            
        case bannersCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BannersCollectionViewCell
            cell.imageView.image = UIImage(named: presenter.bannerArray[indexPath.row])
            cell.imageView.kf.indicatorType = .activity
            return cell
            
        default:
            
            return UICollectionViewCell()
        }
        
    }
}
//MARK: - extension UICollectionViewDelegateFlowLayout
extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case bannersCollectionView:
            return CGSize(width: bannersCollectionView.frame.width - 60, height: bannersCollectionView.frame.height)
        case categoryCollectionView:
            return CGSize(width: 120, height: 40)
        default:
            return CGSize()
        }
        
    }
}
//MARK: - extension UITableViewDelegate, UITableViewDataSource
extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.menuArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuTableViewCell
        
        cell.namePizzaLabel.text = presenter.menuArray?[indexPath.row].nombre
        cell.descriptionPizzaLabel.text = presenter.menuArray?[indexPath.row].descripcion
        cell.priceLabel.text = "от \(presenter.menuArray?[indexPath.row].precio ?? "0") р"
        cell.pizzaImage.kf.indicatorType = .activity
        guard let linkImage = presenter.menuArray?[indexPath.row].linkImagen else {return UITableViewCell()}
        cell.pizzaImage.kf.setImage(with: URL(string: linkImage))
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}

//MARK: - extension MenuViewProtocol

extension MenuViewController: MenuViewProtocol {
    func success() {
        menuTableView.reloadData()
        progress.stopAnimating()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    
}
//MARK: - extension scrollViewDidScroll
extension MenuViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == menuTableView {
            
            bannersCollectionView.contentOffset.y = menuTableView.contentOffset.y
            if menuTableView.contentOffset.y  > 30 {
                UIView.animate(withDuration: 0.45, delay: 0) { [weak self] in
                    self?.mainScrollView.contentOffset.y = 160
                }
            } else {
                UIView.animate(withDuration: 0.45, delay: 0) { [weak self] in
                    self?.mainScrollView.contentOffset.y = 0
                    
                }
                
            }
        }
        
    }
    
}

