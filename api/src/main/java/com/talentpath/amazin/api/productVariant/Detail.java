package com.talentpath.amazin.api.productVariant;


import javax.persistence.*;

@Entity
@Table(name="detailv", schema="public")
public class Detail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="detailid")
    private Long id;

    @Column(name="selectorid")
    private String selectorid;
    @Column(name="feature")
    private String feature;
    @Column(name="detail")
    private String detail;


    public Detail() {

    }

    public Detail(long id
        , String selectorid, String feature, String detail
    ) {
        super();
        this.id = id;
        this.selectorid = selectorid;
        this.feature = feature;
        this.detail = detail;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSelectorid() {
        return selectorid;
    }

    public void setSelectorid(String selectorid) {
        this.selectorid = selectorid;
    }

    public String getFeature() {
        return feature;
    }

    public void setFeature(String feature) {
        this.feature = feature;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

//    @Override
//    public int hashCode() {
//        final int prime = 31;
//        int result = 1;
//        result = prime * result + ((otherIds == null) ? 0 : otherIds.hashCode());
//        result = prime * result + ((id == null) ? 0 : id.hashCode());
//        return result;
//    }
//
//    @Override
//    public boolean equals(Object obj) {
//        if (this == obj)
//            return true;
//        if (obj == null)
//            return false;
//        if (getClass() != obj.getClass())
//            return false;
//        Detail other = (Detail) obj;
//        // id comparison
//        if (id == null) {
//            if (other.id != null)
//                return false;
//        } else if (!id.equals(other.id))
//            return false;
//        // arrayOfOtherIds comparison
//        if (otherIds == null) {
//            if (other.otherIds != null)
//                return false;
//        } else if (!otherIds.equals(other.otherIds))
//            return false;
//        return true;
//    }

}
