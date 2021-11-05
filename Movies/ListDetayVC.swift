import UIKit
import RealmSwift

class ListDetayVC: UIViewController{    
    @IBOutlet weak var imgBP: UIImageView!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblTitles: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var lblPopularity: UILabel!
    @IBOutlet weak var btnAdd: UIBarButtonItem!
    @IBOutlet weak var btnDelete: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(backgroundPosterDetail)")
        let data = try? Data(contentsOf: url!)
        imgBP.image = UIImage(data: data!)
        
        
        lblLanguage.numberOfLines = 0
        lblLanguage.lineBreakMode = .byWordWrapping
        lblLanguage.font = UIFont(name: "Arial", size: 18)
        lblLanguage.text = languageDetail
        lblLanguage.sizeToFit()
        
        lblTitles.numberOfLines = 0
        lblTitles.lineBreakMode = .byWordWrapping
        lblTitles.font = UIFont(name: "Arial", size: 18)
        lblTitles.text = titlesDetail
        lblTitles.sizeToFit()
        
        lblOverview.numberOfLines = 0
        lblOverview.lineBreakMode = .byWordWrapping
        lblOverview.font = UIFont(name: "Arial", size: 18)
        lblOverview.text = overviewDetail
        lblOverview.sizeToFit()
        
        lblPopularity.numberOfLines = 0
        lblPopularity.lineBreakMode = .byWordWrapping
        lblPopularity.font = UIFont(name: "Arial", size: 18)
        lblPopularity.text = popularityDetail
        lblPopularity.sizeToFit()
        
        let realm = try! Realm()
        
        if (realm.objects(Note.self).filter("id == \(detailId)").first != nil) {
            btnAdd.isEnabled = false
            btnDelete.isEnabled = true
        }
        else{
            btnAdd.isEnabled = true
            btnDelete.isEnabled = false
        }
    
    }
    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: false)
    }
    @IBAction func addFavorite(_ sender: Any) {
        let realm = try! Realm()
        
        let note = Note()
        note.id = detailId
        note.title = titlesDetail
        
        try! realm.write {
            realm.add(note)
        }
        if (realm.objects(Note.self).filter("id == \(detailId)").first != nil) {
            btnAdd.isEnabled = false
            btnDelete.isEnabled = true
        }
        else{
            btnAdd.isEnabled = true
            btnDelete.isEnabled = false
        }
    }
    @IBAction func deleteFavorite(_ sender: Any) {
        let realm = try! Realm()
        
        if let userObject = realm.objects(Note.self).filter("id == \(detailId)").first {
            print("In process of deleting")
            try! realm.write {
                realm.delete(userObject)
            }
            print("Object deleted.")
        }
        else{
            print("Object not found.")
        }
        if (realm.objects(Note.self).filter("id == \(detailId)").first != nil) {
            btnAdd.isEnabled = false
            btnDelete.isEnabled = true
        }
        else{
            btnAdd.isEnabled = true
            btnDelete.isEnabled = false
        }
    }
}
class Note: Object {
    @objc dynamic var id = 0
    @objc dynamic var title = ""
    @objc dynamic var created = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
    
