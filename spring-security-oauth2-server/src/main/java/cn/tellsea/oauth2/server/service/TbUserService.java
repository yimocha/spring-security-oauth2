package cn.tellsea.oauth2.server.service;

import cn.tellsea.oauth2.server.bean.TbUser;

public interface TbUserService {
    default TbUser getByUsername(String username) {
        return null;
    }
}
