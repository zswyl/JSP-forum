package com.jiangqi.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jiangqi.model.Note;

@Repository
public interface NoteRepository extends JpaRepository<Note, Integer> {
    List<Note> findByNoteId(Integer noteId);
}
