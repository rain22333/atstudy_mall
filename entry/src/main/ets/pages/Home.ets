import { it } from '@ohos/hypium'
import { classifyTitle, swiperImage } from '../viewmodel/HomeData'

@Entry
@Component
export struct Home {

  @State
  titleIndex:number | undefined = undefined     // 选中的分类的索引

  build() {

      Stack({alignContent:Alignment.Top}){
        Image($r('app.media.ic_app_background'))
          .width("100%")
          .height(220)


        Flex({direction: FlexDirection.Column}){

          // 搜索框
          this.SearchTitle()
          // Scroll(){

            // 分类
            this.ClassifyTitle()
          

            // 轮播
            this.CustomerSwiper()


            // 轮播下方文字

            // 商品列表
          }

        // }.padding(10)

      }
  }




  /**
   * 搜索框布局
   */
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
  
  
  
  /**
   * 分类
   */
  @Builder
  ClassifyTitle(){

    Flex({justifyContent:FlexAlign.SpaceBetween}){
      // 遍历文字列表
      ForEach(classifyTitle,(item:Resource,index:number)=>{
        Text(item)
          .opacity(this.titleIndex === index  ? 1 : 0.8)
          .fontWeight(this.titleIndex === index ? 700 : 400)
          .fontColor(Color.White)
          .onClick(()=>{
            this.titleIndex = index
          })
      })


      Row(){
        Image($r('app.media.ic_split_line'))
          .width(1)
          .height(4)

        Image($r('app.media.ic_more'))
          .width(16)
          .height(16)

        Text($r('app.string.title_bar_classification'))
          .fontSize(16)
          .fontColor(Color.White)
          .opacity(this.titleIndex ===  undefined ? 1 : 0.8)
          .fontWeight(this.titleIndex ===  undefined ? 700 : 400)
      }.onClick(()=>{
        // 点击 所选选中的分类重新变成undefined
        this.titleIndex = undefined
      })


    }.margin({top:20})
  }
  
  
  /**
   * 轮播图组件
   */
  @Builder
  CustomerSwiper(){
    Swiper(){
      ForEach(swiperImage,(item:Resource)=>{
        Image(item)
          .width("100%")
          .aspectRatio(2.2)
          .borderRadius(15)
          .backgroundColor(Color.White)
      })
    }.autoPlay(true)
    .itemSpace(0)
    .width("100%")
    .indicator(new DotIndicator().selectedColor('#ccc'))
    .displayCount(1)
    .margin({
      top: 12,
      bottom: 12
    })
  }
  

}