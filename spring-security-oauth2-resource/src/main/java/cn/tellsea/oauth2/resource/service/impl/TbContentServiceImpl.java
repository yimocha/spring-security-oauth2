package cn.tellsea.oauth2.resource.service.impl;

import cn.tellsea.oauth2.resource.bean.TbContent;
import cn.tellsea.oauth2.resource.mapper.TbContentMapper;
import cn.tellsea.oauth2.resource.service.TbContentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TbContentServiceImpl implements TbContentService {

    @Resource
    private TbContentMapper tbContentMapper;

    @Override
    public TbContent getById(Long id) {
        return tbContentMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<TbContent> selectAll() {
        return tbContentMapper.selectAll();
    }

    @Override
    public int insert(TbContent tbContent) {
        return tbContentMapper.insert(tbContent);
    }

    @Override
    public int update(TbContent tbContent) {
        return tbContentMapper.updateByPrimaryKey(tbContent);
    }

    @Override
    public int delete(Long id) {
        return tbContentMapper.deleteByPrimaryKey(id);
    }
}
