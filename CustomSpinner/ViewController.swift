//
//  ViewController.swift
//  CustomSpinner
//
//  Created by Theik Chan on 1/2/18.
//  Copyright © 2018 Theik Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
        
        var operatorList = [String]()
        
        @IBOutlet weak var downBtn: UIButton!
        @IBOutlet weak var btn: UIButton!
        @IBOutlet weak var heightConstraint: NSLayoutConstraint!
        @IBOutlet weak var textField: UITextField!
        @IBOutlet weak var tableView: UITableView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            operatorList = ["Telenor","MPT","Ooredoo"]
            
            self.navigationItem.rightBarButtonItem = nil
            
            self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            
            tableView.delegate = self
            tableView.dataSource = self
            textField.delegate = self
            
            tableView.isHidden = true
            
            textField.text = "Telenor"
        }
        
        override func viewWillAppear(_ animated: Bool) {
            view.bringSubview(toFront: textField)
            view.bringSubview(toFront: tableView)
            view.bringSubview(toFront: btn!)
            view.bringSubview(toFront: downBtn)
        }
        
        @IBAction func textFieldChanged(_ sender: AnyObject) {
            tableView.isHidden = true
        }
        
        @IBAction func btnClick(_ sender: AnyObject) {
            tableView.isHidden = !tableView.isHidden
        }
        
        @IBAction func clicked(_ sender: AnyObject) {
            tableView.isHidden = !tableView.isHidden
        }
        override func viewDidLayoutSubviews()
        {
            // Assumption is we're supporting a small maximum number of entries
            // so will set height constraint to content size
            // Alternatively can set to another size, such as using row heights and setting frame
            heightConstraint.constant = tableView.contentSize.height
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        // Manage keyboard and tableView visibility
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
        {
            guard let touch: UITouch = touches.first else
            {
                return;
            }
            if touch.view != tableView
            {
                textField.endEditing(true)
                tableView.isHidden = true
            }
        }
        
        // Toggle the tableView visibility when click on textField
        func textFieldActive() {
            tableView.isHidden = !tableView.isHidden
        }
        
        // MARK: UITextFieldDelegate
        func textFieldDidEndEditing(_ textField: UITextField) {
            // TODO: Your app can do something when textField finishes editing
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
        // MARK: UITableViewDataSource
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return operatorList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
            // Set text from the data model
            cell.textLabel?.text = operatorList[indexPath.row]
            return cell
        }
        
        // MARK: UITableViewDelegate
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            textField.text = operatorList[indexPath.row]
            
            tableView.isHidden = true
            textField.endEditing(true)
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 0.0
        }
}

