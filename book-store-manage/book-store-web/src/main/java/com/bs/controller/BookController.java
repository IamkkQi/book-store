package com.bs.controller;

import com.bs.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by Kay on 2017/5/28.
 */
@Controller
@RequestMapping("bs/book")
public class BookController {
    @Resource
    private BookService bookService;

    /**
     * 分类查找
     * @param model
     * @param categoryId
     * @return
     */
    @RequestMapping("books")
    public String books(Model model, Long categoryId) {
        model.addAttribute("books", bookService.listBooks(categoryId));
        return "book/book";
    }

    @RequestMapping("searchBooks")
    public String searchBooks(Model model, String keys) {
        model.addAttribute("books", bookService.listByKeys(keys));
        return "book/book";
    }
}
