//
//  PrivacyViewController.swift
//  Rabatjuh
//
//  Created by Apple on 23/12/2022.
//

import UIKit

class PrivacyViewController: UIViewController {

    private let label = UILabel.Primary(
        text: AppString.Label.privacyTitle,
        font: .heading,
        textColor: UIColor.buttonPrimaryBackground,
        textAlignment: .center
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       
        setup()
        
        navigationController?.navigationBar.tintColor = .black
       

      
    }
    
    
    func setup(){
        view.addSubview(label)
        label.snp.makeConstraints{ (make) in
            make.centerX.centerY.equalToSuperview()
            
        }
    }
    


}
