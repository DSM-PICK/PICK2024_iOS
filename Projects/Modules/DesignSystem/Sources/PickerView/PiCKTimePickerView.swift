import UIKit

enum PickerType {
    case hours
    case mins
    case period
}

public class PiCKTimePickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private let hoursArray = Array(00...23)
    private let minsArray = Array(00...59)
    private let periodArray = Array(1...10)
    
    public var periodText = Int()
    
    private var selectedPickerType: PickerType
    
    init(
        pickerType: PickerType
    ) {
        self.selectedPickerType = pickerType
        super.init(frame: .zero)
        self.delegate = self
        self.dataSource = self
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch selectedPickerType {
            case .hours:
                return hoursArray.count
            case .mins:
                return minsArray.count
            case .period:
                return periodArray.count
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        label.textColor = .neutral50
        label.font = .subTitle3M
        label.textAlignment = .center
        
        view.addSubview(label)

        switch selectedPickerType {
            case .hours:
                label.text = "\(hoursArray[row])"
            case .mins:
                label.text = "\(minsArray[row])"
            case .period:
                label.text = "\(periodArray[row])교시"
                periodText = periodArray[row]
        }
        return view
    }
    
    func setTimeArrayType(_ type: PickerType) {
        selectedPickerType = type
        reloadAllComponents()
    }
    
}
