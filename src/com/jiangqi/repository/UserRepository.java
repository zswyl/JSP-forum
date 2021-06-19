package com.jiangqi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.jiangqi.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    User findById(int i);
    User findByUserName(String userName);
    User findByUserNameAndPassword(String userName, String password);
    @Query(value = "select id from users where userName=?1", nativeQuery = true)
    Integer getUserId(String userName);
    @Query(value = "select userName from users where id=?1", nativeQuery = true)
    String getUserName(Integer userId);
    @Query(value = "select head from users where id=?1", nativeQuery = true)
    String getHead(Integer userId);
}
