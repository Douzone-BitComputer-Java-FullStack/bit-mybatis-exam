package bit.edu.book.dto;

import java.time.LocalDateTime;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * Some description here.
 *
 * @author : 강명관
 * @since : 1.0
 **/
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BookCopyDto {
    private int bookSeq;
    private String bookTitle;
    private String bookAuthor;
    private Date bookPublishedDate;
}
