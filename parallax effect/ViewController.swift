//
//  ViewController.swift
//  parallax effect
//
//  Created by apple on 24/03/18.
//  Copyright © 2018 Tanay Bhattacharjee. All rights reserved.
//

import UIKit
let screen_width = UIScreen.main.bounds.width
let screen_height = UIScreen.main.bounds.height
let widthFactor = screen_width/320.0
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
     var ary_data : NSArray = []
    var cell:cell?

    override func viewDidLoad() {
        super.viewDidLoad()
        ary_data = ["Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."]
    }
    //MARK: Height For View
    
    func heightForView(_ text: Any, font:UIFont, width:CGFloat) -> CGFloat {
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let Frame = NSString(string: text as! String).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font: font], context: nil)
        return Frame.size.height
    }
    
    
    //MARK:TableView DateSource Method
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.ary_data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! cell
       self.cell = cell
    
        cell.detail.text = ary_data[0] as? String
        cell.img.image = UIImage (named: "images")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let font = UIFont.boldSystemFont(ofSize: 15)
        var height1 = heightForView(ary_data[0] , font: font, width: screen_width - 20)
       
        if height1 > 1000 {
            height1 += 60
        }else if height1 > 8000{
            height1 += 100
        }
      
        return 153*widthFactor + height1 + 24 + 30
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let cll = self.cell else {
            return
        }
        if scrollView.contentOffset.y < 0 {
            print(scrollView.contentOffset.y)
            let factor = abs(scrollView.contentOffset.y)
            print(factor)
            print(cll.img.frame)
            cll.img.frame = CGRect.init(x: 0, y: scrollView.contentOffset.y + 20, width: screen_width, height: 153*widthFactor + factor)
            print(cll.frame)
        }
    }

}

