package com.handout.repository;

import com.handout.entity.authentication.RefreshToken;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

public interface IRefreshTokenRepository extends JpaRepository<RefreshToken, Integer> {
    RefreshToken findByToken(String token);

    boolean existsByTokenAndExpiredDateGreaterThan(String token, Date expiredDate);

    @Transactional
    @Modifying
    @Query("	DELETE 					"
            + "	FROM 	RefreshToken 	"
            + " WHERE 	token = :token")
    void deleteByToken(@Param("token") String token);
}
