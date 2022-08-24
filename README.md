# pipeline-test

说明：测试作品，包含三个任务，目的是实现一键执行多任务。

考虑的问题

- 报错处理：若有报错，显示报错位置，同时保存工作空间内容
- IO：优先能读入多种格式文件的工具、高效IO
- R的并行
- 指定包的路径，防止版本冲突
- 运行结束返回提示
- 自动计算图片宽高比：需要验证。https://www.jianshu.com/p/aedb5cfd43dc
