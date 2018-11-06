//
//  AllViewController.swift
//  My Diary
//
//  Created by Kanyanee P on 6/11/2561 BE.
//  Copyright © 2561 Kanyanee P. All rights reserved.
//

import UIKit
import Kingfisher

class AllViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var ImgView: UIImageView!
    
    var topicData: Topics?
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = topicData!.Topic_Name
        message.text = topicData!.Description
        //let url = URL(string:urlImg+topicData!.Image)
        //clip to bounds ตัดออก aspect fill ถ้าแนวตั้งจะขยายข้าง apect fit ปล่อยโล่ง
        let url = URL(string: "https://kanyanee.000webhostapp.com/comsci_1DayTrip/Image/"+topicData!.Image)
        ImgView.kf.setImage(with: url)
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
