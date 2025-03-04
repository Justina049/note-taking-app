import Array "mo:base/Array";
import Nat "mo:base/Nat";


actor NoteApp {
  stable var notes : [ { id: Nat; content: Text }] = [];
  stable var nextId : Nat = 0; //Unique ID Counter

  public func addNote(note: Text) {
    let newNote = { id = nextId; content = note }; 
    notes := Array.append(notes, [newNote]);
    nextId += 1;
  };
  

  public query func getNotes() : async [ { id: Nat; content: Text } ] {
    return notes;
  };

  public func updateNote(id: Nat, newContent: Text) {
    notes := Array.map< {id: Nat; content: Text }, {id: Nat; content : Text}> (
      notes,
      func (n: { id: Nat; content: Text }) : {id: Nat; content: Text} {
        if (n.id == id) { { id = n.id;  content = newContent } } else { n } 
      }
    );
  };

  public func deleteNote(id: Nat) {
    notes := Array.filter< { id: Nat; content: Text } >(
      notes, 
      func(n: { id: Nat; content: Text }) : Bool {
        n.id != id 
      }
    );
  };

};