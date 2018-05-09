//
//  DetailViewController.swift
//  LyricApp
//
//  Created by C4Q on 3/9/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var track: TrackWrapper!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBOutlet weak var songNameLabel: UILabel!
    
    @IBOutlet weak var lyricsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        songNameLabel.text = track.track.trackName
       

    }

    
    
    @IBAction func doneButtonPressed(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
