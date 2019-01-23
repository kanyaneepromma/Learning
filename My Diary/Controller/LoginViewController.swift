//
//  LoginViewController.swift
//  My Diary
//
//  Created by Kanyanee P on 19/11/2561 BE.
//  Copyright © 2561 Kanyanee P. All rights reserved.
//

import UIKit
import AWSAuthUI
import AWSCore
import AWSDynamoDB

@objcMembers
class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkforLogIn()
    }
    
    @IBAction func doBtnLogout(_ sender: Any){
        AWSSignInManager.sharedInstance().logout{ (value,error) in
            self.checkforLogIn()
        }
    }
    func checkforLogIn(){
    
        if !AWSSignInManager.sharedInstance().isLoggedIn{
            AWSAuthUIViewController.presentViewController(with: self.navigationController!, configuration: nil){
                (provider, error) in
                if (error == nil){
                    print("Success")
                }
                else{
                    print(error?.localizedDescription ?? "No value")
                }
            }
        }
        else{
            createNote()
        }  
        
    }
    func createNote(){
        guard let note = Notes() else {return}
        note._noteId = AWSIdentityManager.default().identityId
        note._noteId = "123"
        note._content = "Text For my note"
        note._creationDate = Date().timeIntervalSince1970 as NSNumber
        let df = DateFormatter()
        df.dateStyle = .short
        df.timeStyle = .short
        note._title = "My note on \(df.string(from: Date()))"
        
    }
    func saveNote(note : Notes){
        let dbObjMapper = AWSDynamoDBObjectMapper.default()
        dbObjMapper.save(note){ (error) in
            print( error?.localizedDescription ?? "No error" )
        }
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
