@Entry
@Component
struct Home {

  build() {

      Stack({alignContent:Alignment.Top}){
        Image($r('app.media.ic_app_background'))
          .width("100%")
          .height(220)


        Flex({direction: FlexDirection.Column}){

          // 搜索框
          this.SearchTitle()

          // 分类


          // 轮播


          // 轮播下方文字

          // 商品列表

        }.padding(10)

      }
  }



  @Builder
  SearchTitle(){
    Column(){
      // 第一行的logo和二维码图标
      Flex({justifyContent:FlexAlign.SpaceBetween}){
        Image($r('app.media.ic_eshop'))
          .height("100%")
          .aspectRatio(1)

        Image($r('app.media.ic_scan'))
          .height("100%")
          .aspectRatio(1)
      }.height(24)
      .width("100%")
      .margin({bottom: 8})


      TextInput({placeholder:"xxxx7 Pro"})
        .padding({
          top:8,
          bottom:8,
          left:42,
          right:12
        })
        .backgroundImage($r('app.media.ic_search'))
        .backgroundImagePosition({x:10,y: 8})
        .backgroundColor(Color.White)

    }
  }

}