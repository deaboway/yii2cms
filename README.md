# 基于yii2cms后台快速搭建框架实现

------

本框架在yii2cms后台快速搭建框架基础上实现。基于YII2+Layui，后端主要集成了如下功能：
> * RBAC权限控制
> * 前台用户管理
> * 系统参数配置
> * 系统访问日志
> * 微信公众号开发组件

系统目录结构如下
DIRECTORY STRUCTURE
-------------------

```
api
    assets/             资源发布文件
    controllers/        控制器文件
    models/             模型文件
    modules/            模块文件
        v1/             接口V1
            controllers 控制器
            views       视图文件
            Module.php  模块
    runtime/            运行缓存
    views/              视图文件
    web/                入口目录
common
    config/             配置文件
    mail/               邮件模板
    models/             模型文件
    tests/              测试模块
console
    config/             配置文件
    controllers/        控制器文件
    migrations/         数据库迁移文件
    models/             模型文件
    runtime/            运行缓存
backend
    assets/             资源发布文件
    config/             配置文件
    controllers/        控制器文件
    models/             模型文件
    modules/            后台其他模块
    runtime/            运行缓存
    tests/              测试模块
    views/              视图
    web/                入口文件
frontend
    assets/             资源发布文件
    config/             配置文件
    controllers/        控制器文件
    models/             模型文件
    runtime/            运行缓存
    tests/              测试模块
    views/              视图
    web/                入口文件
    widgets/            插件
vendor/                 composer安装文件
environments/           环境文件
```

**安装教程**

 1. 使用本系统之前先安装composer工具
 2. 把本项目克隆下来 `git clone https://github.com/deaboway/yii2cms.git`
 3. 运行 `composer install`,然后再在项目根目录运行 `php init` 进行项目初始化配置
 4. 运行./yii migrate，导入数据库信息
 5. 修改数据库配置
 6. 配置本地memcache服务，由于用到配置文件，所以用memcache缓存相关参数!
 7. 部署好之后需要配置Nginx或者Apache项
 8. 装好之后的默认管理员账号：admin 密码：123456 演示账号：demo 密码：123456