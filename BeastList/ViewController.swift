//
//  ViewController.swift
//  BeastList
//
//  Created by لمياء فالح الدوسري on 05/05/1443 AH.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var newIntery: UITextField!
    
    var Note=note()
   
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource=self
        table.delegate = self
    }
    
    
    @IBAction func AddBtn(_ sender: UIButton) {
        ///to make sure the field is not empty
        if let note=newIntery.text{
            ///add the note no the array
        Note.notes.append("\(note)")
            table.beginUpdates()
            table.insertRows(at:[IndexPath(row: Note.notes.count-1, section: 0)], with: .automatic)
            table.endUpdates()
            
        }
        ///remove the text in the text field
        newIntery.text?.removeAll()


    }

    
   

}
extension ViewController:UITableViewDataSource{

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      return Note.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let call=tableView.dequeueReusableCell(withIdentifier: "Call", for: indexPath)
        call.textLabel?.text = Note.notes[indexPath.row]
        
        return call
    }
    
    
}

///note array
struct note{
    var notes:[String]=["task1","task2"]
}


