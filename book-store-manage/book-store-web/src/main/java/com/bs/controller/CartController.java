package com.bs.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.bs.bean.PageBean;
import com.bs.constants.Constants;
import com.bs.pojo.Order;
import com.bs.pojo.ReceivingAddress;
import com.bs.pojo.User;
import com.bs.service.BookService;
import com.bs.service.OrderService;
import com.bs.service.ReceivingAddressService;
import com.bs.util.CollectionVO;
import com.bs.utils.string.StringUtil;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;

/**
 * Created by Kay on 2017/5/23.
 */
@Controller
@RequestMapping("bs/cart")
public class CartController {

    @Resource
    private BookService bookService;
    @Resource
    private ReceivingAddressService receivingAddressService;
    @Resource
    private OrderService orderService;

    /**
     * 加入购物车
     * @param session
     * @param bookId
     * @return
     */
    @RequestMapping("addCart")
    @ResponseBody
    public Object addCart(HttpSession session, Long bookId) {
        // 返回信息
        Map<String, Object> resultMap = new HashMap<>();
        // ook book = bookService.getById(bookId);
        // 创建购物车
        Map<String, Object> cart;
        // 获取session中的购物车
        Object cartObj = session.getAttribute("cart");
        try {
            // 第一次加入购物车
            if(cartObj == null) {
                cart = new HashMap<>();
                cart.put(bookId.toString(), 1);
            } else {
                // 非第一次加入购物车
                cart = (Map<String, Object>) cartObj;
                // 添加商品不一样
                if (cart.get(bookId.toString()) != null) {
                    cart.put(bookId.toString(), (int) cart.get(bookId.toString()) + 1);
                } else {
                    // 新建商品不添加
                    cart.put(bookId.toString(), 1);
                }
            }
            session.setAttribute("cart", cart);
            resultMap.put("flag", "yes");
        } catch (Exception e) {
            resultMap.put("flag", "no");
            e.printStackTrace();
        }
        return resultMap;
    }

    /**
     * 我的购物车
     * @param model
     * @return
     */
    @RequestMapping("myCart")
    public String myCart(Model model, HttpSession session) {
        Object cartObj = session.getAttribute("cart");
        List<Map<String, Object>> cartInfos = new ArrayList<>();
        if(cartObj != null) {
            Map<String, Object> cart = (Map<String, Object>) cartObj;
            for (Map.Entry<String, Object> entry : cart.entrySet()) {
                // System.err.println("key = " + entry.getKey() + " --- value = " + entry.getValue());
                Map<String, Object> cartInfo = bookService.getBooksDetailsById(Long.valueOf(entry.getKey()));
                int num = (int) entry.getValue();
                cartInfo.put("num", num);
                BigDecimal bookPrice = (BigDecimal) cartInfo.get("bookPrice");
                cartInfo.put("totalPrice", bookPrice.multiply(BigDecimal.valueOf(num)));
                cartInfos.add(cartInfo);
            }
        }
        model.addAttribute("cartInfos", cartInfos);
        return "cart/cart";
    }

    /**
     * 删除购物车信息
     * @param session
     * @param bid
     * @return
     */
    @RequestMapping("deleteCart/{bid}")
    @ResponseBody
    public Object deleteCart(HttpSession session, @PathVariable("bid") Long bid) {
        // 返回信息
        Map<String, Object> resultMap = new HashMap<>();
        Object cartObj = session.getAttribute("cart");
        try {
            if (cartObj != null) {
                Map<String, Object> cart = (Map<String, Object>) cartObj;
                cart.remove(bid.toString());
                session.setAttribute("cart", cart);
            }
            resultMap.put("flag", "yes");
        } catch (Exception e) {
            resultMap.put("flag", "no");
            e.printStackTrace();
        }
        return resultMap;
    }

    /**
     * 批量删除
     * @param session
     * @param ids
     * @return
     */
    @RequestMapping("deleteBatchCart")
    @ResponseBody
    public Object deleteBatchCart(HttpSession session, String ids) {
        Map<String, Object> resultMap = new HashMap<>();
        try {
            Map<String, Object> cart = (Map<String, Object>) session.getAttribute("cart");
            if(!StringUtils.isEmpty(ids)) {
                String[] split = ids.split(",");
                for (String id : split) {
                    cart.remove(id);
                }
                session.setAttribute("cart", cart);
            }
            resultMap.put("flag", "yes");
        } catch (Exception e) {
            resultMap.put("flag", "no");
            e.printStackTrace();
        }
        return resultMap;
    }

    /**
     * 结算
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("settlement")
    public String settlement(Model model, HttpSession session, String ids) {
        // 购物车中的信息
        List<Map<String, Object>> settInfos = new ArrayList<>();
        Map<String, Object> cart = (Map<String, Object>) session.getAttribute("cart");
        BigDecimal total = new BigDecimal("0.00");
        if(!StringUtils.isEmpty(ids)) {
            String[] split = ids.split(",");
            for (String id : split) {
                Map<String, Object> cartInfo = bookService.getBooksDetailsById(Long.valueOf(id));
                int num = (int) cart.get(id);
                cartInfo.put("num", num);
                BigDecimal bookPrice = (BigDecimal) cartInfo.get("bookPrice");
                cartInfo.put("totalPrice", bookPrice.multiply(BigDecimal.valueOf(num)));
                settInfos.add(cartInfo);
                BigDecimal multiply = bookPrice.multiply(BigDecimal.valueOf(num));
                total = total.add(multiply);
            }
        }
        // model.addAttribute("settInfos", settInfos);
        session.setAttribute("settInfos", settInfos);
        // 用户收货地址
        User user = (User) session.getAttribute("user");
        List<ReceivingAddress> receivingAddresses = receivingAddressService.listByUserId(user.getId());
        model.addAttribute("raList", receivingAddresses);
        model.addAttribute("ids", ids);
        model.addAttribute("bookMount", settInfos.size());
        model.addAttribute("total", total);
        return "cart/settlement";
    }

    /**
     *  保存收获地址
     * @return
     */
    @RequestMapping("saveRa")
    public String saveRa(HttpSession session, ReceivingAddress ra, String ids) {
        User user = (User) session.getAttribute("user");
        ra.setIsDefault(0);
        ra.setUserId(user.getId());
        receivingAddressService.save(ra);
        return "redirect:/bs/cart/settlement?ids=" + ids;
    }

    /**
     * 设为默认地址
     * @param session
     * @param raId
     * @return
     */
    @RequestMapping("setDefault")
    @ResponseBody
    public Object setDefault(HttpSession session, Long raId) {
        Map<String, Object> resultMap = new HashMap<>();
        User user = (User) session.getAttribute("user");
        // 先把原来的默认去掉
        try {
            ReceivingAddress raDefaultDB = receivingAddressService.getRAByWithDefault(user.getId());
            if(raDefaultDB != null) {
                raDefaultDB.setIsDefault(0);
               receivingAddressService.update(raDefaultDB);
            }
            ReceivingAddress raDB = receivingAddressService.getById(raId);
            if(raDB != null) {
                raDB.setIsDefault(1);
                receivingAddressService.update(raDB);
            }
            resultMap.put("flag", "yes");
        } catch (Exception e) {
            resultMap.put("flag", "no");
            e.printStackTrace();
        }
        return resultMap;
    }

    /**
     * 获取收获地址信息
     * @param raId
     * @return
     */
    @RequestMapping("getRAInfo/{raId}")
    @ResponseBody
    public Object getRAInfo(@PathVariable("raId") Long raId) {
        ReceivingAddress receivingAddress = receivingAddressService.getById(raId);
        return receivingAddress;
    }

    /**
     * 编辑收货地址
     * @param ra
     * @param ids
     * @return
     */
    @RequestMapping("editRa")
    public String editRa(ReceivingAddress ra, String ids) {
        ReceivingAddress raDB = receivingAddressService.getById(ra.getId());
        if (raDB != null) {
            raDB.setReceivingName(ra.getReceivingName());
            raDB.setReceivingTel(ra.getReceivingTel());
            raDB.setProvince(ra.getProvince());
            raDB.setCity(ra.getCity());
            raDB.setDistrict(ra.getDistrict());
            raDB.setDetails(ra.getDetails());
            raDB.setZipCode(ra.getZipCode());
            receivingAddressService.update(raDB);
        }
        return "redirect:/bs/cart/settlement?ids=" + ids;
    }

    /**
     * 生成订单
     * @param model
     * @param session
     * @param raId
     * @param order
     * @return
     */
    @RequestMapping(value = "generateOrder", method = RequestMethod.POST)
    public String generateOrder(Model model, HttpSession session, Long raId, Order order) {
        List<Map<String, Object>> settInfos = (List<Map<String, Object>>) session.getAttribute("settInfos");
        User user = (User) session.getAttribute("user");
        order.setOrderNum(StringUtil.getOrderNum());
        order.setBookInfos(JSON.toJSONString(settInfos));
        ReceivingAddress address = receivingAddressService.getById(raId);
        String raDetails = address.getProvince() + " " + address.getCity() + " " + address.getDistrict() + " " + address.getDetails();
        order.setReceivingAddress(raDetails);
        order.setReceivingName(address.getReceivingName());
        order.setReceivingTel(address.getReceivingTel());
        order.setIsDel(0);
        order.setCreateTime(new Date());
        order.setUserId(user.getId());
        order.setStatus(0);
        orderService.save(order);
        model.addAttribute("order", order);
        session.removeAttribute("cart");
        return "cart/order";
    }

    /**
     * 我的订单
     * @param model
     * @param session
     * @param pageNum
     * @return
     */
    @RequestMapping("myOrder")
    public String myOrder(Model model, HttpSession session, @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        User user = (User) session.getAttribute("user");
        List<Map<String, Object>> orderList = orderService.listByUserId(pageNum, user.getId());
        for (Map<String, Object> order : orderList) {
            String bookStr = (String) order.get("bookInfos");
            if(!StringUtils.isEmpty(bookStr)) {
                List<Map<String, Object>> list = JSONObject.parseObject(bookStr, List.class);
                order.put("books", list);
                order.put("rows", list.size());
            }
        }
        PageBean<Map<String, Object>> pageBean = new PageBean<>(pageNum, Constants.PAGE_SIZE, orderList, orderService.countByUserId(user.getId()));
        model.addAttribute("pageBean", pageBean);
        return "cart/myOrder";
    }

    @RequestMapping("delOrder/{oid}")
    public String delOrder(@PathVariable("oid") Long oid) {
        Order order = orderService.getById(oid);
        order.setIsDel(1);
        order.setDeleteTime(new Date());
        orderService.update(order);
        return "redirect:/bs/cart/myOrder";
    }

    @RequestMapping("cancelOrder")
    public String cancelOrder(Long oid, Integer status, String description) {
        Order order = orderService.getById(oid);
        order.setStatus(status);
        order.setDescription(description);
        order.setUpdateTime(new Date());
        orderService.update(order);
        return "redirect:/bs/index";
    }

    @RequestMapping("completeOrder")
    public String completeOrder(Long oid, Integer status) {
        Order order = orderService.getById(oid);
        order.setStatus(status);
        order.setUpdateTime(new Date());
        orderService.update(order);
        return "redirect:/bs/index";
    }
}
