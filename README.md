## MOVİES APP

1-Cocoapods kurulu değilse
Terminali açıp 
sudo gem install cocoapods
Komutunu çalıştırın. 
Sonra kurulum başlayıp tamamlanacak.

2- Klonladığınız klasör üstünde sağ tuş tıklayarak “Klasörde Yeni Terminal” seçeceğini tıklayın.

3- Açılan terminalde sırasıyla şu komutları çalıştırın

A) pod init

B) open podfile

Bu çalıştığında podfile içine readme de yazan SwiftyJson ve Realm kodlarını ekleyin.
Sonra kaydedip kapatın.

C)pod install komutunu çalıştırın.

4- Movies.xcworkspace adlı bir dosya oluşacak.

CocoaPods

# Podfile
use_frameworks!

target 'YOUR_TARGET_NAME' do
    pod 'SwiftyJSON'
    pod 'RealmSwift'
end

Replace YOUR_TARGET_NAME and then, in the Podfile directory, type:

$ pod install

# Screenshots

![zyro-image](https://user-images.githubusercontent.com/91742636/140605406-acd69e7e-8d1e-49f0-a306-89ee2df06841.png)

![zyro-image kopyası](https://user-images.githubusercontent.com/91742636/140605449-948231fa-63fb-48bb-be34-5bddce5b2f20.png)

![zyro-image kopyası 2](https://user-images.githubusercontent.com/91742636/140605548-ef8418b7-3a12-41cc-915c-75f986c2d484.png)


 # Contributing

Feel free to open an issue or submit a pull request if you have any improvement or feedback.

 # Author

Eda Barutçu edabarutcu@protonmail.com


