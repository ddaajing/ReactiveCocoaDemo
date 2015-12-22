 ***ReactiveCocoaDemo***
======

**Demo 概述**


该Demo主要用来测验MVVM模式的分层，使APP更方便维护，测试
以及练习ReactiveCocoa相关API

	首页 - 点击‘Load’，请求web service，加载数据，渲染表格

	列表页 - 点击‘Add’，填写表单，验证，添加数据


**涉及概念：**

关于ReactiveCocoa，有时并不会减少你的代码量，相反，会使代码
相对难以理解（习惯就好了），而且也难以调试（可以给每个Signal 设置setNameWithFormat来方便调试）。

它可以减少代码的复杂度(复杂项目比较适用)，结合MVVM模式使你的APP更好的分层，让每个VC的VM可以进行单元测试，因为VC里只有页面逻辑，VM里包含所有业务逻辑，VM也可以直接当成MODEL，VM是testable的。

- FRP
- MVVM
- RACCommand
- RACSignal
- RAC绑定宏
- flattenMap
- map
- filter
- rac_signalForSelector
- RACDelegateProxy

**参考资料：**

[ReactiveCocoa on Github
](https://github.com/ReactiveCocoa/ReactiveCocoa)

[Ray's blog](http://www.raywenderlich.com/62796/reactivecocoa-tutorial-pt2)

[Using RACCommand](http://codeblog.shape.dk/blog/2013/12/05/reactivecocoa-essentials-understanding-and-using-raccommand/)

`PS:`
用xcode6 bete测试kiwi会crash，改用xcode5
