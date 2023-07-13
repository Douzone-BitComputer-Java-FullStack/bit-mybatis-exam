package bit.edu.book.mapper;

import bit.edu.book.dto.BookCopyDto;
import bit.edu.book.dto.BookDetailDto;
import bit.edu.book.dto.BookModifyDto;
import bit.edu.book.dto.BookRegisterDto;
import java.util.List;
import java.util.Optional;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * Some description here.
 *
 * @author : 강명관
 * @since : 1.0
 **/
@Mapper
public interface BookMapper {

    List<BookCopyDto> findAllBookCopy();

    void deleteByBookSeq(@Param("bookSeq") int bookSeq);

    void createBookInfo(BookRegisterDto bookRegisterDto);

    void createBookCopy(BookRegisterDto bookRegisterDto);

    Optional<BookDetailDto> findBookDetailByBookSeq(@Param("bookSeq") int bookSeq);

    void updateBookInfoByBookIsbn(BookModifyDto bookModifyDto);
    void updateBookCopyByBookSeq(BookModifyDto bookModifyDto);


}
