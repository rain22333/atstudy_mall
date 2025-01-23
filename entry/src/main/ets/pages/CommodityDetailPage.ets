import { router } from '@kit.ArkUI'
import { it } from '@ohos/hypium'
import { CapsuleGroupButton } from '../component/CapsuleGroupButton'

/**
 * 商品详情页面
 */
@Entry
@Component
struct CommodityDetailPage {
  @State
  swiperIndex: number = 0 // 轮播器中正在播放的图片的索引

  build() {


    Column() {


      // 包含了轮播图片的顶部
      Stack({ alignContent: Alignment.TopStart }) {
        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween }) {
          //  顶部的两个图标 负责返回和分享
          Button() {
            Image($r('app.media.ic_back'))
              .height("100%")
              .aspectRatio(1)
          }.titleButton()
          .onClick(() => router.back())


          Button() {
            Image($r('app.media.ic_share'))
              .height("100%")
              .aspectRatio(1)
          }.titleButton()

          // todo: 分享事件
        }
      }.padding(20)


      // this.CustomerSwiper([
      //   `group1/M00/00/00/4961-2529e6462a4c9ca3.jpg`,
      //   `group1/M00/00/00/4961-55c2cabfNe083b446.jpg`
      // ])

      // 下方内容
      Flex({direction:FlexDirection.Column}){
        Scroll(){

          // 屏幕滚动区域
          GridRow({
            columns:{sm:4},
            gutter:12
          }){
            GridCol({
              span:{sm:4}
            }){
              // 轮播器组件
              this.CustomerSwiper([
                `group1/M00/00/00/1796-a1a6f8e9e71017d9.jpg`,
                `group1/M00/00/00/1796-4577568b84d7e023.jpg`
              ])
            }

            GridCol({
              span:{sm:4},
              offset:{lg:12}
            }){
              Column(){
                // 商品详情
              }
            }
          }
        }.flexGrow(1)

        GridRow({
          columns:{ sm:4 },
          gutter: 12
        }){
          GridCol({
            span:{sm:4},
            offset:{lg:2}
          }){
            // 页面底部
            this.ButtonMenu()
          }
        }
      }

    }.width("100%")
    .height("100%")

  }

  // 底部菜单栏
  @Builder
  ButtonMenu() {
    Flex({ alignItems: ItemAlign.Center }) {
      Row() {
        // 首页
        Flex({
          direction: FlexDirection.Column,
          justifyContent: FlexAlign.Center,
          alignItems: ItemAlign.Center
        }) {
          Image($r('app.media.ic_home'))
            .height(25)
            .width(25)
          Text("首页")
            .fontSize(10)
            .fontColor('#ccc')
            .margin(4)
        }
        .onClick(() => {
          // TODO: 回到首页页面
        })
        .height("100%")
        .width(75)


        // 购物车
        Flex({
          direction: FlexDirection.Column,
          justifyContent: FlexAlign.Center,
          alignItems: ItemAlign.Center
        }) {
          Image($r('app.media.ic_shopping_cart'))
            .height(25)
            .width(25)
          Text("购物车")
            .fontSize(10)
            .fontColor('#ccc')
            .margin(4)
        }
        .onClick(() => {
          // TODO: 跳转到购物车页面
        })
        .height("100%")
        .width(75)

        // 自定义按钮组
        CapsuleGroupButton({
          config: [
            {
              text: "加入购物车",
              onclick: (): void => {
              }
            },
            {
              text: "立即购买",
              onclick: (): void => {
              }
            }
          ]
        })

      }.width("100%")
    }
  }

  // 轮播器
  @Builder
  CustomerSwiper(payload: string[]) {
    Stack({ alignContent: Alignment.BottomEnd }) {
      // 轮播器
      Swiper() {
        ForEach(payload, (item: string) => {
          Flex({ justifyContent: FlexAlign.Center }) {
            Image(`http://124.222.209.62/api/img/` + item)
              .width("100%")
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
          }.margin({
            left: 40,
            right: 40,
            top: 20,
            bottom: 20
          })
        })
      }
      .autoPlay(true)
      .onChange((index: number) => {
        this.swiperIndex = index
      })
      .indicator(false)
      .width("100%")

      // 右下角的图标
      Text(`${this.swiperIndex + 1}/${payload.length}`)
        .fontSize(12)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .width(34)
        .height(18)
        .backgroundColor("#000")
        .borderRadius(9)
        .margin({
          right: 16,
          bottom: 16
        })
    }.width("100%")
    .height(550)
    .backgroundColor(Color.White)
  }
}

@Extend(Button)
function titleButton() {
  .backgroundColor('#ccc')
  .width(35)
  .height(35)
  .borderRadius(5)
}

