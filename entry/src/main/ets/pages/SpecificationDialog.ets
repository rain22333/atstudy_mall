import { it } from "@ohos/hypium";
import { CapsuleGroupButton } from "../component/CapsuleGroupButton";
import { AttrKeyList, AttrValueList, Commodity, commodityData } from "../viewmodel/ComodityModel";
import { attrKey, ProductSpecification } from "../viewmodel/TypeModel";

/**
 * 自定义弹窗
 */
@Preview
@CustomDialog
export struct SpecificationDialog {
  controller?: CustomDialogController;

  @State
  count:number = 1        // 选择的商品数量


  @State
  attrKey:attrKey[] = []        // 属性键列表

  @Link
  data:Commodity;               // 当前规格属性弹窗对应的商品详情数据

  @Link
  productOptions:string;        // 选中的规格属性字符串

  @Link
  selectTags:ProductSpecification[];      // 选中的规格数组

  build() {
    GridRow({ columns: 4, gutter: 12 }) {
      GridCol({ span: 4 }) {
        Column() {
          // 在这里面放置界面元素代码
          Image($r('app.media.ic_normal'))
            .width(64)
            .height(32)
            .objectFit(ImageFit.Contain)
            .onClick(()=>{
              this.controller?.close()
            })

          // 商品封面的图片 、价格、已选的规格信息
          Row() {
            Image(`http://124.222.209.62/api/img/group1/M00/00/00/1796-a1a6f8e9e71017d9.jpg`)
              .width(100)
              .height(100)
              .objectFit(ImageFit.Cover)
              .margin({
                right: 16,
                left: 16
              })

            Column() {
              Text() {
                Span('￥')
                  .fontColor(Color.Red)
                  .fontSize(10)
                Span("3499")
                  .fontColor(Color.Red)
                  .fontSize(20)
              }.margin({
                bottom: 20
              })

              Text(`已选: ${this.productOptions}  × ${this.count}`)
                .maxLines(2)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .fontSize(12)
            }.alignItems(HorizontalAlign.Start)
            .layoutWeight(1)
          }
          .margin({
            top: 20,
            bottom: 20,
            left: 12,
            right: 12
          })

          // 商品规格列表
          Scroll() {
            Column() {
              // 遍历规格属性列表
              ForEach(commodityData[0].attrKeyList || [], (item: AttrKeyList) => {
                //   TODO: 规格明显显示
                this.Specification(item)

              })
            }.padding(10)
          }

          // 规格数量
          Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
            Text("数量")
              .fontSize(14)
              .fontColor('#ccc')
            Counter() {
              Text(this.count.toString())
            }
            .onInc(() => {
              // 增加数量的事件
              this.count++
            })
            .onDec(() => {
              // 减少数量的事件
              this.count = this.count > 1 ? this.count-1 : 1
            })
          }.padding(10)

          // 加入购物车按钮组
          this.ButtonGroup()
        }.border({
          radius: {
            topLeft: 30,
            topRight: 30
          }
        })
        .backgroundColor('#f3f4f5')
        .width("100%")
      }
    }
  }

  /**
   * 规格明细显示
   * @param payload
   */
  @Builder
  Specification(payload: AttrKeyList) {
    Column() {
      // 显示属性建的名字
      Text(payload.key_name)
        .fontSize(14)
        .fontColor('#CCC')
        .margin({ bottom: 10 })

      // 属性值  溢出换行
      Flex({ wrap: FlexWrap.Wrap }) {
        // 遍历属性值列表
        ForEach(payload.attrValueList, (item: AttrValueList) => {
          Text(item.value_name)// 属性值名称
            .fontColor( this.colorChange(payload.key_id) === item.value_id ? Color.Red : Color.Black)
            .fontSize(12)
            .height(24)
            .padding({
              top: 6,
              bottom: 6,
              left: 6,
              right: 6
            })
            .backgroundColor(this.colorChange(payload.key_id) === item.value_id ? Color.Pink : '#ccc')
            .margin({
              right: 10,
              bottom: 10
            })
            .borderRadius(12)
            .onClick(() => {
              // 点击规格属性之后 需要修改规格信息
            })
        })
      }
    }.alignItems(HorizontalAlign.Start)
    .width("100%")
    .margin({ top: 15 })
  }

  /**
   * 加入购物车按钮组
   */
  @Builder
  ButtonGroup() {
    Flex() {
      CapsuleGroupButton({
        config: [{
          text: "加入购物车",
          color:'#fff',
          onclick: () => {
            // 关闭弹窗
            this.controller?.close()
            // 加入购物车
          }
        },
          {
            text:"立即购买",
            color:'#fff',
            onclick:()=>{
              // 关闭弹窗
              this.controller?.close()
              // 如果后续添加购物车需要跳转答订单页 TODO
            }
          }
        ]
      })
    }
    .padding(10)
  }


  /**
   * 改变某个颜色 获取到当前的value_id
   */
  colorChange(key_id:string):number{
    let temp: number = 0;
    this.selectTags.forEach((item)=>{
      if(item.key_id === key_id){
        temp = parseInt(item.value_id ? item.value_id.toString() : 'o')
      }
    })
    return temp
  }
}