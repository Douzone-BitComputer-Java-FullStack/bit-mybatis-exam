package bit.edu.user.service;

import bit.edu.user.dto.UserRegisterDto;

/**
 * Some description here.
 *
 * @author : 강명관
 * @since : 1.0
 **/
public interface UserService {

    void createUser(UserRegisterDto userRegisterDto);

    boolean existUserId(String userId);

}
