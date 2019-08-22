
博客地址： [iOS中OC和JS交互方法2019最新最全总结、](https://www.jianshu.com/p/c80c5727b73f)

# 实现：
网页端（下面统称JS）APP端（下面统称OC）。

JS和OC可以相互调用方法。

JS和OC可以相互传递参数。

JS和OC传递的参数（多个/单个/无参数）。

## JS代码
1、首先定义一个Button、注册一个按钮点击事件`wechatPay()`。

2、在这里面通过  `app.onWechatPay('wechatPayBack'); `   来实现JS调用OC方法。

`app` 这个是和OC约定，随便写都可以只要OC里面的`context[@"app"]` 对应就好。

`onWechatPay `就是OC响应JS的方法，方法名字和OC的代码需要一一对应。

`wechatPayBack `就是OC进行数据回传的方法，方法名字和OC的代码需要一一对应。

`onPayParameter `就是JS传递参数给OC，里面可以多个单数，单个参数，如果无参数则该段代码可以注释。

`function wechatPayBack(){}`方法就是JS接受OC传递过来参数方法。和上面的

`app.onWechatPay('wechatPayBack'); ` 里面的方法名一一对应。另外在闭包函数`{}`里面做自己逻辑处理。


```
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<body>
<input type="button" name="" value="微信支付" onclick="wechatPay()">

<script type="text/javascript">

//  h5->app （带参数） 调用APP微信支付
function wechatPay(){
app.onWechatPay('wechatPayBack'); // 调用OC方法
onPayParameter("张三", "18899977711"); // 传递参数给OC,如果无参数则该段代码可以注释。
}

// app->h5 （带参数）微信支付结果返回
function wechatPayBack(parameter1,parameter2){
// 在里面做自己的业务逻辑
alert("支付结果:" + parameter1 + " " + parameter2 )
}
</script>

</body>

</html>

```
