//
//  ViewController.swift
//  ToDoList2019
//
//  Created by Osama on 5/22/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myAlertView: UIView!
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    
    var data: [ToDoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }
    
    func loadData(){
        
        
        NetworkClient.performRequest([ToDoModel].self, router: APIRouter.getTodoLists, success: { [weak self] (models) in
            self?.data = models
            self?.myTableView.reloadData()
        }) { [weak self] (error) in
            self?.displayError(error.localizedDescription)
            
        }
        
        
    }
    
    func displayError(_ text: String){
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell") as! ToDoListCell
        cell.configure(data: self.data[indexPath.row])
        
        return cell
        
    }
    
    @IBAction func pressedOnAdd(_ sender: UIBarButtonItem) {
       
        UIView.animate(withDuration: 0.3) {
            self.myAlertView.alpha = 1
        }
        
    }
    
    
    @IBAction func didPressAddNote(_ sender: UIButton) {
        guard let titleText = dataTextField.text, let descText = descriptionTextField.text, titleText.isEmpty == false, descText.isEmpty == false else {
            return
        }
        
        
        NetworkClient.performRequest([ToDoModel].self, router: APIRouter.addToDo(title: titleText, description: descText), success: { [weak self] (models) in
            self?.data = models
            self?.myTableView.reloadData()
        }) { [weak self] (error) in
            self?.displayError(error.localizedDescription)
            
        }
        
        UIView.animate(withDuration: 0.2) {
            self.myAlertView.alpha = 0
        }
        
        dataTextField.text = ""
        descriptionTextField.text = ""
    }
    
    @IBAction func didPressCancel(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            self.myAlertView.alpha = 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

}

