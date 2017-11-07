//
//  ViewController.swift
//  SimonSaysOfficial
//
//  Created by Tim Snelling on 11/5/17.
//  Copyright © 2017 Tim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Initial variable set-up
    var Leader = ""
    var Follower = ""
    var lengthL = 0
    var lengthF = 0
    var pass = true
    var time = 0
    var num = 0
    var speed = true
    var speedchecked = true
    
    //Initial visuals set-up
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var Yellow: UIButton!
    @IBOutlet weak var Green: UIButton!
    @IBOutlet weak var Red: UIButton!
    @IBOutlet weak var Blue: UIButton!
    //Initiates the Game when the start button is pressed
    @IBAction func Start(_ sender: UIButton) {
        if sender.tag == 0{
        pass = true
        Leader = ""
        Follower = ""
        Leader = Leader + GenerateLeader()
        ShowLeader(Leader: Leader)
        }
        else if sender.tag > 0 && sender.tag < 5{
            num = sender.tag
        //Allows for user input until sequence length matches leader
            switch num {
            case 1:
            Follower = Follower + "1"
            case 2:
            Follower = Follower + "2"
            case 3:
            Follower = Follower + "3"
            case 4:
            Follower = Follower + "4"
            default:
            Follower = Follower + "RESET_MOST_LIKELY_UNLESS_YOU_ARE_BEYOND_THIS_MANY_CHARACTERS_IN_WHICH_CASE_VERY_IMPRESSIVE"
            }
            //Identifies number of characters in each of the sequences
            lengthL = Leader.characters.count
            lengthF = Follower.characters.count
            if lengthF >= lengthL {
            //Compares leader and follower sequences, reacts accordingly
            pass = Judge(Leader: Leader,Follower: Follower)
                if pass == true && speedchecked == true{
                    Leader = Leader + GenerateLeader()
                    ShowLeader(Leader: Leader)
                    Follower = ""
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        TitleLabel.text = Title[myIndex]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Generates a value to be Appended to the leader
    func GenerateLeader() -> String{
        var LeaderApp = ""
        LeaderApp = String(arc4random_uniform(4)+1)
        return LeaderApp
    }

    //Displays the leader sequence
    func ShowLeader(Leader: String){
        for c in Leader.characters{
            if (Int(String(c)) == 1){
                GreenOff()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.GreenOn()
                }
            }
            else if (Int(String(c)) == 2){
                RedOff()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.RedOn()
                }
            }
            else if (Int(String(c)) == 3){
                YellowOff()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.YellowOn()
                }
            }
            else {
                BlueOff()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.BlueOn()
                }
            }
        }
    }
    
    //Determines whether the leader and follower sequence match, flashes buttons accordingly, uses time delay
    func Judge(Leader: String, Follower: String) -> Bool{
        if Follower == Leader{
            pass = true
            LightsOff()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.LightsON()
            }
            LightsOff()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.LightsON()
            }
            LightsOff()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.LightsON()
            }
        }
        else{ pass = false
            LightsOff()
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.LightsON()
            }
        }
        return pass
    }
    
    // Determines whether or not the timer was beaten (5 sec interval per submission)
    var timer = Timer()
    func ScheduledTimer(){
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.LostRace), userInfo: nil, repeats: true)
    }
    
    func LostRace() -> Bool{
        let speed = false
        return speed
    }
    
    func SpeedCheck(speed: Bool) -> Bool{
        let speedchecked = speed
        return speedchecked
    }
    
    // self explanitory (button effects)
    func LightsON(){
        Green.alpha = 1.0
        Red.alpha = 1.0
        Yellow.alpha = 1.0
        Blue.alpha = 1.0
    }
    
    func LightsOff(){
        Green.alpha = 0.0
        Red.alpha = 0.0
        Yellow.alpha = 0.0
        Blue.alpha = 0.0
    }
    
    func GreenOn(){
        Green.alpha = 1.0
    }
    
    func RedOn(){
        Red.alpha = 1.0
    }
    
    func YellowOn(){
        Yellow.alpha = 1.0
    }
    
    func BlueOn(){
        Blue.alpha = 1.0
    }
    
    func GreenOff(){
        Green.alpha = 0.0
    }
    
    func RedOff(){
        Red.alpha = 0.0
    }
    
    func YellowOff(){
        Yellow.alpha = 0.0
    }
    
    func BlueOff(){
        Blue.alpha = 0.0
    }
    
}
