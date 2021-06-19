/**
 * FileName: UserServiceImpl
 * Author:   江七
 * Date:     2020/11/24 21:00
 * Description: 用户实现类
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.jiangqi.service.serviceImpl;

import com.jiangqi.model.User;
import com.jiangqi.repository.UserRepository;
import com.jiangqi.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 〈一句话功能简述〉<br> 
 * 〈用户实现类〉
 *
 * @author 江七
 * @create 2020/11/24
 * @since 1.0.0
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserRepository userRepository;

    @Override
    public  Boolean validateUser(String userName, String password){
       User user=userRepository.findByUserNameAndPassword(userName,password);
       if (user!=null){
           return true;
       }else{
           return false;
       }
   }


}