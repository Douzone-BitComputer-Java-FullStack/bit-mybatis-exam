package bit.edu.user.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

/**
 * Some description here.
 *
 * @author : 강명관
 * @since : 1.0
 **/
@AllArgsConstructor
@Getter
@ToString
public class UserRegisterDto {

    private String userId;
    private String userPass;
    private boolean isMan;
    private String userIntroduce;
}
