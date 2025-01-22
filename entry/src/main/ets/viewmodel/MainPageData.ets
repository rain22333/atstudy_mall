export class ButtonInfoModel {
  index: number = 0;
  img: Resource = $r('app.media.ic_home_normal');
  selectImg: Resource = $r('app.media.ic_home_focus');
  title: Resource | string = '首页'
}


const buttonInfo: ButtonInfoModel[] = [
  {
    index: 0,
    img: $r('app.media.ic_home_normal'),
    selectImg: $r('app.media.ic_home_focus'),
    title: '首页'
  },
  {
    index: 1,
    img: $r('app.media.ic_product_normal'),
    selectImg: $r('app.media.ic_product_focus'),
    title: '夏日'
  },
  {
    index: 2,
    img: $r('app.media.ic_cart_normal'),
    selectImg: $r('app.media.ic_cart_focus'),
    title: '购物车'
  },
  {
    index: 3,
    img: $r('app.media.ic_personal_normal'),
    selectImg: $r('app.media.ic_personal_focus'),
    title: '我的'
  }
]

export {buttonInfo}