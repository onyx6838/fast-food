package com.handout.entity;

import lombok.Data;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;
import java.util.Date;

@Data
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public class BaseEntity<U> implements Serializable {
    @CreatedBy
    @Column(name = "CreatedBy")
    private U createdBy;

    @CreatedDate
    @Column(name = "CreatedDate")
    private Date createdDate;

    @LastModifiedBy
    @Column(name = "UpdatedBy")
    private U updatedBy;

    @LastModifiedDate
    @Column(name = "UpdatedDate")
    private Date updatedDate;

}