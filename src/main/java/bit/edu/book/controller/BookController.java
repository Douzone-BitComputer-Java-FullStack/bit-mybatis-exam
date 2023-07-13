package bit.edu.book.controller;

import bit.edu.book.dto.BookDetailDto;
import bit.edu.book.dto.BookModifyDto;
import bit.edu.book.dto.BookRegisterDto;
import bit.edu.book.service.BookService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Some description here.
 *
 * @author : 강명관
 * @since : 1.0
 **/
@Slf4j
@Controller
@RequestMapping("/books")
@RequiredArgsConstructor
public class BookController {

    private final BookService bookService;

    @GetMapping
    public String bookList(Model model) {
        model.addAttribute("list", bookService.findAllBookCopy());
        return "/bookList";
    }

    @GetMapping("/register")
    public String bookRegisterPage() {
        return "/bookRegister";
    }

    @PostMapping("/register")
    public String bookRegister(@ModelAttribute BookRegisterDto bookRegisterDto) {
        log.info("registerDto {}", bookRegisterDto);
        bookService.createBook(bookRegisterDto);
        return "redirect:/books";
    }

    @GetMapping("/{bookSeq}")
    public String bookDetail(@PathVariable(value = "bookSeq") int bookSeq,
                             Model model) {
        log.info("bookSeq {}", bookSeq);
        model.addAttribute("book", bookService.findBookDetailByBookSeq(bookSeq));
        return "/bookDetail";
    }

    @GetMapping("/{bookSeq}/modify")
    public String bookModifyForm(@PathVariable(value = "bookSeq") int bookSeq,
                                 Model model) {
        model.addAttribute("book", bookService.findBookDetailByBookSeq(bookSeq));
        return "/bookModify";
    }

    @PostMapping("/{bookSeq}/modify")
    public String bookModify(@PathVariable(value = "bookSeq") int bookSeq,
                             @ModelAttribute BookModifyDto bookModifyDto) {
        bookService.updateBook(bookModifyDto);
        return "redirect:/books";
    }

    @ResponseBody
    @DeleteMapping("/{bookSeq}")
    public ResponseEntity<String> bookDelete(@PathVariable(value = "bookSeq") int bookSeq) {
        log.info("bookSeq {}", bookSeq);
        bookService.deleteByBookSeq(bookSeq);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
