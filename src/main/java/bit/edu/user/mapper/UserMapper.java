package bit.edu.user.mapper;

import bit.edu.user.dto.UserRegisterDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * Some description here.
 *
 * @author : 강명관
 * @since : 1.0
 **/
@Mapper
public interface UserMapper {

    void createUser(UserRegisterDto userRegisterDto);

    boolean existUserId(@Param("userId") String userId);
}
