
/**
 * 注册页面
 */
@Entry
@Component
struct Reg {

  build() {
    Column(){
      // 头部
      Navigation()
        .title("用户注册")
        .titleMode(NavigationTitleMode.Mini)
        .height(50)


      // 用户注册
      Text("用户注册")
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Red)
        .fontSize(30)
        .margin({top:150})

      TextInput({placeholder:"请输入用户名"})
        .padding(10)
        .margin({top:10})
      TextInput({placeholder:"请输入密码"})
        .type(InputType.Password)
        .padding(10)
        .margin({top:10})
      TextInput({placeholder:"请输入昵称"})
        .padding(10)
        .margin({top:10})


      // 用户注册按钮
      Button("用户注册")
        .margin({top:30})
        .type(ButtonType.Normal)
        .width("100%")
        .borderRadius(15)
        .backgroundColor(Color.Red)

    }.height("100%")
    .width("100%")
    .padding(20)
  }
}