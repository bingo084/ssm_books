package com.aowin.controller;

import com.aowin.domain.Book;
import com.aowin.domain.BookRecord;
import com.aowin.domain.User;
import com.aowin.service.BookService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * 图书控制层
 *
 * @author bingo
 */
@Controller
@RequestMapping("book")
public class BookController {
    @Autowired
    private BookService bookService;

    @RequestMapping("getAllNotLentBooks")
    public String getAllNotLentBooks(@RequestParam(required = false, defaultValue = "1") int page, Model model) {
        PageInfo<Book> bookPages = bookService.getAllNotLentBooks(page);
        model.addAttribute("bookPages", bookPages);
        return "/bookmanager/borrowBook.jsp";
    }

    @RequestMapping("borrowBookById")
    public String borrowBookById(int bookId, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (bookService.borrowBookById(bookId, user)) {
            model.addAttribute("alert", "借书成功");
        } else {
            model.addAttribute("alert", "借书失败，最多可借5本书，请及时归还逾期书籍");
        }
        return "getNotReturnedBooks";
    }

    @RequestMapping("getNotReturnedBooks")
    public String getNotReturnedBooks(@RequestParam(required = false, defaultValue = "1") int page,HttpSession session,Model model) {
        User user = (User) session.getAttribute("user");
        PageInfo<BookRecord> bookPages = bookService.getNotReturnedBooks(page,user);
        model.addAttribute("bookPages", bookPages);
        return "/bookmanager/returnBook.jsp";
    }
    @RequestMapping("getAllReturnedBooks")
    public String getAllReturnedBooks(@RequestParam(required = false, defaultValue = "1") int page,HttpSession session,Model model) {
        User user = (User) session.getAttribute("user");
        PageInfo<BookRecord> bookPages = bookService.getAllReturnedBooks(page,user);
        model.addAttribute("bookPages", bookPages);
        return "/bookmanager/borrowHistory.jsp";
    }
    @RequestMapping("returnBookById")
    public String returnBookById(int bookId,int recordId,int userId, Model model){
        if (bookService.returnBookById(bookId,recordId,userId)) {
            model.addAttribute("alert", "还书成功");
        } else {
            model.addAttribute("alert", "还书失败");
        }
        return "getAllReturnedBooks";
    }
    @RequestMapping("returnChosenBooks")
    public String returnChosenBooks(String values,Model model){
        String[] books = values.split(",");
        for (String book : books) {
            String[] split = book.split("!");
            returnBookById(Integer.parseInt(split[0]),Integer.parseInt(split[1]),Integer.parseInt(split[2]),model);
        }
        return "getAllReturnedBooks";
    }
}
