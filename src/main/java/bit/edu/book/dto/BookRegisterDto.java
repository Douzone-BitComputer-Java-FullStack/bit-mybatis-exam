package bit.edu.book.dto;

import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * Some description here.
 *
 * @author : 강명관
 * @since : 1.0
 **/
@Getter
@AllArgsConstructor
@ToString
public class BookRegisterDto {

    private String bookIsbn;
    private String bookTitle;
    private String bookAuthor;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate bookPublishDate;
    private String bookPosition;
    private String bookStatus;

}
