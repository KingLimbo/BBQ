/*
 * Copyright © 2020 - 2021 www.limbodevil.top
 */

package com.limbo.practice.base.dao;

import com.limbo.practice.core.mybatis.MybatisDao;
import com.limbo.practice.core.base.BaseDao;
import com.limbo.practice.base.entity.SysUser;

/**
*
* @ProjectName: long-night
* @PackageName: com.limbo.practice.base.dao
* @ClassName: SysUserDao
* @Description: TODO(这里用一句话描述这个类的作用)
* @Author: limbo
* @Date: 2021-05-26 10:08:21
* @Modifier: limbo
* @ModifiedDate: 2021-05-26 10:08:21
*
* version V1.0
*/

@MybatisDao
public interface SysUserDao extends BaseDao<SysUser> {

}
