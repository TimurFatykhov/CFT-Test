//
//  MainTableViewController.swift
//  Table. Fatykhov Timur
//
//  Created by Educational on 27/05/17.
//  Copyright © 2017 Educational. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController
{
    @IBOutlet var tableItems: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        tableItems.delegate = self
        tableItems.dataSource = self
        
        // read input file
        parseJsonToArray()
    }
    
    
    // MARK: Read data
    var messageArray : [[String : String]] = [[:]]
    
    func parseJsonToArray()
    {
        // Looking for a path in the directory
        if let path = Bundle.main.url(forResource: "messages", withExtension: "json")
        {
            do
            {
                // Transform json in data
                let jsonData = try Data(contentsOf: path, options: .mappedIfSafe)
                do
                {
                    // Do data look like an Array?
                    messageArray = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions(rawValue: 0)) as! [[String : String]]
                    
                } catch let error as NSError {
                    print("Error: \(error)")
                }
            } catch let error as NSError {
                print("Error: \(error)")
            }
        }
        
        // Sort an array
        messageArray = messageArray.sorted()
            {(first : [String : String], second : [String : String]) -> Bool in
                return first["date"]! > second["date"]!
        }
        
    }
    
    
    // MARK: Build table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return messageArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        // New cell
        var cell : AnyObject
        
        if messageArray[indexPath.row]["type"]! == "text"
        {
            let textCell = tableItems.dequeueReusableCell(withIdentifier: "Text")! as! TextCell
            cell = textCell
            (cell as! TextCell).setOptions(options: messageArray[indexPath.row])
        }
        else if messageArray[indexPath.row]["type"]! == "social"
        {
            let socialCell = tableItems.dequeueReusableCell(withIdentifier: "Social")! as! SocialCell
            cell = socialCell
            (cell as! SocialCell).setOptions(options: messageArray[indexPath.row])
        }
        else
        {
            let imageCell = tableItems.dequeueReusableCell(withIdentifier: "Image")! as! ImageCell
            cell = imageCell
            (cell as! ImageCell).setOptions(options: messageArray[indexPath.row])
        }
        
        return cell as! UITableViewCell
    }
    
    
    // MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableItems.deselectRow(at: indexPath, animated: true)
        
        if messageArray[indexPath.row]["type"]! == "social"
        {
            if let url = NSURL(string: messageArray[indexPath.row]["source"]!)
            {
                UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
            }
        }
    }
    
    // MARK: Image send
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let controller = segue.destination as? ImageViewController
        {
            controller.image = (sender as! ImageCell).imageIcon.image
        }
    }
}
