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
    // 在登陆页面创建出来之后 将这个缓存对象创建
    PersistentStorage.PersistProp('token','')//启动页面，初始化token
  }

  @State
  username:string = ''        // 手机号

  @State
  password:string = ''        // 密码


  @StorageLink('token') token:string = '' //双向同步token

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


      TextInput({placeholder:"请输入用户名",text:this.username})
        .margin({top:30})
      TextInput({placeholder:"请输入密码",text:this.password})
        .margin({top:30})
        .type(InputType.Password)

      Button("登陆")
        .backgroundColor(Color.Red)
        .type(ButtonType.Normal)
        .borderRadius(15)
        .width("100%")
        .margin({top:30})
        .onClick(async ()=>{
          // 发送登陆请求 跳转到首页
          let response:AxiosResponse = await login(this.username,this.password)
          // 如果存在token 应该将token添加到缓存中
         if(response.data.data){
           this.token = response.data.data
         }
          // 跳转页面
          router.pushUrl({
            url: "pages/MainPage"
          })
        })


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