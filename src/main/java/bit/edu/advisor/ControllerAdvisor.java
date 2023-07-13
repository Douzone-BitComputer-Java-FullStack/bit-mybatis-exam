package bit.edu.advisor;

import bit.edu.book.exception.NotFountBookException;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * Some description here.
 *
 * @author : 강명관
 * @since : 1.0
 **/
@Slf4j
@ControllerAdvice
public class ControllerAdvisor {

    @ExceptionHandler({NotFountBookException.class, NotFoundException.class})
    public String notFoundError(Exception e) {
        log.error(e.getMessage());
        return "redirect:/books";
    }

    @ExceptionHandler({Exception.class, RuntimeException.class})
    public String internalServerError(Exception e) {
        log.error(e.getMessage());
        return "redirect:/books";
    }
}
