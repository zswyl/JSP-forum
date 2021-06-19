/**
 * FileName: UserService
 * Author:   江七
 * Date:     2020/11/24 20:55
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.jiangqi.service;

import org.springframework.stereotype.Service;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author 江七
 * @create 2020/11/24
 * @since 1.0.0
 */
public interface UserService {
    Boolean validateUser(String userName,String password);
}