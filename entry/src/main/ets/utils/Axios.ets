/**
 * Axios工具类
 */

import axios, { AxiosError, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios'
import { promptAction } from '@kit.ArkUI'


// 创建axios实例
export const instance = axios.create({
  baseURL:'http://124.220.148.251:8001',           // 存放商城项目后端的地址
  timeout:8000                                    // 发出网络请求后 需要经过多久超时
})


// 添加请求拦截器
instance.interceptors.request.use((config:InternalAxiosRequestConfig)=>{
    // 后续需要再请求拦截器中添加token
    const token = AppStorage.Get("token") as string

    // 如果有token 则添加到请求头中
    if(token){
      config.headers["Authorization"] = token
    }
    return config;
},(error:AxiosError)=>{
  // 如果出现异常 显示一个弹窗
  promptAction.showToast({
    message:error.message,
    duration:5000       // 弹窗显示5秒钟消失
  })

  return Promise.reject(error)
})


// 响应拦截器
instance.interceptors.response.use((response:AxiosResponse)=>{

  if(response.data.httpcode === 200){
    // 请求成功 返回数据
    return response
  }else {
    // 代表请求不成功
    promptAction.showToast({
      message:response.data.httpstatus + ',code=' + response.data.httpcode
    })
    return Promise.reject(response.data.message)
  }

},(error:AxiosError)=>{
  // 如果出现异常 显示一个弹窗
  promptAction.showToast({
    message:error.message,
    duration:5000       // 弹窗显示5秒钟消失
  })

  return Promise.reject(error)
})

/**
 * 实现参数格式转换
 * @param params  jsno对象的列表
 * @returns string对象 格式是 param1=value1&param2=value2....
 */
export function paramsToString(params:Record<string,Object>):string{
  let formString:string = ''        // 声明一个要返回的字符串
  formString = Object.entries(params).map((entry)=>{
    return entry.join("=")
  }).join("&")
  return formString
}