import { JSON, url } from '@kit.ArkTS'
import { router } from '@kit.ArkUI'
import { AxiosResponse } from '@ohos/axios'
import { login } from '../data/Customer'
import { instance, paramsToString } from '../utils/Axios'
import json from '@ohos.util.json'

@Entry
@Component
struct Login {
  async aboutToAppear(): Promise<void> {
    // 验证登陆
    let response:AxiosResponse = await login('13600000002',"abc123")
    console.info(`=======>${JSON.stringify(response.data)}`)
  }

  build() {
    Column() {
      Image($r('app.media.ic_icon'))
        .width(100)
        .height(100)
        .margin({top:150})


      Text("学掌门商城")
        .fontSize(30)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bold)
        .margin({top:30})


      TextInput({placeholder:"请输入用户名"})
        .margin({top:30})
      TextInput({placeholder:"请输入密码"})
        .margin({top:30})
        .type(InputType.Password)

      Button("登陆")
        .backgroundColor(Color.Red)
        .type(ButtonType.Normal)
        .borderRadius(15)
        .width("100%")
        .margin({top:30})


      Text("注册账号")
        .fontColor(Color.Red)
        .fontSize(18)
        .margin({top:30})
        .onClick(()=>{
          router.pushUrl({
            url:"pages/Reg"
          })
        })
    }.width("100%")
    .padding(20)
  }
}