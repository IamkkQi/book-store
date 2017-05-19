package com.backstage.controller;

import com.bs.bean.PageBean;
import com.bs.constants.Constants;
import com.bs.pojo.Category;
import com.bs.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Kay on 2017/5/18.
 */
@Controller
@RequestMapping("admin/category")
public class CategoryController {
    @Resource
    private CategoryService categoryService;

    @RequestMapping("list")
    public String list(Model model, @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, String keys) {
        List<Map<String, Object>> categories = categoryService.listAllCategories(pageNum, keys);
        PageBean<Map<String, Object>> pageBean = new PageBean<>(pageNum, Constants.PAGE_SIZE, categories, categoryService.countAllCategories(keys));
        model.addAttribute("pageBean", pageBean);
        List<Category> oneCategories = categoryService.listCategoriesByLevel(1);
        model.addAttribute("oneCategories", oneCategories);
        return "category/list";
    }

    /**
     * 添加分类
     * @param category
     * @return
     */
    @RequestMapping("addCategory")
    public String addCategory(Category category) {
        category.setCreateTime(new Date());
        categoryService.save(category);
        return "redirect:/admin/category/list";
    }

    /**
     * 编辑分类
     * @param category
     * @return
     */
    @RequestMapping("editCategory")
    public String editCategory(Category category) {
        Category categoryDB = categoryService.getById(category.getId());
        if (categoryDB != null) {
            categoryDB.setCategoryNumber(category.getCategoryNumber());
            categoryDB.setCategoryName(category.getCategoryName());
            categoryDB.setUpdateTime(new Date());
            categoryDB.setLevel(category.getLevel());
            categoryService.update(categoryDB);
        }
        return "redirect:/admin/category/list";
    }

    /**
     * 删除分类
     * @param cid
     * @return
     */
    @RequestMapping("deleteCategory/{cid}")
    public String deleteCategory(@PathVariable("cid") Long cid) {
        Category category = categoryService.getById(cid);
        category.setIsDel(1);
        category.setDeleteTime(new Date());
        if(category.getLevel() == 1) {
            Date date = new Date();
            List<Category> categories = categoryService.listCategoriesByParentId(category.getId());
            if (categories != null && categories.size() >= 0) {
                for (Category c : categories) {
                    c.setIsDel(1);
                    c.setDeleteTime(date);
                }
                categoryService.updateBatch(categories);
            }
        }
        categoryService.update(category);
        return "redirect:/admin/category/list";
    }
}
