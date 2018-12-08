
import UIKit

class StackViewGridController: UIViewController {
    let numberLabel = UILabel()
    
    let numberKeysArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", ".", ""]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        stackedGrid(rows: 4, columns: 1, rootView: view)
        print(numberLabel)
    }
    @objc func onButton(button: UIButton){
        let result = button.currentTitle ?? ""
        numberLabel.text = result
        print(result)
    }
    
    let amountDisplayLabel: UILabel = {
        let label = UILabel()
        
        label.backgroundColor = .green
        return label
    }()
    
    func stackedGrid(rows: Int, columns: Int, rootView: UIView){
        amountDisplayLabel.text = numberLabel.text
        
        // Init StackView
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.addArrangedSubview(amountDisplayLabel)
        for i in 1...numberKeysArray.count {
            let horizontalSv = UIStackView()
            horizontalSv.axis = .horizontal
            horizontalSv.alignment = .fill
            horizontalSv.distribution = .fillEqually
            horizontalSv.spacing = 5
            
            for _ in 1...columns {
                let button = UIButton()
                button.backgroundColor = .orange
                button.setTitle("\(i)", for: .normal)
                button.addTarget(self, action: #selector(onButton), for: .touchUpInside)
                horizontalSv.addArrangedSubview(button)
                amountDisplayLabel.text = button.currentTitle
            }
            stackView.addArrangedSubview(horizontalSv)
            
        }
        rootView.addSubview(stackView)
        
        fitParenLayout(stackView, parentView: rootView)
    }
    func fitParenLayout(_ child: UIView, parentView: UIView){
        amountDisplayLabel.bottomAnchor.constraint(equalTo: child.topAnchor)
        child.setAnchor(top: parentView.safeTopAnchor, left: parentView.safeLeftAnchor, bottom: nil, right: parentView.safeRightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
    }
    
}
