import UIKit
import RealmSwift

class TabBarC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        movieTitles.removeAll()
        
        let realm = try! Realm()
        
        let notes = realm.objects(Note.self)
        for note in notes {
            print("title:", note.title)
            movieTitles.append(note.title)
        }
    }
}
