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