import UIKit
import AVFoundation

class ListVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var collView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getList()
        collView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ListVCCell
    
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(poster[indexPath.row])")
        let data = try? Data(contentsOf: url!)
            cell.img.image = UIImage(data: data!)

            cell.lblTitle.numberOfLines = 0
            cell.lblTitle.lineBreakMode = .byWordWrapping
            cell.lblTitle.font = UIFont(name: "Arial", size: 14)
            cell.lblTitle.text = titles[indexPath.row]
            cell.lblTitle.sizeToFit()
        cell.img.layer.cornerRadius = 10
        cell.imgDetay.layer.cornerRadius = 10
        cell.imgTitle.layer.masksToBounds = true
        cell.imgTitle.layer.borderWidth = 1.5
        cell.imgTitle.layer.borderColor = UIColor.lightGray.cgColor
        cell.imgTitle.layer.cornerRadius = 10
        return cell
    }
   func collectionView(_ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath) {
       backgroundPosterDetail = backgroundPoster[indexPath.row]
       languageDetail = lang[indexPath.row]
       titlesDetail = titles[indexPath.row]
       overviewDetail = overview[indexPath.row]
       popularityDetail = popularity[indexPath.row]
       detailId = Int(movieId[indexPath.row])!
       
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
       let secondVC = storyboard.instantiateViewController(identifier: "ListDetayVC")
       
       secondVC.modalPresentationStyle = .fullScreen
       secondVC.modalTransitionStyle = .crossDissolve
       
       present(secondVC, animated: true, completion: nil)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
