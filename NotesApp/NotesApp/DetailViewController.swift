//
//  ViewController.swift
//  NotesApp
//
//  Created by Hermish Mehta on 1/8/18.
//  Copyright © 2018 Hermish Mehta. All rights reserved.
//

import UIKit

protocol NoteUpdateDelegate: class {
    func updateNote(note: Note, at index: Int)
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    weak var delegate: NoteUpdateDelegate?
    
    var note: Note?
    var noteIndex: Int?
    
    func configureView() {
        if let unwrappedNote = note {
            textView.text = unwrappedNote.content
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        note?.content = textView.text
        if let note = note, let index = noteIndex {
            delegate?.updateNote(note: note, at: index)
        }
    }

}

