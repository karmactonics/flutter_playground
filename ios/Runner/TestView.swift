import UIKit

class TestView : NSObject, FlutterPlatformView {
    
    let frame :CGRect
    let viewId :Int64
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.frame = self.frame
        view.backgroundColor = .gray
        return view;
    }()
    
    init(_ frame: CGRect, viewId: Int64, args: Any?) {
        self.frame = frame
        self.viewId = viewId
    }
    
    func view() -> UIView {
        let view = mainView
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(changeColor(gesture:)))
        view.addGestureRecognizer(tapGesture)
        
        let label = UILabel()
        label.text = "hello, Platform View"
        label.sizeToFit()
        view.addSubview(label)
//        label.center = view.center
        
        return view;
    }
    
    @objc func changeColor(gesture: UITapGestureRecognizer){
        mainView.backgroundColor = .red
    }
}

class TestViewFactory: NSObject, FlutterPlatformViewFactory {
    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return TestView(frame, viewId: viewId, args: args)
    }
}
