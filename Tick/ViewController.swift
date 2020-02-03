//
//  ViewController.swift
//  Tick
//
//  Created by mark on 26/11/2019.
//  Copyright © 2019 mark. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    
    @IBOutlet weak var checkListTableView: NSTableView!
    @IBOutlet var tableHeaderView: NSTableHeaderView!
    
    @IBOutlet weak var headerButton: NSButton!
    
    @IBOutlet weak var list1Button: NSButton!
    @IBOutlet weak var list2Button: NSButton!
    @IBOutlet weak var list3Button: NSButton!
    @IBOutlet weak var list4Button: NSButton!
    @IBOutlet weak var list5Button: NSButton!
    @IBOutlet weak var list6Button: NSButton!
    @IBOutlet weak var list7Button: NSButton!
    
    @IBOutlet weak var cursorBox: NSBox!
    
    @IBOutlet weak var heightSlider: NSSlider!
    @IBOutlet weak var dragButton: NSButton!
    
    @IBOutlet var optionsMenu: NSMenu!
    @IBOutlet weak var optionsButton: NSButton!
    @IBOutlet weak var textField: NSTextField!
    
    var list = [[String: String]]()
    var nextList = [[String: String]]()
    let defaults = UserDefaults.standard
    var moveToNextList = false
    var dataKey = "data"
    var moveDataKey = ""
    var dragButtonMouseDown = false
    var isHeaderShown = false
    var currentDay = 0
    
    /*
    // Set up reset sheet
    lazy var sheetViewController: NSViewController = {
        return self.storyboard!.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("sheetViewController"))
            as! NSViewController
    
    
    }()
    */
        
        let strokeEffect: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.double.rawValue,
            NSAttributedString.Key.foregroundColor: NSColor.gray,
            NSAttributedString.Key.strikethroughColor: NSColor.red,
        ]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            changeData("data")
            // Do any additional setup after loading the view.
            optionsButton.menu = optionsMenu
            checkListTableView.registerForDraggedTypes([NSPasteboard.PasteboardType.string])
            
        }
    override func viewDidLayout() {
        if isHeaderShown {
        }else{
        checkListTableView.headerView = nil
        }
    }
    
    override func viewWillAppear() {
        //self.view.window?.appearance = NSAppearance(named: NSAppearance.Name.vibrantLight)
        
        var day = Date().dayNumberOfWeek()!
        // sun 1,mon 2, tue 3, wed 4, thu 5, fri 6, sat 7
        if day == 1 {
            day = 7
        }else{
            day = day - 1
        }
        
        //print(day)
        if day == 1 {
            list1Button.performClick((Any).self)
            currentDay = 1
        }else if day == 2 {
            list2Button.performClick((Any).self)
            currentDay = 2
        }else if day == 3 {
            list3Button.performClick((Any).self)
            currentDay = 3
        }else if day == 4 {
            list4Button.performClick((Any).self)
            currentDay = 4
        }else if day == 5 {
            list5Button.performClick((Any).self)
            currentDay = 5
        }else if day == 6 {
            list6Button.performClick((Any).self)
            currentDay = 6
        }else if day == 7 {
            list7Button.performClick((Any).self)
            currentDay = 7
        }
    }

        override var representedObject: Any? {
            didSet {
            // Update the view, if already loaded.
            }
        }
    
    func changeData(_ listToChangeTo: String) {

        // check if list is empty

        if defaults.object(forKey: listToChangeTo) == nil {
            //moveToNextList = false
/*
            let appDelegate = NSApplication.shared.delegate as! AppDelegate
                  let statusItem = appDelegate.statusItem
                  statusItem.button?.title = "✔︎"
*/
 return
        }else{
       
        // if we are moving non completed items to the next list
        
            if moveToNextList {
                nextList = ((UserDefaults.standard.value(forKey: listToChangeTo) as? [[String: String]])!)
            }else{
                
        // otherwise load corresponding list
                
        list = ((UserDefaults.standard.value(forKey: listToChangeTo) as? [[String: String]])!)
                dataKey = listToChangeTo
        }
        }
        //moveToNextList = false
    }
    
    
    @IBAction func optionsMenuClicked(_ sender: NSButton) {
        optionsMenu.popUp(positioning: optionsMenu.item(at: 0), at: NSEvent.mouseLocation, in: nil)
    }
    
    @IBAction func quitMenuClicked(_ sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
    
    @IBAction func headerButtonClicked(_ sender: NSButton) {
        if sender.state == NSControl.StateValue.off {
            
            print("off")
            isHeaderShown = false
            checkListTableView.headerView = nil
        }else{
            isHeaderShown = true
            checkListTableView.headerView = tableHeaderView
            print("on")
            }
    }
    
    @IBAction func listButtonsClicked(_ sender: NSButton) {
        list1Button.state = sender == list1Button ? NSControl.StateValue.on : NSControl.StateValue.off
        list2Button.state = sender == list2Button ? NSControl.StateValue.on : NSControl.StateValue.off
        list3Button.state = sender == list3Button ? NSControl.StateValue.on : NSControl.StateValue.off
        list4Button.state = sender == list4Button ? NSControl.StateValue.on : NSControl.StateValue.off
        list5Button.state = sender == list5Button ? NSControl.StateValue.on : NSControl.StateValue.off
        list6Button.state = sender == list6Button ? NSControl.StateValue.on : NSControl.StateValue.off
        list7Button.state = sender == list7Button ? NSControl.StateValue.on : NSControl.StateValue.off


        if list1Button.state == NSControl.StateValue.on {
            //print(1)
            list.removeAll()
            dataKey = "data"
            changeData(dataKey)
            checkListTableView.reloadData()
            //updateMenuIconTasks()
       
        }else if list2Button.state == NSControl.StateValue.on {
            //print(2)
            list.removeAll()
            dataKey = "data2"
            dataKey = "data2"
            changeData(dataKey)
            checkListTableView.reloadData()
            //updateMenuIconTasks()
            
        }else if list3Button.state == NSControl.StateValue.on {
            //print(3)
            list.removeAll()
            dataKey = "data3"
            changeData(dataKey)
            checkListTableView.reloadData()
            //updateMenuIconTasks()
            
        }else if list4Button.state == NSControl.StateValue.on {
            //print(4)
            list.removeAll()
            dataKey = "data4"
            changeData(dataKey)
            checkListTableView.reloadData()
            //updateMenuIconTasks()
            
        }else if list5Button.state == NSControl.StateValue.on {
            //print(5)
            list.removeAll()
            dataKey = "data5"
            changeData(dataKey)
            checkListTableView.reloadData()
            //updateMenuIconTasks()
        
        }else if list6Button.state == NSControl.StateValue.on {
            //print(6)
            list.removeAll()
            dataKey = "data6"
            changeData(dataKey)
            checkListTableView.reloadData()
            //updateMenuIconTasks()
        
        }else if list7Button.state == NSControl.StateValue.on {
            //print(7)
            list.removeAll()
            dataKey = "data7"
            changeData(dataKey)
            checkListTableView.reloadData()
            //updateMenuIconTasks()
            
        }

    }
    @IBAction func clearCompletedFromDictionaryArray(_ sender: Any) {
        
        // check if list has any items
        
        if list.count > 0 {
            let y = list.count - 1
            for n in (0...y).reversed() {
                print(n)
                //if n[]
                if list[n]["checkColumn"] == "1" {
                list.remove(at: n)
                  
                }
            //list.removeAll()
            }
            
            // update defaults with new trimmed list
            
            UserDefaults.standard.set(list, forKey: dataKey)
            checkListTableView.reloadData()
        }
            
        }
    @IBAction func moveNonCompleted(_ sender: Any) {
        
        for x in (1...7) {
        
            if currentDay == x {
                if x == 1 {
                    dataKey = "data"
               
                }else{
                
                dataKey = "data" + String(x)
                
                    changeData(dataKey)
                // list is now the current day to move items to
            }
                print(dataKey)
        
        }
        }
            
             moveToNextList = true
        
            
// beginning of loop
            
            for x in (1...7) {
                
                if currentDay == x {
                    
                }else{
                    if x == 1 {
                        moveDataKey = "data"
                    
                    }else{
                        moveDataKey = "data" + String(x)
                        
                    }
                    
                    changeData(moveDataKey)
                    
                    print(moveDataKey)
                    print(dataKey)
                    print(currentDay)
                    print(x)
                    // move unfinished to currentDay
                    
                    if nextList.count > 0 {
                        let y = nextList.count - 1
                        for n in (0...y).reversed() {
                            //print(n)
                            //if n[]
                            if nextList[n]["checkColumn"] == "0" {
                                
                                // add to nextList remove from list
                                
                                list.append(nextList[n])
                                nextList.remove(at: n)
                            }
                        
                    }
                    
                    }
                    
                }
                UserDefaults.standard.set(list, forKey: dataKey)
                UserDefaults.standard.set(nextList, forKey: moveDataKey)
                nextList.removeAll()
                
                
            }
// end of loop
        
            moveToNextList = false
            checkListTableView.reloadData()
            if currentDay == 1 {
                list1Button.performClick((Any).self)
            }else if currentDay == 2 {
                list2Button.performClick((Any).self)
            }else if currentDay == 3 {
                list3Button.performClick((Any).self)
            }else if currentDay == 4 {
                list4Button.performClick((Any).self)
            }else if currentDay == 5 {
                list5Button.performClick((Any).self)
            }else if currentDay == 6 {
                list6Button.performClick((Any).self)
            }else if currentDay == 7 {
                list7Button.performClick((Any).self)
            }
            
   //         moveToNextList = false
   //     print("reload")
   //         checkListTableView.reloadData()
            
            
       
      /*
        if list1Button.state == NSControl.StateValue.on {
             moveDataKey = "data2"
        }else if list2Button.state == NSControl.StateValue.on {
            moveDataKey = "data3"
        }else if list3Button.state == NSControl.StateValue.on {
            moveDataKey = "data4"
        }else if list4Button.state == NSControl.StateValue.on {
            moveDataKey = "data5"
        }else if list5Button.state == NSControl.StateValue.on {
            moveDataKey = "data6"
        }else if list6Button.state == NSControl.StateValue.on {
            moveDataKey = "data7"
        }else if list7Button.state == NSControl.StateValue.on {
            moveDataKey = "data"
            
        }else{
            moveToNextList = false
        return
    }
        // load next list into nextList Dictionary
        changeData(moveDataKey)
        
        if list.count > 0 {
        let y = list.count - 1
        for n in (0...y).reversed() {
            //print(n)
            //if n[]
            if list[n]["checkColumn"] == "0" {
                
                // add to nextList remove from list
                
                nextList.append(list[n])
                list.remove(at: n)
            }
        
    }
        }else{
            moveToNextList = false
            return }
        
        // update defaults for each list
        
        UserDefaults.standard.set(list, forKey: dataKey)
        UserDefaults.standard.set(nextList, forKey: moveDataKey)
        
        // clear nextList, so its empty next time
        
        nextList.removeAll()
        
        // reload the data
        
        checkListTableView.reloadData()
        moveToNextList = false

      */
            
    }
    
    
    @IBAction func addButtonClicked(_ sender: Any) {
            
        if textField.stringValue.isEmpty {
                return
            }
        
        list.append(["checkColumn" : "0", "listColumn": textField!.stringValue, "noteColumn" : ""])
            checkListTableView.reloadData()
        
        //print(dataKey)
        
            UserDefaults.standard.set(list, forKey: dataKey)
            textField.stringValue = ""
            
            
    }
        @IBAction func textEdited(_ sender: Any) {
            
            if let textField = sender as? NSTextField {
                let row = self.checkListTableView.row(for: sender as! NSView)
                if row == -1 {
                }else{
                    let col = self.checkListTableView.column(for: sender as! NSView)
                        if col == 1 {
                            //print("list")
                            self.list[row]["listColumn"] = textField.stringValue
                        }
                        if col == 2 {
                            //print("note")
                            self.list[row]["noteColumn"] = textField.stringValue
                        }
                UserDefaults.standard.set(list, forKey: dataKey)
                checkListTableView.reloadData()
            }
        }
    }
    
        @IBAction func itemCheckBoxClicked(_ sender: NSButton) {
            let row = checkListTableView.row(for: sender)

            let state = String(sender.state.rawValue)
            
        // update the list row checkColumn with the correct state
            
            list[row]["checkColumn"] = state
            
            UserDefaults.standard.set(list, forKey: dataKey)
            checkListTableView.reloadData()
            
        }
        @objc func checkBoxAction(button:NSButton){

            //print(button.tag);
        }
    
    
    @IBAction func resetDefaults(_ sender: Any) {
        /*
        self.presentAsSheet(sheetViewController)
        */
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
        checkListTableView.reloadData()
    }
    
    
    @IBAction func dragButtonPressed(_ sender: NSButton) {
        
        if sender.state == NSControl.StateValue.on {
            dragButtonMouseDown = true
            print(true)
            
        }else{
            print(false)
            dragButtonMouseDown = false
        }
    }
    @IBAction func heightSliderMoved(_ sender: Any) {
        
        guard let slider = sender as? NSSlider,
            let event = NSApplication.shared.currentEvent else { return }
        //let screenFrame = NSScreen.main?.frame
        let newOrigin = CGFloat(slider.intValue)
        switch event.type {
        case .leftMouseDown, .rightMouseDown:
            //print(newOrigin)
            let appDelegate : AppDelegate = NSApplication.shared.delegate as! AppDelegate
            appDelegate.popover.contentSize = NSSize(width: 257, height: newOrigin)
        //case .leftMouseUp, .rightMouseUp:
            //view.window?.alphaValue = 1
        case .leftMouseDragged, .rightMouseDragged:
            //print(newOrigin)
            let appDelegate : AppDelegate = NSApplication.shared.delegate as! AppDelegate
            appDelegate.popover.contentSize = NSSize(width: 257, height: newOrigin)
        default:
            break
        }
        //var x = sender.intValue
        //print(x)
        
    }
    
    override func mouseDragged(with theEvent: NSEvent) {
        
        let currentLocation = NSEvent.mouseLocation
        //print("Dragged at : \(currentLocation)")

        var newOrigin   = currentLocation
        let screenFrame = NSScreen.main?.frame
        var windowFrame = self.view.window?.frame
        var leftWindowPos = screenFrame!.size.width - (windowFrame?.origin.x)!
        print(leftWindowPos)
        print(windowFrame!.size)
        //print(currentLocation.y)
        newOrigin.x     = screenFrame!.size.width - currentLocation.x //+ windowFrame!.width
        newOrigin.y     = screenFrame!.size.height - currentLocation.y - 20

        //print("the New Origin Points : \(newOrigin)")

         //Don't let window get dragged up under the menu bar
        //width
        if newOrigin.x < 250 {
            newOrigin.x = 250
        }
        // height
        if newOrigin.y < 150 {
            newOrigin.y = 150
        }

        //print("the New Origin Points : \(newOrigin)")

        let appDelegate : AppDelegate = NSApplication.shared.delegate as! AppDelegate
        appDelegate.popover.contentSize = NSSize(width: newOrigin.x, height: newOrigin.y)
        

    }
    
    func updateMenuIconTasks() {
        
        var nonCompletedTask = 0
        
        if list.count > 0 {
        let y = list.count - 1
        for n in (0...y).reversed() {
            print(n)
            //if n[]
            if list[n]["checkColumn"] == "0" {
             nonCompletedTask += 1
            }
        //list.removeAll()
        }
            let appDelegate = NSApplication.shared.delegate as! AppDelegate
            let statusItem = appDelegate.statusItem
            statusItem.button?.title = "✔︎ \(nonCompletedTask)"
    print("non \(nonCompletedTask)")
    
        }
    }
    
    
    
    // End of class
    
    }



    extension ViewController: NSTableViewDataSource, NSTableViewDelegate {
      
    func numberOfRows(in tableView: NSTableView) -> Int {
      return (list.count)
    }


        // Updating the tableview
        
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
          let todoItem = list[row]
        let check = list[row]["checkColumn"]!
        
        if (tableColumn?.identifier)!.rawValue == "listColumn"
            {
                let cell = tableView.makeView(withIdentifier:
        NSUserInterfaceItemIdentifier(rawValue: "listColumn"), owner: self)
        as? NSTableCellView
 //*            fix for grey background
                cell?.textField?.drawsBackground = true
                cell?.textField?.backgroundColor = NSColor.clear
  //*
                if check == "1" {
                    cell?.textField?.attributedStringValue = NSAttributedString(string: todoItem[tableColumn!.identifier.rawValue]!, attributes: strokeEffect)
                 }else{
                     cell?.textField?.stringValue = todoItem[tableColumn!.identifier.rawValue]!
                
                 }
                    //cell?.textField?.stringValue = todoItem[tableColumn!.identifier.rawValue]!
                    return cell
                
            }
        else if (tableColumn?.identifier)!.rawValue == "noteColumn" {
            
            let cell = tableView.makeView(withIdentifier:
            NSUserInterfaceItemIdentifier(rawValue: "noteColumn"), owner: self)
            as? NSTableCellView
//*         fix for grey background
            cell?.textField?.drawsBackground = true
            cell?.textField?.backgroundColor = NSColor.clear
//*
            if check == "1" {
                        cell?.textField?.attributedStringValue = NSAttributedString(string: todoItem[tableColumn!.identifier.rawValue]!, attributes: strokeEffect)
                     }else{
                         cell?.textField?.stringValue = todoItem[tableColumn!.identifier.rawValue]!
                    
                     }
                        //cell?.textField?.stringValue = todoItem[tableColumn!.identifier.rawValue]!
                        return cell
                        
            
        }
            else if (tableColumn?.identifier)!.rawValue == "checkColumn"
            {
                let view = tableView.makeView(withIdentifier:
        NSUserInterfaceItemIdentifier(rawValue: "checkColumn"), owner: self)
        as? NSButton
                
                   
                    let cellState = Int(todoItem[tableColumn!.identifier.rawValue]!)
                //view?.t
                    view?.state = NSControl.StateValue(rawValue: cellState!)
                    return view
                
            }
            return nil
      
        }
        
        
        //
        // Drag and drop on tableview
        //
        func tableView(_ tableView: NSTableView, validateDrop info: NSDraggingInfo, proposedRow row: Int, proposedDropOperation operation: NSTableView.DropOperation) -> NSDragOperation {
            
        if operation == .above {
            
            return .move
        }
        return .every
    }
        
        func tableView(_ tableView: NSTableView, acceptDrop info: NSDraggingInfo, row: Int, dropOperation: NSTableView.DropOperation) -> Bool {
            
            let draggedData = info.draggingPasteboard.string(forType: .string) ?? ""
                //info.draggingPasteboard.propertyList(forType: .string) as? String ?? ""
            print(draggedData)
            list.append(["checkColumn" : "0", "listColumn": draggedData, "noteColumn": ""])
            checkListTableView.reloadData()
            UserDefaults.standard.set(list, forKey: dataKey)
            print(draggedData)
            
            return true
        }




}
         

    extension NSUserInterfaceItemIdentifier {
        static let check = NSUserInterfaceItemIdentifier(rawValue: "checkColumn")
    }

extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
