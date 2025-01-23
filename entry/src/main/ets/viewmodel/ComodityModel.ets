export class SkuList {
  sku_id: string = '';
  sku_price: number = 0;
}

/**
 * 属性键
 */
export class AttrKeyList{
  key_id: string = '';          // 属性键id
  key_name:string = '';         // 属性键名字
  key_ishigh?:number = 0;       // 是否是高级属性
  attrValueList: AttrValueList[] = [];    // 属性值列表
}
// 属性键id
/**
 * 属性值
 */
export class AttrValueList{
  value_id:number = 0;          // 属性值id
  value_name: string = '0';     // 属性值名字
  value_images:string[] = []    // 属性值图片
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

/**
 * 导出的静态的商品数据
 */
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
        key_name: "尺寸",
        attrValueList: [
          {
            value_id:1,
            value_name:"55英寸",
            value_images:[
              'group1/M00/00/00/122-cbcd2abdaba1d31e.jpg',
              'group1/M00/00/00/122-b73b6a5f32f1e501.jpg']
          },
          {
            value_id:2,
            value_name:"65英寸",
            value_images:[
              'group1/M00/00/00/123-57d1bf9bc01ef8d5.jpg',
              'group1/M00/00/00/123-a8831bf34dbc3a2e.jpg']
          }
        ]
      },
      {
        key_id: '2',
        key_name: "版本",
        attrValueList: [
          {
            value_id:1,
            value_name:"3+16GB 分布式游戏8K解码爆款",
            value_images:[]
          },
          {
            value_id:2,
            value_name:"3+32GB 莱茵双护眼大内存新品",
            value_images:[]
          }
        ]
      }
    ]
  },
  {
    spu_id: '2',
    spu_name: 'TCL',
    spu_title: 'TCL电视机',
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
        key_name: "尺寸",
        attrValueList: [
          {
            value_id:1,
            value_name:"55英寸",
            value_images:[
              'group1/M00/00/00/1-c348a70783d2aee0.jpg',
              'group1/M00/00/00/9-d953542b35b6936f.jpg']
          }
        ]
      }
    ]
  },
  {
    spu_id: '3',
    spu_name: '长虹',
    spu_title: '长虹电视机',
    promotion: '新品',
    skuList: [
      {
        sku_id: '1',
        sku_price: 3199
      }
    ],
    attrKeyList: [
      {
        key_id: '1',
        key_name:"尺寸",
        attrValueList: [
          {
            value_id:1,
            value_name:"55英寸",
            value_images:[
              'group1/M00/00/00/1-c348a70783d2aee0.jpg',
              'group1/M00/00/00/9-d953542b35b6936f.jpg']
          }
        ]
      }
    ]
  }
]