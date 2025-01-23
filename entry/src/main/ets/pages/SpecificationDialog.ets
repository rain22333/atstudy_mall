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