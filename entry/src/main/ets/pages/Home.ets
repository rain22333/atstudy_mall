import { it } from '@ohos/hypium'
import { Commodity, commodityData } from '../viewmodel/ComodityModel'
import { activityTitle, ActivityTitleModel, classifyTitle, swiperImage } from '../viewmodel/HomeData'

@Entry
@Component
export struct Home {
  @State
  titleIndex: number | undefined = undefined // 选中的分类的索引
  @State
  activityTitleIndex: number = 0 // 选中轮播图下方的文字的索引

  build() {

    Stack({ alignContent: Alignment.Top }) {
      Image($r('app.media.ic_app_background'))
        .width("100%")
        .height(220)


      Flex({ direction: FlexDirection.Column }) {

        // 搜索框
        this.SearchTitle()
        // Scroll(){

        // 分类
        this.ClassifyTitle()


        // 轮播
        this.CustomerSwiper()


        // 轮播下方文字
        this.ActivityTitle()

        // 商品列表
        this.CommodityItem(commodityData[0])

      }

      // }.padding(10)

    }
  }

  /**
   * 搜索框布局
   */
  @Builder
  SearchTitle() {
    Column() {
      // 第一行的logo和二维码图标
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        Image($r('app.media.ic_eshop'))
          .height("100%")
          .aspectRatio(1)

        Image($r('app.media.ic_scan'))
          .height("100%")
          .aspectRatio(1)
      }.height(24)
      .width("100%")
      .margin({ bottom: 8 })


      TextInput({ placeholder: "xxxx7 Pro" })
        .padding({
          top: 8,
          bottom: 8,
          left: 42,
          right: 12
        })
        .backgroundImage($r('app.media.ic_search'))
        .backgroundImagePosition({ x: 10, y: 8 })
        .backgroundColor(Color.White)

    }
  }

  /**
   * 分类
   */
  @Builder
  ClassifyTitle() {

    Flex({ justifyContent: FlexAlign.SpaceBetween }) {
      // 遍历文字列表
      ForEach(classifyTitle, (item: Resource, index: number) => {
        Text(item)
          .opacity(this.titleIndex === index ? 1 : 0.8)
          .fontWeight(this.titleIndex === index ? 700 : 400)
          .fontColor(Color.White)
          .onClick(() => {
            this.titleIndex = index
          })
      })


      Row() {
        Image($r('app.media.ic_split_line'))
          .width(1)
          .height(4)

        Image($r('app.media.ic_more'))
          .width(16)
          .height(16)

        Text($r('app.string.title_bar_classification'))
          .fontSize(16)
          .fontColor(Color.White)
          .opacity(this.titleIndex === undefined ? 1 : 0.8)
          .fontWeight(this.titleIndex === undefined ? 700 : 400)
      }.onClick(() => {
        // 点击 所选选中的分类重新变成undefined
        this.titleIndex = undefined
      })

    }.margin({ top: 20 })
  }

  /**
   * 轮播图组件
   */
  @Builder
  CustomerSwiper() {
    Swiper() {
      ForEach(swiperImage, (item: Resource) => {
        Image(item)
          .width("100%")
          .aspectRatio(2.2)
          .borderRadius(15)
          .backgroundColor(Color.White)
      })
    }
    .autoPlay(true)
    .itemSpace(0)
    .width("100%")
    .indicator(new DotIndicator().selectedColor('#ccc'))
    .displayCount(1)
    .margin({
      top: 12,
      bottom: 12
    })
  }

  /**
   * 轮播下方的文字
   */
  @Builder
  ActivityTitle() {
    Flex({ justifyContent: FlexAlign.SpaceAround }) {
      ForEach(activityTitle, (item: ActivityTitleModel, index: number) => {
        Flex({
          direction: FlexDirection.Column,
          justifyContent: FlexAlign.Center,
          alignItems: ItemAlign.Center
        }) {
          Text(item.title)
            .fontWeight(500)
            .fontColor(Color.Black)
            .fontColor(this.activityTitleIndex === index ? Color.Red : Color.Black)
            .margin({ bottom: 5 })

          Text(item.desc)
            .fontSize(14)
            .fontColor(this.activityTitleIndex === index ? Color.Red : '#666')
            .fontWeight(300)
            .opacity(this.activityTitleIndex === index ? 1 : 0.8)
        }.onClick(() => {
          this.activityTitleIndex = index
        })
        .height("100%")
      })
    }
    .height(60)
    .width("100%")
    .padding(13)
    .margin({ top: 8, bottom: 8 })
    .backgroundColor('#f3f3f3')
  }

  /**
   * 一个商品
   */
  @Builder
  CommodityItem(info: Commodity) {
    Column() {
      Image(`http://124.222.209.62/api/img/`
        + info.attrKeyList[0].attrValueList[0].value_images[0]
      )
        .width(120)
        .height(120)
        .objectFit(ImageFit.Contain)


      Column(){
        // 【商品名字】 商品标题
        Text(`【${info.spu_name}】${info.spu_title}`)
          .fontColor(Color.Black)
          .fontSize(14)
          .fontWeight(400)
          .maxLines(2)
          .textOverflow({overflow:TextOverflow.Ellipsis})
          .lineHeight(20)

        // 商品价格
        Text(`￥${info.skuList[0].sku_price}`)
          .fontColor(Color.Red)
          .margin({
            top:4,
            bottom:4
          })

        // 促销标签
        Text(`${info.promotion}`)
          .fontColor(Color.White)
          .backgroundColor(Color.Red)
          .fontSize(10)
          .height(16)
          .padding({
            left:8,
            right:8
          })
          .borderRadius(4)
      }.width("100%")
      .alignItems(HorizontalAlign.Start)


    }.padding({
      top:5,
      bottom:5,
      left:10,
      right:10
    })
    .backgroundColor(Color.White)
    .borderRadius(8)
    .width("100%")
    .height(250)
  }
}