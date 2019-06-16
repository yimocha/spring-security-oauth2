package cn.tellsea.oauth2.server.mapper;

import cn.tellsea.oauth2.server.bean.TbPermission;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.MyMapper;

import java.util.List;

public interface TbPermissionMapper extends MyMapper<TbPermission> {
    List<TbPermission> selectByUserId(@Param("userId") Long userId);
}
