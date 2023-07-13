package bit.edu.book.service;

import bit.edu.book.dto.BookCopyDto;
import bit.edu.book.dto.BookDetailDto;
import bit.edu.book.dto.BookModifyDto;
import bit.edu.book.dto.BookRegisterDto;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 * Some description here.
 *
 * @author : 강명관
 * @since : 1.0
 **/
public interface BookService {

    List<BookCopyDto> findAllBookCopy();

    void deleteByBookSeq(int bookSeq);

    void createBook(BookRegisterDto bookRegisterDto);

    BookDetailDto findBookDetailByBookSeq(int bookSeq);

    void updateBook(BookModifyDto bookModifyDto);
}
