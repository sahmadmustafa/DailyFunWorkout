//
//  StartWorkoutViewController.swift
//  Workout
//
//  Created by Ahmad Butt on 3/28/19.
//  Copyright © 2019 Ahmad Mustafa. All rights reserved.
//


import AVFoundation
import AVKit
import UIKit

class StartWorkoutViewController:UIViewController
{
    @IBOutlet var VwSwipeUp: UIView!
    @IBOutlet var imgVw: UIImageView!
    @IBOutlet var VwPlayer: UIView!
    
    @IBOutlet var TimeUpbutton: UIButton!

    
    
    @IBOutlet weak var playerView: UIView!
    var player: AVPlayer!
    var avpController: AVPlayerViewController?
    
    @IBAction func closeButtonPressed(_ sender: AnyObject)
    {
     //   self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
   override func viewDidAppear(_ animated: Bool)
   {
    
    
     avpController?.view.frame = playerView.frame
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TimeUpbutton.isHidden=true

        
        playVideoNow()
        
    //    TimeUpbutton.isHidden=true
//        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(StartWorkoutViewController.didSwipe(_:)))
//        swipeUp.direction = .up
//        self.VwSwipeUp.addGestureRecognizer(swipeUp)
        
        //    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
        //    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
        //    [self.view addGestureRecognizer:swipeDown];
        
        var value1: Int = UserDefaults.standard.integer(forKey: "DayNumber")
        
//        if(value1==0)
//        {
//            
//        let alertController = UIAlertController(title: "Please Note", message: "Once you Swipe Up the button and Video will start playing. After completion of exercise Just tap Time Up", preferredStyle: .alert)
//        
//        let action3 = UIAlertAction(title: "OK", style: .destructive) { (action:UIAlertAction) in
//            print("You've pressed the destructive");
//        }
//        
//        alertController.addAction(action3)
//        self.present(alertController, animated: true, completion: nil)
//        
//        }
        
        
        
    }
    
    // ...
    
    @objc func didSwipe(_ swipe: UISwipeGestureRecognizer?) {
        
        if swipe?.direction == .left {
            print("Swipe Left")
        } else if swipe?.direction == .right {
            print("Swipe Right")
        } else if swipe?.direction == .up {
            
            imgVw.isHidden = true
            print("Swipe Up")
            playVideoNow()
        } else if swipe?.direction == .down {
            print("Swipe Down")
        }
    }
    
    /*
     #pragma mark - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    func playVideoNow()
    {
        
        let moviePath = Bundle.main.path(forResource: "kids Fun Workout", ofType: "mp4")
        if let path = moviePath {
            let url = NSURL.fileURL(withPath: path)
            let item = AVPlayerItem(url: url)
            player = AVPlayer(playerItem: item)
            avpController = AVPlayerViewController()
            avpController?.player = self.player
            avpController?.view.frame = playerView.frame
            self.addChild(avpController!)
            view.addSubview(avpController!.view)
            player.play()
        
            TimeUpbutton.isHidden=false
            
            TimeUpbutton.layer.cornerRadius=4.0

            
            
//            var value1: Int = UserDefaults.standard.integer(forKey: "DayNumber")
//
//            if(value1==0)
//            {
//                UserDefaults.standard.set(1, forKey: "DayNumber")
//            }
//            else
//            {
//
//            value1 = value1 + 1
//            UserDefaults.standard.set(value1, forKey: "DayNumber")
//            }
//
        /*
        var testString = ""
        testString = Bundle.main.path(forResource: "tutorial", ofType: "mov") ?? ""
        let url = URL(string: testString)
        
        
        //    NSURL *url = [[NSURL alloc] initWithString:@""]; // url can be remote or local
        
        var player: AVPlayer? = nil
        if let url = url {
            player = AVPlayer(url: url)
        }
        // create a player view controller
        
        let controller = AVPlayerViewController()
        
        
        controller.view.frame = self.VwPlayer.frame
        //    _VwPlayer
        //    self.addChildViewController(controller);
        
        
        self.addChild(controller)
        //  view.addSubview(avpController!.view)
        
        self.VwPlayer.addSubview(controller.view)
        
        //  [self presentViewController:controller animated:YES completion:nil];
        controller.player = player
        player?.play()
 
    */
    }
    
}
    
    
    @IBAction func TimeUpNow11(_ sender: Any)
    {
        var value1: Int = UserDefaults.standard.integer(forKey: "DayNumber")
        
        if(value1==0)
        {
            UserDefaults.standard.set(1, forKey: "DayNumber")
        }
        else
        {
            
            value1 = value1 + 1
            UserDefaults.standard.set(value1, forKey: "DayNumber")
        }
        
        let alertController = UIAlertController(title: "Congradulations!", message: "You have completed Daily Fun Workout", preferredStyle: .alert)
        
        let action3 = UIAlertAction(title: "OK", style: .destructive) { (action:UIAlertAction) in
            print("You've pressed the destructive");
    self.navigationController?.popToRootViewController(animated: true)

        }
        
        alertController.addAction(action3)
        self.present(alertController, animated: true, completion: nil)
        
        
        
    }

    
    
    override func viewWillAppear(_ animated: Bool)
    {
      
            super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden=false
            self.title="START WORKOUT"

    
    }

}
