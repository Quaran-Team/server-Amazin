package com.talentpath.amazin.api.answers;

import com.talentpath.amazin.api.answers.Answers;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AnswersRepository extends JpaRepository<Answers, Long> {
}