package fr.controllers;

import fr.dao.INoteDao;
import fr.dao.INotePadDao;
import fr.dao.NotePadDao;
import fr.entities.Note;
import fr.entities.Notepad;
import fr.entities.UserAccount;
import fr.form.LoginForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping({"/index", "/notepad", "/"})
public class NotePadController {

    // Get notepad object
    @Autowired
    private INotePadDao notePadDao;
    public void setNotePadDao(INotePadDao notePadDao){this.notePadDao = notePadDao;}

    @Autowired
    INoteDao noteDao;
    public void setNotePadDao(INoteDao noteDao){this.noteDao = noteDao;}


    // Return notepad
    @RequestMapping(method = RequestMethod.GET)
    public String getNotepads(Model model, HttpServletRequest request){
        List<Notepad> notePads = new ArrayList<Notepad>();
        UserAccount user = (UserAccount) request.getSession().getAttribute("USER_INFORMATIONS");
        if(user != null){
            notePads = notePadDao.list(user);
        }
        model.addAttribute("notePads", notePads);
        return "index";
    }

    // Create a new notepad
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView getForm(){
        return new ModelAndView("notePadForm", "notepad", new Notepad());
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addClient(@ModelAttribute("notepad")Notepad notepad, HttpServletRequest request){
        UserAccount user = (UserAccount) request.getSession().getAttribute("USER_INFORMATIONS");
        notepad.setUserAccount(user);
        notePadDao.save(notepad);
        return "redirect:/index/";
    }

    @RequestMapping(method = RequestMethod.GET, value= "delete")
    public String delete(HttpServletRequest request, ModelMap param){
        // If user ask to make a copy
        String notepadId = request.getParameter("notepadId");
        if(notepadId != null){
            int idNotepad = Integer.parseInt(notepadId);
            // Copy notes from notepad 1 to notpad 2
            if(request.getParameter("copyto") != null){
                String copyto = request.getParameter("copyto");
                boolean parsable = true;
                int idNotepadCopy = 0;
                try{
                    idNotepadCopy = Integer.parseInt(copyto);
                }catch(NumberFormatException e){
                    parsable = false;
                }
                if(parsable){
                    // Get notes from bdd
                    List<Note> notes = noteDao.list(idNotepad);
                    Notepad notepad = new Notepad();
                    notepad.setId(idNotepadCopy);
                    for (Note note: notes) {
                        note.setNotepad(notepad);
                        noteDao.update(note);
                    }
                }
            }
            // delete note from bdd
            notePadDao.deleteNotepadById(idNotepad);
        }
        return "redirect:/index";
    }

}
