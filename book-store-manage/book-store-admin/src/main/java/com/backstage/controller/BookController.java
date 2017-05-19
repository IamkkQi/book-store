package com.backstage.controller;

import com.bs.bean.PageBean;
import com.bs.constants.Constants;
import com.bs.pojo.Book;
import com.bs.service.BookService;
import com.bs.service.CategoryService;
import com.bs.utils.time.DateFormatUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Kay on 2017/5/18.
 */

@Controller
@RequestMapping("admin/book")
public class BookController {

    @Resource
    private BookService bookService;
    @Resource
    private CategoryService categoryService;

    /**
     * 图书列表
     * @param model
     * @param pageNum
     * @param keys
     * @return
     */
    @RequestMapping("list")
    public String list(Model model, @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, String keys) {

        List<Map<String, Object>> books = bookService.listAllBooks(pageNum, keys);
        PageBean<Map<String, Object>> pageBean = new PageBean<>(pageNum, Constants.PAGE_SIZE, books, bookService.countAllBooks(keys));
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("categories", categoryService.listCategoriesByLevel(2));
        return "book/list";
    }

    /**
     * 图书详情
     * @param model
     * @param bid
     * @return
     */
    @RequestMapping("details/{bid}")
    public String details(Model model, @PathVariable("bid") Long bid) {
        Map<String, Object> book = bookService.getBooksDetailsById(bid);
        model.addAttribute("book", book);
        model.addAttribute("categories", categoryService.listCategoriesByLevel(2));
        return "book/details";
    }

    /**
     * 编辑图书基本信息
     * @param book
     * @param bookPubTimeStr 出版时间的字符串
     * @return
     * @throws ParseException
     */
    @RequestMapping("editJBBook")
    public String editJBBook(Book book, String bookPubTimeStr) throws ParseException {
        Book bookDB = bookService.getById(book.getId());
        if (bookDB != null) {
            bookDB.setBookName(book.getBookName());
            bookDB.setBookAuthor(book.getBookAuthor());
            bookDB.setBookNumber(book.getBookNumber());
            bookDB.setCategoryId(book.getCategoryId());
            bookDB.setBookPress(book.getBookPress());
            bookDB.setBookPages(book.getBookPages());
            bookDB.setBookSize(book.getBookSize());
            bookDB.setBookPrice(book.getBookPrice());
            bookDB.setBookMarketPrice(book.getBookMarketPrice());
            bookDB.setBookVIPPrice(book.getBookVIPPrice());
            if (!StringUtils.isEmpty(bookPubTimeStr)) {
                bookDB.setBookPubTime(DateFormatUtil.parseDate("yyyy-MM-dd", bookPubTimeStr));
            }
            bookDB.setUpdateTime(new Date());
            bookService.update(bookDB);
        }
        return "redirect:/admin/book/details/" + book.getId();
    }

    /**
     * 编辑库存信息
     * @param book
     * @param bookStoreTimeStr
     * @return
     * @throws ParseException
     */
    @RequestMapping("editKCBook")
    public String editKCBook(Book book, String bookStoreTimeStr) throws ParseException {
        Book bookDB = bookService.getById(book.getId());
        if(bookDB != null) {
            bookDB.setStatus(book.getStatus());
            bookDB.setBookStoreMount(book.getBookStoreMount());
            bookDB.setBookDealMount(book.getBookDealMount());
            if(!StringUtils.isEmpty(bookStoreTimeStr)) {
                bookDB.setBookStoreTime(DateFormatUtil.parseDate("yyyy-MM-dd", bookStoreTimeStr));
            }
            bookDB.setUpdateTime(new Date());
            bookService.update(bookDB);
        }
        return "redirect:/admin/book/details/" + book.getId();
    }

    /**
     * 添加图书
     * @param book
     * @param bookPubTimeStr
     * @return
     * @throws ParseException
     */
    @RequestMapping("addBook")
    public String addBook(Book book, String bookPubTimeStr) throws ParseException {
        if(!StringUtils.isEmpty(bookPubTimeStr)) {
            book.setBookPubTime(DateFormatUtil.parseDate("yyyy-MM-dd", bookPubTimeStr));
        }
        book.setCreateTime(new Date());
        book.setBookStoreTime(new Date());
        bookService.save(book);
        return "redirect:/admin/book/list";
    }

    /**
     * 图书上架
     * @param bid
     * @param status
     * @return
     */
    @RequestMapping("shelvesBook")
    public String shelvesBook(Long bid, Integer status) {
        Book book = bookService.getById(bid);
        if (book != null) {
            book.setStatus(status);
            book.setUpdateTime(new Date());
        }
        bookService.update(book);
        return "redirect:/admin/book/list";
    }

    /**
     * 删除图书
     * @param bid
     * @return
     */
    @RequestMapping("deleteBook/{bid}")
    public String deleteBook(@PathVariable("bid") Long bid) {
        Book book = bookService.getById(bid);
        if (book != null) {
            book.setIsDel(1);
            book.setDeleteTime(new Date());
        }
        bookService.update(book);
        return "redirect:/admin/book/list";
    }
}
