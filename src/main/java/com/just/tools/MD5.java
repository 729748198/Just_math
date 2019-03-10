package com.just.tools;

import java.security.MessageDigest;

/**
 * @author 贺文杰
 * 2019/3/8 22:03
 */

public class MD5 {

    public static String md5(String str) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes());
            byte b[] = md.digest();

            int i;

            StringBuffer buf = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0) {
                    i += 256;
                }
                if (i < 16) {
                    buf.append("0");
                    buf.append(Integer.toHexString(i));
                }
            }
            str = buf.toString();
        } catch (Exception e) {
            e.printStackTrace();

        }
        return str;
    }

    public static void main(String[] args) {
        System.out.println(md5("hemy8888"));
    }

}
