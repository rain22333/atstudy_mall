/**
 * 自定义按钮类型
 */
export class CustomerButtonType{
  text?: string|Resource;
  color?: string | ResourceStr;
  onclick = (event?: ClickEvent) =>{}
}

/**
 * 属性建
 */

export class attrKey{
  key_id: string = ''       // 属性键id
  key_name:string = ''      // 属性建名字
}

/**
 * 选择的属性建对应的属性值
 */
export class ProductSpecification{
  key_id?:string = ''       // 属性键id
  key_name?:string = ''       // 属性键名字
  value_id?:string = ''       // 属性值id
  value_name?:string = ''       // 属性值名字
}