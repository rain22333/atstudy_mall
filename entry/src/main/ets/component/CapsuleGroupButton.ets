import { CustomerButtonType } from "../viewmodel/TypeModel"

/**
 * 胶囊联合按钮组
 */
@Component
export struct CapsuleGroupButton{

  /**
   * 自定义按钮组
   */
  private config:CustomerButtonType[] = []


  build() {
    Flex(){
      ForEach(this.config,(config:CustomerButtonType,index:number)=>{
        Flex({justifyContent:FlexAlign.Center, alignItems:ItemAlign.Center }){
          Text(config.text)
            .fontColor(config.color)
            .height(40)
            .textAlign(TextAlign.Center)
        }.border({
          radius:{
            topLeft: !!index ? 0 : 5,
            bottomLeft: !!index ? 0 : 50,
            topRight: !!index ? 5 : 0,
            bottomRight: !!index ? 5 : 0,
          }
        })
        .onClick((event:ClickEvent)=> config.onclick(event))
      },(config:ButtonType) => JSON.stringify(this.config))
    }
    .backgroundImage($r('app.media.btn_background'),ImageRepeat.NoRepeat)
    .backgroundImageSize({width:"100%",height:"100%"})
    .backgroundImagePosition(Alignment.Center)
    .borderRadius(20)
    .width("100%")
    .height(40)
    .flexBasis(1)
    .flexGrow(1)
    .flexShrink(1)

  }
}