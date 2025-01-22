import { AxiosResponse } from '@ohos/axios'
import { regist } from '../data/Customer'

/**
 * 注册页面
 */
@Entry
@Component
struct Reg {
  async aboutToAppear(): Promise<void> {
    let response:AxiosResponse = await regist("13112345645","abc123","user123")
    AlertDialog.show({message:JSON.stringify(response)})
  }

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
        .onClick(()=>{
          // TODO: 自己写注册的逻辑
        })

    }.height("100%")
    .width("100%")
    .padding(20)
  }
}