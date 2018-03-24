package fr.controllers;

import fr.dao.INoteDao;
import fr.dao.INotePadDao;
import fr.entities.Note;
import fr.entities.Notepad;
import fr.entities.UserAccount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/note")
public class NoteController {
    @Autowired
    INoteDao noteDao;
    public void setNotePadDao(INoteDao noteDao){this.noteDao = noteDao;}

    @Autowired
    private INotePadDao notePadDao;
    public void setNoteDao(INotePadDao notePadDao){this.notePadDao = notePadDao;}

    int idNotepad;
    Note editNote;
    List<Notepad> notePads;
    @RequestMapping(method = RequestMethod.GET, value="/{notepadId}")
    public String displayAll(@PathVariable("notepadId") String noteId, Model model){
        List<Note> notes = new ArrayList<Note>();
        if(noteId != null){
            idNotepad = Integer.parseInt(noteId);
            // Get notes from bdd
            notes = noteDao.list(idNotepad);
        }
        model.addAttribute("notes", notes);
        return "notes";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model, HttpServletRequest request){
        notePads = new ArrayList<Notepad>();
        UserAccount user = (UserAccount) request.getSession().getAttribute("USER_INFORMATIONS");
        if(user != null){
            notePads = notePadDao.list(user);
        }
        model.addAttribute("notePads", notePads);
        return "noteForm";
    }
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String save(@ModelAttribute("notepad")Note note){
        noteDao.save(note);
        return "redirect:/note/"+note.getNotepad().getId();
    }
    @RequestMapping(method = RequestMethod.GET, value="/delete/{noteId}")
    public String delete(@PathVariable("noteId") String noteId, Model model){
        if(noteId != null){
            Integer idNote = Integer.parseInt(noteId);
            // delete note from bdd
            noteDao.deleteNoteById(idNote);
        }
        return "redirect:/note/"+idNotepad;
    }
    @RequestMapping(value = "/display/{noteId}", method = RequestMethod.GET)
    public String edit(@PathVariable("noteId") String noteId, Model model, HttpServletRequest request){
        editNote = new Note();
        if(noteId != null){
            int idNote = Integer.parseInt(noteId);
            editNote = noteDao.getNote(idNote);
        }
        if(editNote.getId() != null){
            UserAccount user = (UserAccount) request.getSession().getAttribute("USER_INFORMATIONS");
            if(user != null){
                notePads = notePadDao.list(user);
            }
            model.addAttribute("notePads", notePads);
            model.addAttribute("note", editNote);
            return "note";
        }
        else{
            return "redirect:/note/"+idNotepad;
        }
    }
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(@ModelAttribute("notepad")Note note, Model model, HttpServletRequest request){
        editNote.setNotepad(note.getNotepad());
        editNote.setName(note.getName());
        editNote.setDescription(note.getDescription());
        noteDao.update(editNote);
        return "redirect:/note/"+note.getNotepad().getId();
    }

}
