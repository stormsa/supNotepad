package fr.dao;

import fr.entities.Note;
import fr.entities.Notepad;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import java.util.List;

public class NoteDao implements INoteDao {

    private SessionFactory sessFact;

    public NoteDao(){};

    public NoteDao(SessionFactory sessionFactory)
    {
        this.sessFact = sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory)
    {
        this.sessFact = sessionFactory;
    }
    @Override
    public List<Note> list() {
        org.hibernate.Session sess = sessFact.openSession();
        Transaction tx = sess.beginTransaction();
        List<Note> cNote = null;

        Criteria criteria = sess.createCriteria(Note.class);
        cNote = (List<Note>) criteria.list();

        sess.close();
        return cNote;
    }
    @Override
    public List<Note> list(Integer notepadId) {
        org.hibernate.Session sess = sessFact.openSession();
        Transaction tx = sess.beginTransaction();
        List<Note> cProject = null;

        Criteria criteria = sess.createCriteria(Note.class);
        criteria.createAlias("notepad", "notepadAlias");
        criteria.add(Restrictions.eq("notepad.id", notepadId));
        cProject = (List<Note>) criteria.list();

        sess.close();
        return cProject;
    }

    @Override
    public Note save(Note note) {
        org.hibernate.Session sess = sessFact.openSession();
        Transaction tx = sess.beginTransaction();
        sess.saveOrUpdate(note);
        tx.commit();
        sess.close();
        return note;
    }
    @Override
    public Note update(Note note) {
        org.hibernate.Session sess = sessFact.openSession();
        Transaction tx = sess.beginTransaction();
        sess.update(note);
        tx.commit();
        sess.close();
        return note;
    }


    @Override
    public void deleteNoteById(Integer id)
    {
        org.hibernate.Session sess = sessFact.openSession();
        Transaction tx = sess.beginTransaction();

        // only need to specify the ID to delete it
        Note note = (Note) sess.createCriteria(Note.class)
                .add(Restrictions.eq("id", id)).uniqueResult();

        // delete the file
        sess.delete(note);

        tx.commit();
        sess.close();
    }

    @Override
    public Note getNote(Integer noteId) {
        org.hibernate.Session sess = sessFact.openSession();
        Transaction tx = sess.beginTransaction();
        Note cNote = null;

        Criteria criteria = sess.createCriteria(Note.class);
        criteria.add(Restrictions.eq("id", noteId));
        cNote = (Note) criteria.uniqueResult();

        sess.close();
        return cNote;
    }
}
