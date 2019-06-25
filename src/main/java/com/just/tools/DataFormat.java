package com.just.tools;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DataFormat {
    public static Map<String,Object> formap(List list){
        Map<String,Object>map=new HashMap<>();
        map.put("code", 0);
        map.put("msg", "succ");
        map.put("conut", list.size());
        map.put("data",list);
        return map;
    }
}
