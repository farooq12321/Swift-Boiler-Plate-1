//
//  ReviewsViewController.swift
//  Rabatjuh
//
//  Created by Apple on 30/11/2022.
//

import UIKit

class ReviewsViewController: UIViewController {
   
    
    // MARK: - Data
    var ReviewData = [
        Review(userImage: "userImage", userName: "Sheraz Ahmed", Reviews: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",Date:"12-12-2022"),
        Review(userImage: "userImage", userName: "Sheraz Ahmed", Reviews: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",Date:"12-12-2022"),
        Review(userImage: "userImage", userName: "Sheraz Ahmed", Reviews: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",Date:"12-12-2022"),
        Review(userImage: "userImage", userName: "Sheraz Ahmed", Reviews: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",Date:"12-12-2022"),
        Review(userImage: "userImage", userName: "Sheraz Ahmed", Reviews: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",Date:"12-12-2022"),
        Review(userImage: "userImage", userName: "Sheraz Ahmed", Reviews: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",Date:"12-12-2022"),
        Review(userImage: "userImage", userName: "Sheraz Ahmed", Reviews: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",Date:"12-12-2022"),
        Review(userImage: "userImage", userName: "Sheraz Ahmed", Reviews: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",Date:"12-12-2022"),
        Review(userImage: "userImage", userName: "Sheraz Ahmed", Reviews: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",Date:"12-12-2022")
    ]

    // MARK: - Body

    private let reviewsTableVeiw = UITableView.TableVeiw()

    // MARK: - Footer
    
    private let footerView = UIView.veiw(
        height: UIConstant.veiw.height,
        backgroundcolor: UIColor.viewbackgroungColor,
        cornerradius:UIConstant.veiw.cornerradius
    )
    
    var userImage = UIImageView.UserImage(
        name: AppString.Image.user,
        height: UIConstant.image.height,
        width: UIConstant.image.width
    )
    
    private lazy var txtReview = UITextField.Primary(
       placeholder: AppString.Textfield.review,
        font: UIFont.subheading,
        textColor: UIColor.subheading
    
    )
    

    
    
    
    var btnaddreview = UIButton.PreSecondary(backgroundColor: UIColor.buttonSecondaryBackground, cornerRadius: UIConstant.Button.btnsecondaryCornerRaidus,
        imageName: AppString.Image.addreview,
        target: self,
        action: #selector(addReview)
    )
    
    private lazy var Footerstack = UIStackView(arrangedSubviews: [userImage,txtReview,btnaddreview],
     axis: .horizontal,
     spacing: UIConstant.TextField.spacing
     
    )
    

    // MARK: - Variables

    
    // MARK: - ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Setup()
        configureViews()
        
        reviewsTableVeiw.reloadData()
        

    }

 

    
    // MARK: - Actions

@objc
func addReview(_ sender: Any){
    
    guard let data = txtReview.text
    else{
        return
    }
    
    let date = Date()
    let dateFormatter = DateFormatter()
     
    dateFormatter.dateFormat = "dd-MM-yyyy"
     
    let result = dateFormatter.string(from: date)
    print("result\(result)")
 
    let today = Date()
    // 2. Pick the date components
    let hours   = (Calendar.current.component(.hour, from: today))
    let minutes = (Calendar.current.component(.minute, from: today))
    let seconds = (Calendar.current.component(.second, from: today))
    // 3. Show the time
    print("today is \(hours):\(minutes):\(seconds)")
    print("today date is\(today)")
    
    ReviewData.append(Review.init(userImage: "userImage", userName: "Sheraz Ahmed", Reviews: data, Date: result))//("\(today)\(hours):\(minutes):\(seconds)")))
    
//    ReviewData.append(Review.init(userImage: "userImage", userName: "Sheraz Ahmed", Reviews: data, Date: "\(result):\(hours):\(minutes):\(seconds)"))//("\(today)\(hours):\(minutes):\(seconds)")))
    reviewsTableVeiw.reloadData()
    txtReview.text = ""
  
}
    
}

// MARK: - Extension

private extension ReviewsViewController {
    func Setup() {
        reviewsTableVeiw.delegate = self
        reviewsTableVeiw.dataSource = self
        
        reviewsTableVeiw.register(ReviewsTableViewCell.self, forCellReuseIdentifier: ReviewsTableViewCell.identifier)
        reviewsTableVeiw.separatorStyle = .singleLine
       
      }

  }

// MARK: - Extension

// Setup Views
private extension ReviewsViewController {
    func configureViews() {
        
        self.view.addSubview(reviewsTableVeiw)
        self.view.addSubview(footerView)
        footerView.addSubview(Footerstack)


        activateConstrains()
    }
    
    func activateConstrains() {
        reviewsTableVeiw.snp.makeConstraints{ (make) in
            make.edges.equalToSuperview()
         
        }
        footerView.snp.makeConstraints{ (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
         
        }
    
        Footerstack.snp.makeConstraints{ (make) in
            
            make.left.right.top.equalTo(footerView.layoutMarginsGuide)
            make.bottom.equalToSuperview().offset(-20)
        }

    }
}

// MARK: - Extension

// Setup Views
 extension ReviewsViewController: UITableViewDelegate, UITableViewDataSource{

 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReviewData.count
   }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
           let cell = tableView.dequeueReusableCell(withIdentifier: ReviewsTableViewCell.identifier,for: indexPath) as! ReviewsTableViewCell
            cell.userImage.image = UIImage(named: ReviewData[indexPath.row].userImage)
            cell.lblName.text = ReviewData[indexPath.row].userName
            cell.lblReviews.text = ReviewData[indexPath.row].Reviews
        cell.lblDate.text =  ReviewData[indexPath.row].Date
            cell.selectionStyle = .none
     
        
            return cell
     }
    
    
}






