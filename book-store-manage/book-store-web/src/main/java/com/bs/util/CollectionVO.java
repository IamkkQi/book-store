package com.bs.util;

import java.util.List;
import java.util.Map;

/**
 * 用来接受集合类型的类
 * Created by Kay on 2017/5/30.
 */
public class CollectionVO {
    private List<Map<String, Object>> maps;

    public List<Map<String, Object>> getMaps() {
        return maps;
    }

    public void setMaps(List<Map<String, Object>> maps) {
        this.maps = maps;
    }
}
