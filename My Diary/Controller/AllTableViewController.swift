//
//  AllTableViewController.swift
//  My Diary
//
//  Created by Kanyanee P on 6/11/2561 BE.
//  Copyright © 2561 Kanyanee P. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class AllTableViewController: UITableViewController {
    var topics: [Topics] = []
    
    func getJSONFromUrl(){
        
        Alamofire.request(requestTopic).responseJSON{ response in
            print(response)
            
            if response.response?.statusCode == 200{
                do{
                    
                    // let i = JSON(resData.data)
                    //print(i["contacts"][0]["email"].stringValue)
                    let decode = JSONDecoder()
                    let JsonData = try decode.decode([Topics].self, from: response.data!)
                    //print(JsonData)
                    //let ii = requestContacts
                    self.topics = JsonData//array contacts
                    self.tableView.reloadData()
                    
                }catch{
                    print(error)
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        _ = UINib(nibName: "AllTableViewCell", bundle: nil)
        tableView.register(AllTableViewCell.self, forCellReuseIdentifier: "MyCell")

        getJSONFromUrl()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.topics.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! AllTableViewCell
        //let cell = tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        let object = self.topics[indexPath.row].Topic_Name
        
        cell.textLabel?.text = object
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(indexPath.row)
        //print(topics[indexPath.row])
        let vc = AllViewController()
        vc.topicData = topics[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 
    
}
