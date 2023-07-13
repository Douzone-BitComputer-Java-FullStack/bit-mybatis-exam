package bit.edu.user.service.impl;

import bit.edu.user.dto.UserRegisterDto;
import bit.edu.user.mapper.UserMapper;
import bit.edu.user.service.UserService;
import org.springframework.stereotype.Service;

/**
 * Some description here.
 *
 * @author : 강명관
 * @since : 1.0
 **/
@Service
public class UserServiceImpl implements UserService {

    private final UserMapper userMapper;

    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public void createUser(UserRegisterDto userRegisterDto) {
        userMapper.createUser(userRegisterDto);
    }

    @Override
    public boolean existUserId(String userId) {
        return userMapper.existUserId(userId);
    }
}
