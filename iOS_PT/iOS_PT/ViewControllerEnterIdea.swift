
import UIKit

class ViewControllerEnterIdea: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet weak var Idea_description_outlet: UITextField!
    @IBOutlet weak var Idea_category_outlet: UITextField!

    var category_number: Int = 0;
    private var myPicker: UIPickerView {
        let myPicker = UIPickerView()
        myPicker.delegate = self
        return myPicker
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
myPicker.selectedRowInComponent(0) //GRUPPE
        Idea_category_outlet.inputAccessoryView = myPicker
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    var categories = ["Environment", "Health", "Science", "Art & Culture", "Sports", "Education"]


    func numberOfComponentsInPickerView( pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCategory = categories[row]
        category_number=row;
        Idea_category_outlet.text = selectedCategory
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return categories[row]
    }
    
    @IBAction func SubmitIdeaAction(sender: AnyObject) {


        var idea = Idea()

        idea.text=Idea_description_outlet.text;
        idea.category=category_number;
        idea.postToServerFunctionIdeaPush();


    }
}

