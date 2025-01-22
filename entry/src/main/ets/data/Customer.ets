/**
 * 客户请求
 */
import { instance, paramsToString } from "../utils/Axios";


/**
 * 用户注册方法
 * @param user_phone    手机号
 * @param user_password   密码
 * @param user_name   用户名
 * @returns
 */
export function regist(user_phone:string,user_password:string,user_name:string){
  return instance.post('/regist',paramsToString(Object({
    user_phone: user_phone,
    user_password: user_password,
    user_name: user_name
  })))
}

/**
 * 用户登陆方法
 * @param username  手机号
 * @param password  密码
 * @returns 响应对象
 */
export function login(username:string,password:string){
  return instance.post('/login',paramsToString(Object({
    username:username,
    password:password
  })))
}