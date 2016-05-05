
import UIKit
import Foundation

class ViewImagesController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ButtonReturn: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    var index:Int!
    var listImagens = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        settingButtons()
    }
    
//MARK: - Ações gestos e butões
    
    @IBAction func gestureNext(sender: AnyObject) {
        self.nextImage()
    }


    @IBAction func gestureReturn(sender: AnyObject) {
        self.backImage()
    }
    
    func nextImage(){
        if !((self.index + 1) == self.listImagens.count) {
            self.index = self.index + 1
            setImageViewByIndex(self.index)
            settingButtons()
        }
    }
    
    func backImage(){
        if !(self.index == 0){
            self.index = self.index - 1
            setImageViewByIndex(self.index)
            settingButtons()
        }
    }
    @IBAction func touchButtonReturn(sender: AnyObject) {
        self.backImage()
    }
    
    @IBAction func touchButtonNext(sender: AnyObject) {
       self.nextImage()
    }
    
    func setImages(listImagens: [String], index: Int){
        self.listImagens = listImagens
        self.index = index
        setImageViewByIndex(self.index)
    }
    
    func setImageViewByIndex(index: Int){
//        todo obter imagem via string
//        self.imageView.image = self.listImagens[index]
        var urlImage = self.listImagens[index]
        var url = NSURL(string: urlImage)
        getDataFromUrl(url!) { data in
            dispatch_async(dispatch_get_main_queue()) {
                self.imageView.image = UIImage(data: data!)
//                self.hideActivityIndicator()
            }
            
        }
        setTitle()
        self.view.layoutIfNeeded()
    }
    
    func setTitle(){
        
        var titleView = "\(self.index + 1) de \(self.listImagens.count)"
        self.title = titleView
    }
    
    func getDataFromUrl(urL:NSURL, completion: ((data: NSData?) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(urL) { (data, response, error) in
            completion(data: data)
            }.resume()
    }
    
    func settingButtons(){
        if self.index == 0{
            if self.listImagens.count > 1{
                self.ButtonReturn.hidden = true
                self.buttonNext.hidden = false
            }else{
                self.ButtonReturn.hidden = true
                self.buttonNext.hidden = true
            }
        }else if self.index == (self.listImagens.count - 1){
            self.ButtonReturn.hidden = false
            self.buttonNext.hidden = true
        }else{
            self.ButtonReturn.hidden = false
            self.buttonNext.hidden = false
        }
    }

}
