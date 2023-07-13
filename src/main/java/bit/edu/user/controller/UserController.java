package bit.edu.user.controller;

import bit.edu.user.dto.UserRegisterDto;
import bit.edu.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Some description here.
 *
 * @author : 강명관
 * @since : 1.0
 **/
@Slf4j
@Controller
@RequestMapping("/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public String userRegisterPage() {
        return "/userRegist";
    }

    @PostMapping("/reigst")
    public String userRegister(@ModelAttribute UserRegisterDto userRegisterDto) {
        log.info("test: " + userRegisterDto);
        userService.createUser(userRegisterDto);
        return "redirect:/bookList";
    }

    @ResponseBody
    @GetMapping("/checkId")
    public ResponseEntity<String> userDuplicateIdCheck(@RequestParam(value = "userId") String userId) {
        boolean result = userService.existUserId(userId);
        log.info("result {} ", result);

        if (result) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>(HttpStatus.OK);
    }

}
