import { it } from "@ohos/hypium";
import { Commodity } from "../viewmodel/ComodityModel"
/**
 * 商品列表组件
 */
@Component
export struct CommodityList {
  @Link
  commodityList: Commodity[]; // 当前组件的商品列表
  @Prop
  colum: number = 0 // 交叉轴的商品数量 应该是每行显示2个商品


  private onClickItem = (Commodity:Commodity) => {}

  build() {
    List() {
      ForEach(this.commodityList, (item: Commodity) => {
        ListItem() {
          this.CommodityItem(item)
        }.margin({
          left: 6,
          right: 6
        })
        .onClick(()=>{
          if(this.onClickItem !== undefined){
            this.onClickItem(item)
          }
        })
      })
    }.margin({
      left: 6,
      right: 6
    })
    .listDirection(Axis.Vertical)
    .lanes(this.colum)
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


      Column() {
        // 【商品名字】 商品标题
        Text(`【${info.spu_name}】${info.spu_title}`)
          .fontColor(Color.Black)
          .fontSize(14)
          .fontWeight(400)
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .lineHeight(20)

        // 商品价格
        Text(`￥${info.skuList[0].sku_price}`)
          .fontColor(Color.Red)
          .margin({
            top: 4,
            bottom: 4
          })

        // 促销标签
        Text(`${info.promotion}`)
          .fontColor(Color.White)
          .backgroundColor(Color.Red)
          .fontSize(10)
          .height(16)
          .padding({
            left: 8,
            right: 8
          })
          .borderRadius(4)
      }.width("100%")
      .alignItems(HorizontalAlign.Start)

    }
    .padding({
      top: 5,
      bottom: 5,
      left: 10,
      right: 10
    })
    .backgroundColor(Color.White)
    .borderRadius(8)
    .width("100%")
    .height(250)
  }
}