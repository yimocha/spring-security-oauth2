package cn.tellsea.oauth2.server.service;

import cn.tellsea.oauth2.server.bean.TbPermission;

import java.util.List;

public interface TbPermissionService {
    default List<TbPermission> selectByUserId(Long userId) {
        return null;
    }
}
