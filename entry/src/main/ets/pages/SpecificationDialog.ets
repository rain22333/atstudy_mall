/**
 * 自定义弹窗
 */
@Preview
@Component
export struct SpecificationDialog{


  controller?: CustomDialogController;

  build() {
    GridRow({columns:4,gutter:12}){
      GridCol({span:4}){
        Column(){
          // 在这里面放置界面元素代码
          Image($r('app.media.ic_normal'))
            .width(64)
            .height(32)
            .objectFit(ImageFit.Contain)

          // 商品封面的图片 、价格、已选的规格信息
          Row(){
            Image(`http://124.222.209.62/api/img/group1/M00/00/00/1796-a1a6f8e9e71017d9.jpg`)
              .width(100)
              .height(100)
              .objectFit(ImageFit.Cover)
              .margin({
                right:16,
                left:16
              })

            Column(){
              Text(){
                Span('￥')
                  .fontColor(Color.Red)
                  .fontSize(10)
                Span("3499")
                  .fontColor(Color.Red)
                  .fontSize(20)
              }.margin({
                bottom:20
              })
              Text(`已选: ULED超画质社交新品-55E9F ×1`)
                .maxLines(2)
                .textOverflow({overflow:TextOverflow.Ellipsis})
                .fontSize(12)
            }.alignItems(HorizontalAlign.Start)
            .layoutWeight(1)
          }.margin({
            top:20,
            bottom:20,
            left:12,
            right:12
          })

        }.border({
          radius:{
            topLeft:30,
            topRight:30
          }
        })
        .backgroundColor('#f3f4f5')
        .width("100%")
      }
    }
  }
}