//
//  PostViewController.swift
//  homework5.4
//
//  Created by Islam Erlan Uulu on 29/5/23.
//

import UIKit

class PostViewController: UIViewController {
    private let tf1: UITextField = {
        let view = UITextField()
        view.placeholder = "    INPUT ID"
        view.backgroundColor = .lightGray
        view.keyboardType = .numberPad
        view.layer.cornerRadius = 10
        return view
    }()
    private let tf2: UITextField = {
        let view = UITextField()
        view.placeholder = "   Input Product Title"
        view.backgroundColor = .lightGray
        view.keyboardType = .numberPad
        view.layer.cornerRadius = 10
        return view
    }()
    private let post: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("POST", for: .normal)
        view.setTitleColor( UIColor.black, for: .normal)
        view.backgroundColor = .red
        view.layer.cornerRadius = 10
        view.addTarget(self, action: #selector(post(sender:)), for: .touchUpInside)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        view.backgroundColor = .green
    }
    private func setData() {
        view.addSubview(tf1)
        view.addSubview(tf2)
        view.addSubview(post)
        tf1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.trailing.equalTo(-20)
            make.leading.equalTo(20)
            make.height.equalTo(55)
            make.width.equalTo(150)
        }
        tf2.snp.makeConstraints { make in
            make.top.equalTo(tf1.snp.bottom).offset(20)
            make.trailing.equalTo(-20)
            make.leading.equalTo(20)
            make.height.equalTo(55)
            make.width.equalTo(150)
        }
        post.snp.makeConstraints { make in
            make.top.equalTo(tf2.snp.bottom).offset(37)
            make.trailing.equalTo(-20)
            make.leading.equalTo(20)
            make.height.equalTo(65)
            make.width.equalTo(150)
        }
    }
    @objc private func post(sender: UIButton){
//        showAlert(title: "OK", message: "hello")
        
        ApiManager.shared.postRequest(id: Int(tf1.text!) ?? 0,
                                      title: tf2.text ?? "") { result in
            switch result {
            case .success(let code):
                DispatchQueue.main.async {
                    self.showAlert(title: "Status code", message: "Your Status Code IS: \(code)")
                }
            case .failure(let failure):
                print(failure.localizedDescription)
                break
            }
        }
    }
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
