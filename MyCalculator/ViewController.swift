//
//  ViewController.swift
//  MyCalculator
//
//  Created by Adem Hadrovic on 3/16/18.
//  Copyright © 2018 SSST. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen : Double = 0;
    var previousNumber : Double = 0;
    var performMath:Bool = false;
    var operation = 0;
    var result : String = "";
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performMath {
            resultLabel.text = String(sender.tag-1);
            numberOnScreen = Double(resultLabel.text!)!;
            performMath = false;
            
        }
        else{
            resultLabel.text = resultLabel.text! + String(sender.tag-1);
            numberOnScreen = Double(resultLabel.text!)!;
        }
        
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
    
        if resultLabel.text != "" && sender.tag != 11 && sender.tag != 16{
            
            previousNumber = Double(resultLabel.text!)!;
            
            switch sender.tag{
            case 12:
                resultLabel.text = "+";
                break;
            case 13:
                resultLabel.text = "-";
                break;
            case 14:
                resultLabel.text = "x";
                break;
            case 15:
                resultLabel.text = "/";
                break;
            default:
                break;
            }
            operation = sender.tag;
            performMath = true;
            
        }
        else if sender.tag == 16{
            switch operation{
            case 12:
                result = String(previousNumber + numberOnScreen);
                break;
            case 13:
               result = String(previousNumber - numberOnScreen);
                break;
            case 14:
                result = String(previousNumber * numberOnScreen);
                break;
            case 15:
                result = String(previousNumber / numberOnScreen);
                break;
            default:
                break;
            }
            resultLabel.text = result;
        }
        else if sender.tag == 11{
            resultLabel.text =  "";
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
        else{
            resultLabel.text = "ERROR";
        }
        

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

