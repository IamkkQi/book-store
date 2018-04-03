package com.bs.service.impl;

import com.bs.constants.Constants;
import com.bs.dao.impl.BaseDAOImpl;
import com.bs.pojo.Book;
import com.bs.service.BookService;
import com.bs.utils.string.StringUtil;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;

/**
 * Created by qkk on 2017/4/10.
 */
@Service
@Transactional
public class BookServiceImpl extends BaseDAOImpl<Book> implements BookService {
    @Override
    public List<Map<String, Object>> listAllBooks(Integer pageNum, String keys) {
        String sqlKeys = "";
        if(!StringUtils.isEmpty(keys)) {
            sqlKeys = " AND (b.bookName LIKE '%" + keys + "%' OR b.bookAuthor LIKE '%" + keys + "%') ";
        }

        StringBuffer sb = new StringBuffer();
        sb.append("SELECT b.id,b.bookName,b.bookAuthor,b.bookPrice,b.bookNumber,b.bookPress,b.bookStoreMount,b.status,");
        sb.append("b.updateTime,c.categoryName ");
        sb.append("FROM bs_book b ");
        sb.append("LEFT JOIN bs_category c ON c.id = b.categoryId ");
        sb.append("WHERE b.isDel = 0 " + sqlKeys);
        sb.append("ORDER BY b.updateTime DESC LIMIT " + (pageNum - 1) * Constants.PAGE_SIZE + "," + Constants.PAGE_SIZE);
        return getSession().createSQLQuery(sb.toString()).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
    }

    @Override
    public int countAllBooks(String keys) {
        String sqlKeys = "";
        if(!StringUtils.isEmpty(keys)) {
            sqlKeys = " AND (b.bookName LIKE '%" + keys + "%' OR b.bookAuthor LIKE '%" + keys + "%') ";
        }

        String sql = "SELECT COUNT(b.id) FROM bs_book b LEFT JOIN bs_category c ON c.id = b.categoryId WHERE b.isDel = 0 " + sqlKeys;
        Number number = (Number) getSession().createSQLQuery(sql).uniqueResult();
        return number == null ? 0 : number.intValue();
    }

    @Override
    public Map<String, Object> getBooksDetailsById(Long bid) {
        String sql = "SELECT b.*, c.categoryName,(SELECT i.url FROM bs_image i WHERE i.fkId = b.id AND i.type = 1 LIMIT 0,1) AS imgUrl "
                + " FROM bs_book b LEFT JOIN bs_category c ON c.id = b.categoryId WHERE b.id = ?";
        return (Map<String, Object>) getSession().createSQLQuery(sql).setParameter(0, bid).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).uniqueResult();
    }

    @Override
    public List<Map<String, Object>> listBooksWithHot() {
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT b.*,c.categoryName, ");
        sb.append("(SELECT i.url FROM bs_image i WHERE i.fkId = b.id LIMIT 0,1) AS imgUrl ");
        sb.append("FROM bs_book b ");
        sb.append("LEFT JOIN bs_category c ON c.id = b.categoryId ");
        sb.append("WHERE b.isDel = 0 AND b.status = 1 AND b.isHot = 1 ORDER BY b.updateTime DESC ");
        return getSession().createSQLQuery(sb.toString()).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
    }

    @Override
    public List<Map<String, Object>> listBooks(Long categoryId) {
        String sqlCategory = "";
        if (categoryId != null) {
            sqlCategory = " AND b.categoryId = " + categoryId;
        }
        StringBuffer sb = new StringBuffer();
        sb.append("SELECT b.*,c.categoryName, ");
        sb.append("(SELECT i.url FROM bs_image i WHERE i.fkId = b.id LIMIT 0,1) AS imgUrl ");
        sb.append("FROM bs_book b ");
        sb.append("LEFT JOIN bs_category c ON c.id = b.categoryId ");
        sb.append("WHERE b.isDel = 0 AND b.status = 1 ");
        sb.append(sqlCategory);
        sb.append(" ORDER BY b.updateTime DESC ");
        return getSession().createSQLQuery(sb.toString()).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
    }

    @Override
    public List<Map<String, Object>> listByKeys(String keys) {
        String sqlKeys = "";
        if(!StringUtils.isEmpty(keys)) {
            sqlKeys = " AND (b.bookName LIKE '%" + keys + "%' OR b.bookAuthor LIKE '%" + keys + "%') ";
        }

        StringBuffer sb = new StringBuffer();
        sb.append("SELECT b.*,c.categoryName,");
        sb.append("(SELECT i.url FROM bs_image i WHERE i.fkId = b.id LIMIT 0,1) AS imgUrl ");
        sb.append("FROM bs_book b ");
        sb.append("LEFT JOIN bs_category c ON c.id = b.categoryId ");
        sb.append("WHERE b.isDel = 0 AND b.status = 1 " + sqlKeys);
        sb.append("ORDER BY b.updateTime");
        return getSession().createSQLQuery(sb.toString()).setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
    }
}
