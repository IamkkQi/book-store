package com.backstage.util;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by qkk on 2017/4/14.
 */
public class test {
    public static void main(String[] args) {
        List<Long> list1 = new ArrayList<>();

        list1.add(3L);
        List<Long> list2 = new ArrayList<>();
        list2.add(1L);
        list2.add(2L);
        list2.add(4L);



        list1.removeAll(list2);
        System.out.println(list1.removeAll(list2));
        for (int i = 0; i < list1.size(); i++) {
            System.out.println(list1.get(i));
        }



    }
}
