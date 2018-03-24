package fr.dao;

import fr.entities.Notepad;
import fr.entities.UserAccount;

import java.util.List;

/**
 * Created by saziri on 13/07/2016.
 */
public interface INotePadDao {
    public List<Notepad> list();
    public List<Notepad> list(UserAccount user);
    public Notepad save(Notepad notepad);
    public void deleteNotepadById(Integer notepadId);
}
