//
//  ViewController.swift
//  TruthOrDare
//
//  Created by Cristian Rivera on 1/18/19.
//  Copyright © 2019 Cristian Rivera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var truthButton: UIButton!
    @IBOutlet weak var dareButton: UIButton!
    
    
    var truth:[String] = [
        "What are you scare of the most?",
        "what your most embarrasing momment?",
        "What the worse thing you ever done?",
        "What is your guilty pleasure?",
        "have you ever did drugs, what was it?"
    ];
    
    var dares:[String] = [
        "Ask an random person for their number",
        "Take two shots",
        "Dance with a random person",
        "Kiss the persoon next to you",
        "Show the last 10 picture you took"
    ];
    //remove later
    var tempString = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func randomTruth() {
        if truth.count > 0 {
            let randomTru:Int = Int.random(in:0 ..< truth.count);
            tempString = truth[randomTru];
            print(truth.count);
            print("this removing \(randomTru)");
            truth.remove(at: randomTru);
        }else{
            tempString = "no more truth";
            truthButton.isEnabled = false;
        }
        
    }
    
    func randomDares() {
        if dares.count > 0{
            let randomDare:Int = Int.random(in:0 ..< dares.count);
            tempString = dares[randomDare];
            dares.remove(at: randomDare)
        } else {
            tempString = "no more dare";
            dareButton.isEnabled = false;
        }
    }
    
    func gameFinish() {
        if dares.isEmpty && truth.isEmpty{
            tempString = "Game is finish"
            label.text = tempString
            label.textColor = .black;
            truthButton.isHidden = true;
            dareButton.isHidden = true;
        }
    }
    
    @IBAction func truthButton(_ sender: UIButton) {
        randomTruth()
        label.textColor = .blue;
        label.isHidden = false
        label.text  = tempString
        gameFinish();
    }
    
    @IBAction func dareButton(_ sender: UIButton) {
        randomDares()
        label.textColor = .red;
        label.isHidden = false;
        label.text  = tempString;
        gameFinish();
    }

}

