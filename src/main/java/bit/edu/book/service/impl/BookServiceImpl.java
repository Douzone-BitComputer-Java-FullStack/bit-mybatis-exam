package bit.edu.book.service.impl;

import bit.edu.book.dto.BookCopyDto;
import bit.edu.book.dto.BookDetailDto;
import bit.edu.book.dto.BookModifyDto;
import bit.edu.book.dto.BookRegisterDto;
import bit.edu.book.exception.NotFountBookException;
import bit.edu.book.mapper.BookMapper;
import bit.edu.book.service.BookService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Some description here.
 *
 * @author : 강명관
 * @since : 1.0
 **/
@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class BookServiceImpl implements BookService {

    private final BookMapper bookMapper;

    @Override
    public List<BookCopyDto> findAllBookCopy() {
        return bookMapper.findAllBookCopy();
    }

    @Override
    public void deleteByBookSeq(int bookSeq) {
        bookMapper.deleteByBookSeq(bookSeq);
    }

    @Transactional
    @Override
    public void createBook(BookRegisterDto bookRegisterDto) {
        bookMapper.createBookInfo(bookRegisterDto);
        bookMapper.createBookCopy(bookRegisterDto);
    }

    @Override
    public BookDetailDto findBookDetailByBookSeq(int bookSeq) {
        return bookMapper.findBookDetailByBookSeq(bookSeq)
            .orElseThrow(NotFountBookException::new);
    }

    @Transactional
    @Override
    public void updateBook(BookModifyDto bookModifyDto) {
        bookMapper.updateBookInfoByBookIsbn(bookModifyDto);
        bookMapper.updateBookCopyByBookSeq(bookModifyDto);
    }
}
