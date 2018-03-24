package fr.entities;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class Notepad {
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;


    // A Notebad is bind with a user Id
    @ManyToOne(targetEntity = UserAccount.class)
    @JoinColumn(name = "userId")
    private UserAccount userAccount;

    // A Notepad has many notes
    @OneToMany(mappedBy = "notepad")
    @OnDelete(action = OnDeleteAction.CASCADE)
    private List<Note> notes;

    @Temporal(TemporalType.TIMESTAMP)
    private Date createdOn = new Date();
    private String name;
    private String description;


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Note> getNotes() {
        return notes;
    }

    public void setNotes(List<Note> agencies) {
        this.notes = notes;
    }

    public UserAccount getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(UserAccount userAccount) {
        this.userAccount = userAccount;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }



}


