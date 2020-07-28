package com.talentpath.amazin.api.qAndA;

public class QAndA {
    private Long id;
    private String question;
    private String answers;
    private int votes;

    public QAndA(){

    }

    public QAndA(long id, String question, String answers, int votes){
        super();
        this.id = id;
        this.question = question;
        this.answers = answers;
        this.votes = votes;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion( String question) {
        this.question = question;
    }

    public String getAnswers() {
        return answers;
    }

    public void setAnswers(String answers) {
        this.answers = answers;
    }

    public int getVotes() {
        return votes;
    }

    public void setVotes(int votes) {
        this.votes = votes;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null) return false;
        if (getClass() != obj.getClass()) return false;
        QAndA other = (QAndA) obj;
        // id comparison
        if (id == null) {
            if (other.id != null) return false;
        }
        else if (!id.equals(other.id)) return false;
        // arrayOfOtherIds comparison
        if (question == null) {
            if (other.question != null) return false;
        }
        else if (!question.equals(other.question)) return false;
        return true;
    }



}