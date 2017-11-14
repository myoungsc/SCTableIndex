# SCTableIndex

[![CI Status](http://img.shields.io/travis/myoungsc.dev@gmail.com/SCTableIndex.svg?style=flat)](https://travis-ci.org/myoungsc.dev@gmail.com/SCTableIndex)
[![Version](https://img.shields.io/cocoapods/v/SCTableIndex.svg?style=flat)](http://cocoapods.org/pods/SCTableIndex)
[![License](https://img.shields.io/cocoapods/l/SCTableIndex.svg?style=flat)](http://cocoapods.org/pods/SCTableIndex)
[![Platform](https://img.shields.io/cocoapods/p/SCTableIndex.svg?style=flat)](http://cocoapods.org/pods/SCTableIndex)

## Description
SCTableIndex is tableview item index list not use section Header. If you set the sorted item as a string array, it makes a table of contents with the first letter. Then click on the letter to move the table view to the first item.

## ScreenShot
![](https://github.com/myoungsc/SCTableIndex/blob/master/SCTableIndex.gif)

## Requirements
```
* Swift 4
* XCode 9.1
* iOS 9.0 (Min SDK)
```

## Installation
SCTableIndex is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
//Swift 4.0
pod "SCTableIndex"

//After
pod install
```

## How To Use
```Swift
import SCTableIndex

arrItem.sort()
sctbindex.delegate = self
//Use Selector Font, HelveticaNeue-Medium is Normal Font
//sctbindex.initialFont = UIFont(name: "HelveticaNeue-Medium", size: 13)!
//Use Selector initial Text Color, black is Normal Color
//sctbindex.initialTextColor = UIColor(red: 50.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 1.0)
//String Array item
sctbindex.setView(arrItem)


//MARK: SCTableIndex Delegate
extension ViewController: SCTableIndexDelegate {
    // Move starting point item that select initial text
    func scTableIndexReturnInitialText(_ strInitial: String, index: Int) {
        tbMain.scrollToRow(at: IndexPath(row: index, section: 0), at: .top, animated: true)
    }
}
```


## Author
myoung

[HomePage](http://devsc.tistory.com)

<myoungsc.dev@gmail.com>

## License
SCTableIndex is available under the MIT license. See the LICENSE file for more info.
