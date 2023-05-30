//
//  StartViewController.swift
//  homework5.4
//
//  Created by Islam Erlan Uulu on 29/5/23.
//

import UIKit
import SnapKit


class StartViewController: UIViewController {
    
    private let getButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("GET REQUEST", for: .normal)
        view.setTitleColor( UIColor.red, for: .normal)
        view.backgroundColor = .green
        view.layer.cornerRadius = 10
        view.addTarget(self, action: #selector(goToGET), for: .touchUpInside)
        return view
    }()
    private let postButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("POST REQUEST", for: .normal)
        view.setTitleColor( UIColor.red, for: .normal)
        view.backgroundColor = .green
        view.layer.cornerRadius = 10
        view.addTarget(self, action: #selector(goToPOST), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        view.backgroundColor = .cyan
        
        
    }
    
    private func setData() {
        view.addSubview(getButton)
        view.addSubview(postButton)
        getButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.trailing.equalTo(-20)
            make.leading.equalTo(20)
            make.height.equalTo(65)
            make.width.equalTo(150)
        }
        postButton.snp.makeConstraints { make in
            make.top.equalTo(getButton.snp.bottom).offset(30)
            make.trailing.equalTo(-20)
            make.leading.equalTo(20)
            make.height.equalTo(65)
            make.width.equalTo(150)
        }
    }
    
    @objc private func goToGET(_ sender: UIButton) {
        navigationController?.pushViewController(ProductsViewController(), animated: true)
    }
    @objc private func goToPOST(_ sender: UIButton) {
        navigationController?.pushViewController(PostViewController(), animated: true)
    }
}
