//
//  ShowSubFaqsVC.swift
//  Global Shopaholic
//
//  Created by Ahsan on 3/30/21.
//  Copyright © 2021 Ahsan. All rights reserved.
//

import UIKit

class ShowSubFaqsVC: UIViewController {
    
    @IBOutlet weak var HeaderLabel: UILabel!
    var headerText = ""
    @IBOutlet weak var MainView: UIView!
    var SubFAQ_QA = NSArray()
    var FAQdataSource = [FAQModel]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainView.layer.cornerRadius = 20
        MainView.clipsToBounds = true
        self.tableView.estimatedRowHeight = 100;
        self.tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        print(SubFAQ_QA)
        self.HeaderLabel.text = headerText
        
       //self.tableView.reloadData()
    }
    


}


extension ShowSubFaqsVC:UITableViewDataSource,UITableViewDelegate
{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return SubFAQ_QA.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("tableView")
        
        let data = SubFAQ_QA[indexPath.row] as! NSDictionary
        
       let title = data["title"] as! String
       let Des = data["description"] as! String
            let nib1 = UINib(nibName: "SubRow", bundle: nil)
                    
            tableView.register(nib1, forCellReuseIdentifier: "SubRow")
                    
                    
            let cell = tableView.dequeueReusableCell(withIdentifier: "SubRow") as! SubRow
            cell.QuestionsLbl.text = title
            cell.AnswerLbl.text = Des
            return cell
      
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
           let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 10))
       footerView.backgroundColor = .clear
       
           return footerView
       }

       func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
           return 10
       }
}
