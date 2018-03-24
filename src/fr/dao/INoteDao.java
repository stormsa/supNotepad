package fr.dao;

import fr.entities.Note;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

public interface INoteDao {
    public List<Note> list();
    public List<Note> list(Integer NotepadId);
    public Note save(Note note);
    public Note update(Note note);
    public void deleteNoteById(Integer noteId);
    public Note getNote(Integer noteId);
}
