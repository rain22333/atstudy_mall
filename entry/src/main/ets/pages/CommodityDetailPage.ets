import { router } from '@kit.ArkUI'
import { it } from '@ohos/hypium'
import { CapsuleGroupButton } from '../component/CapsuleGroupButton'
import { BarData, barData, Commodity, commodityData } from '../viewmodel/ComodityModel'
import { SpecificationDialog } from './SpecificationDialog'

/**
 * 商品详情页面
 */
@Entry
@Component
struct CommodityDetailPage {
  @State
  swiperIndex: number = 0 // 轮播器中正在播放的图片的索引

  @State
  count: number = 1       // 当前选中的规格数

  @State
  productOptions:string = ''     // 当前选中的规格文案


  dialogController: CustomDialogController = new CustomDialogController({
    builder: SpecificationDialog({

    }),
    autoCancel:true,     // 不自动取消
    alignment: DialogAlignment.Bottom,       // 显示的位置
    customStyle:true
  })


  build() {
    // 包含了轮播图片的顶部
    Stack({ alignContent: Alignment.TopStart }) {

      // 下方内容
      Flex({direction:FlexDirection.Column}){
        Scroll(){
          //屏幕可滚动区域，
          GridRow({columns:4,gutter:12}){
            GridCol({span:4}){
              // 轮播器组件
              this.CustomerSwiper([
                `group1/M00/00/00/1796-a1a6f8e9e71017d9.jpg`,
                `group1/M00/00/00/1796-4577568b84d7e023.jpg`
              ])
            }

            GridCol({ span:4}) {
              Column() {
                // 商品详情
                this.TitleBar(commodityData[0])

                // 选择规格
                this.Specification()
              }
            }
          }
        }.flexGrow(2)

        //栅格布局，存放底部购物车栏位
        GridRow({
          columns:4,
          gutter:12
        }){
          GridCol({
            span:4
          }){
            //存放底部购物车栏位的内容
            this.ButtonMenu()
          }
        }

      }

      // 顶部内容
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
      }.backgroundColor(Color.White)
      .padding(12)
    }
    .backgroundColor('#f3f4f5')

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
        .height(75)
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
        .height(75)
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
        },(item:string)=>JSON.stringify(item))
      }.height("100%")
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
    .height(350)
    .backgroundColor(Color.White)
  }

  // 商品标题价格栏
  @Builder
  TitleBar(payload: Commodity) {
    Flex({ direction: FlexDirection.Column }) {
      Text() {
        Span(`￥`)
          .fontSize(12)
          .fontColor(Color.Red)
        Span(`${payload.skuList[0].sku_price}`)
          .fontSize(18)
          .fontColor(Color.Red)
      }

      Row() {
        Text(`【${payload.spu_name}】 ${payload.spu_title}`)
          .fontColor(Color.Black)
          .fontWeight(900)
      }.width("100%")
      .margin({ top: 5 })


      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        ForEach(barData, (item: BarData) => {
          Row() {
            Image(item.icon != undefined ? item.icon : '')
              .height(16)
              .width(16)
              .margin(4)
            Text(item.text)
              .fontSize(12)
              .fontColor('#ccc')
          }
        })
      }

    }
    .backgroundColorStyle()
  }


  // 选择规格
  @Builder
  Specification(){
    Row(){
      Text("已选")
        .fontColor(Color.Black)
        .fontSize(14)
        .fontWeight(700)
        .margin({right:16})

      Flex({justifyContent: FlexAlign.SpaceBetween}){
        Text(`${this.productOptions}×${this.count}`)
          .fontSize(14)

        Image($r('app.media.ic_point'))
          .width(6)
          .height(12)
      }
      .layoutWeight(1)
      .onClick(()=>{
        // 点击规格属性 唤起规格列表弹窗
        this.dialogController.open()
      })
    }.width("92%")
    .backgroundColorStyle()
  }

  @Styles
  backgroundColorStyle(){
    .backgroundColor(Color.White)
    .borderRadius(16)
    .padding({
      top: 16,
      bottom: 16,
      left: 12,
      right: 12
    })
    .margin({
      top: 12,
      left: 12,
      right: 12
    })
  }



}

@Extend(Button)
function titleButton() {
  .backgroundColor('#ccc')
  .width(35)
  .height(35)
  .borderRadius(5)
}

