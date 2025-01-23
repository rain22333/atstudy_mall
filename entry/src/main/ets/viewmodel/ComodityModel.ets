export class SkuList {
  sku_id: string = '';
  sku_price: number = 0;
}

export class AttrKeyList{
  key_id: string = '';
  attrValueList: AttrValueList[] = [];
}

export class AttrValueList{
  value_id:number = 0;
  value_images:string[] = []
}

@Observed
export class Commodity {
  spu_brand_id?: string = '';//品牌编号
  spu_id: string = '';          //商品id
  spu_name: string = '';
  spu_title: string = '';       //商品标题
  spu_introduction?: string = '';   //商品描述

  promotion: string = '新品';    //促销
  // images: string[] = [];      //商品图片地址列表
  // detail?: string[] = [];     //明细
  // price: number = 0;          //价格
  skuList: SkuList[] = [];
  attrKeyList: AttrKeyList[] = [];
}




//小图标类
export class BarData {
  icon?: Resource;
  text?: Resource|string;
}


//商品详情页，封面轮播下方的小图标数组
export const barData: BarData[] = [
  {
    icon: $r('app.media.ic_bar_share'),
    text: '分享'
  },
  {
    icon: $r('app.media.ic_collect'),
    text: '收藏'
  },
  {
    icon: $r('app.media.ic_price'),
    text: '降价通知'
  }
]

export const commodityData: Commodity[] = [
  {
    spu_id: '1',
    spu_name: '海信',
    spu_title: '海信电视机',
    promotion: '新品',
    skuList: [
      {
        sku_id: '1',
        sku_price: 3499
      }
    ],
    attrKeyList: [
      {
        key_id: '1',
        attrValueList: [
          {
            value_id:1,
            value_images:['group1/M00/00/00/1-c348a70783d2aee0.jpg']
          }
        ]
      }
    ]
  },
  {
    spu_id: '2',
    spu_name: 'TCL',
    spu_title: '海信电视机',
    promotion: '新品',
    skuList: [
      {
        sku_id: '1',
        sku_price: 2199
      }
    ],
    attrKeyList: [
      {
        key_id: '1',
        attrValueList: [
          {
            value_id:1,
            value_images:['group1/M00/00/00/9-d953542b35b6936f.jpg']
          }
        ]
      }
    ]
  }
]