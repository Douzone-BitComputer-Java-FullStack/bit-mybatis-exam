package bit.edu.book.exception;

/**
 * Some description here.
 *
 * @author : 강명관
 * @since : 1.0
 **/
public class NotFountBookException extends RuntimeException {
    private static final String MESSAGE = "존재하지 않는 책 입니다.";
    public NotFountBookException() {
        super(MESSAGE);
    }
}
