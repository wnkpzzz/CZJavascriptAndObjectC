# github_JSOC_wnkp

#实现：
这里使用微信第三方支付来讲解正好满足了所有的需求。
模拟一个微信支付场景：
JS调用OC，传递多个支付参数。
OC拿到参数跳转微信进行支付。
支付后OC将结果返回给JS。
流程完成。

#####我们先看JS代码
1、首先定义一个Button、注册一个按钮点击事件`wechatPay()`。
2、在这里面通过  `app.onWechatPay('wechatPayBack'); `   来实现JS调用OC方法。
`app` 这个是和OC约定，随便写都可以只要OC里面的`context[@"app"]` 对应就好。。
`onWechatPay `就是OC响应JS的方法，方法名字和OC的代码需要一一对应。
`wechatPayBack `就是OC进行数据回传的方法，方法名字和OC的代码需要一一对应。
`onPayParameter `就是JS传递参数给OC，里面可以多个单数，单个参数，如果无参数则该段代码可以注释。
`function wechatPayBack(){}`方法就是JS接受OC传递过来参数方法。和上面的`app.onWechatPay('wechatPayBack'); ` 里面的方法名一一对应。另外在闭包函数`{}`里面做自己逻辑处理。

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
