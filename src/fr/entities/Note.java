package fr.entities;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Note {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;


    // A project is bind with a Notepad Id
    @ManyToOne(targetEntity = Notepad.class)
    @JoinColumn(name = "notepadId")
    private Notepad notepad;

    private String name;
    // Fill with the actual date
    private String description;
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdOn = new Date();

    public Notepad getNotepad() {
        return notepad;
    }

    public void setNotepad(Notepad notepad) {
        this.notepad = notepad;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }



}
