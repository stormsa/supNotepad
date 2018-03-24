package fr.dao;

import fr.entities.Note;
import fr.entities.Notepad;
import fr.entities.UserAccount;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import java.util.List;

public class NotePadDao implements INotePadDao {

    private SessionFactory sessFact;

    public NotePadDao(){};

    public NotePadDao(SessionFactory sessionFactory)
    {
        this.sessFact = sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory)
    {
        this.sessFact = sessionFactory;
    }
    // Get the notepads for a specific client
    @Override
    public List<Notepad> list(UserAccount user) {
        org.hibernate.Session sess = sessFact.openSession();
        Transaction tx = sess.beginTransaction();
        List<Notepad> cNotePad = null;

        Criteria criteria = sess.createCriteria(Notepad.class);
        criteria.add(Restrictions.eq("userAccount",user));
        cNotePad = (List<Notepad>) criteria.list();

        sess.close();
        return cNotePad;
    }
    public List<Notepad> list() {
        org.hibernate.Session sess = sessFact.openSession();
        Transaction tx = sess.beginTransaction();
        List<Notepad> cClient = null;

        Criteria criteria = sess.createCriteria(Notepad.class);
        cClient = (List<Notepad>) criteria.list();

        sess.close();
        return cClient;
    }

    @Override
    public Notepad save(Notepad notepad) {
        org.hibernate.Session sess = sessFact.openSession();
        Transaction tx = sess.beginTransaction();
        sess.saveOrUpdate(notepad);
        tx.commit();
        sess.close();
        return notepad;
    }

    @Override
    public void deleteNotepadById(Integer id)
    {
        org.hibernate.Session sess = sessFact.openSession();
        Transaction tx = sess.beginTransaction();

        Notepad notepad = (Notepad) sess.createCriteria(Notepad.class)
                .add(Restrictions.eq("id", id)).uniqueResult();

        // delete the file
        sess.delete(notepad);

        tx.commit();
        sess.close();
    }
}
