//
//  ViewController.swift
//
//  Created by Andrey Golovin on 17.02.17.
//  Copyright © 2017 Andrey Golovin. All rights reserved.
//

import UIKit

class MediaCell: UITableViewCell {
    @IBOutlet weak var playerView: AGVideoPlayerView!
}

class ViewController: UIViewController {

    var itemString: [String]!
    var images: [URL?]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemString = ["http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_1mb.mp4",
                      "http://yt-dash-mse-test.commondatastorage.googleapis.com/media/car-20120827-85.mp4",
                      "",
                      ""]
        
        images = [URL(string: "https://i.ytimg.com/vi/aqz-KE-bpKQ/maxresdefault.jpg"),
                  URL(string: "http://www.bialystok.pl/resource/video-thumb/192/334/6102/14724/750x415.jpg"),
                  URL(string: "https://www.gamemonday.com/wp-content/uploads/2018/01/maplestory-m-en-reviews-01.jpg"),
                  URL(string: "http://s.isanook.com/ga/0/ui/191/959505/01_1430397240.jpg")]
        
//        images = [nil,
//                  nil,
//                  nil,
//                  nil]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaCell
        let index = indexPath.row % 4
        print("index", index)
        if itemString[index] != "" {
            cell.playerView.isHidden = false
            print("if")
            let url = URL(string: itemString[index])
            let video = url
            cell.playerView.videoUrl = video
            cell.playerView.previewImageUrl = images[index]
            cell.playerView.shouldAutoplay = false
            cell.playerView.shouldAutoRepeat = true
            cell.playerView.showsCustomControls = false
            cell.playerView.shouldSwitchToFullscreen = true
        } else {
            print("else")
            cell.playerView.isHidden = true
//            let image = images[index]
//            cell.playerView.previewImageUrl = image
        }
        
        return cell
    }
}
