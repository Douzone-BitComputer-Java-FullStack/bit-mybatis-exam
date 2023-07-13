package bit.edu.book.dto;

import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

/**
 * Some description here.
 *
 * @author : 강명관
 * @since : 1.0
 **/

@Getter
@AllArgsConstructor
@ToString
public class BookDetailDto {
    private int bookSeq;
    private String bookIsbn;
    private String bookTitle;
    private String bookAuthor;
    private LocalDate bookPublishedDate;
    private String bookPosition;
    private String bookStatus;
}