import Array "mo:base/Array";
actor NoteApp {
  stable var notes : [Text] = [];

  public func addNote(note: Text) {
    notes := Array.append(notes, [note]);
  
  };

  public query func getNotes() : async [Text] {
    return notes;
  };
};