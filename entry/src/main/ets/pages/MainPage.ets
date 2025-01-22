import { buttonInfo, ButtonInfoModel } from '../viewmodel/MainPageData'

@Entry
@Component
struct MainPage {

  @State
  currentPageIndex: number = 0      // 选择的页面的索引

  build() {

    Column(){
      Tabs({
        barPosition:BarPosition.End,
        index: this.currentPageIndex
      }){
        TabContent(){
          Text("首页")
        }.tabBar(this.TabButton(buttonInfo[0]))

        TabContent(){
          Text("夏日")
        }.tabBar(this.TabButton(buttonInfo[1]))

        TabContent(){
          Text("购物车")
        }.tabBar(this.TabButton(buttonInfo[2]))

        TabContent(){
          Text("我的")
        }.tabBar(this.TabButton(buttonInfo[3]))
      }
    }

  }



  @Builder
  TabButton(button:ButtonInfoModel){
    Column(){
      Image(this.currentPageIndex === button.index ? button.selectImg : button.img)
        .objectFit(ImageFit.Contain)
        .width(24)
        .height(24)

      Text(button.title)
        .fontColor(this.currentPageIndex === button.index ? Color.Red : Color.Black)
        .opacity(this.currentPageIndex === button.index ? 1 : 0.6)
        .fontWeight(500)
        .textAlign(TextAlign.Center)
        .fontSize(12)
    }
    .width("100%")
    .height("100%")
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}