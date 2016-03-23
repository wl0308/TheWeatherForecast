//
//  HttpConfig.h
//  ThailandGo
//
//  Created by Daniel on 15/10/15.
//  Copyright © 2015年 Daniel. All rights reserved.
//

#import "CommonHttpAPI.h"
#import "CommonRequestModel.h"




#define ReleaseHost @"http://v.juhe.cn/weather/index"




/**
 *
 */


















/**
 *  首页模块接口链接
 */
//首页接口
#define home_main_url @"/farm-api/home/main"

/**
 *  订单列表查询
 *
 */
#define open_area_url @"/farm-api/home/open_area"


/**
 *  商城模块接口链接
 */
//限时抢购
#define mall_flashSale_url @"/farm-api/goods/flash_sale"

//今日特价
#define mall_specials_url @"/farm-api/goods/specials"

//热门商品
#define mall_hot_url @"/farm-api/goods/hot"

//商品分类列表
#define mall_category_url @"/farm-api/goods/category"

//商品列表
#define mall_goodsList_url @"/farm-api/goods"


/**
 *  商品接口链接
 */
//商品详情接口
#define goods_details_url @"/farm-api/goods/detail"

//新增评论接口
#define comment_add_url @"/farm-api/comment/add"

//评论列表接口
#define goods_comment_url @"/farm-api/comment/list"

//标签列表接口
#define label_list_url @"/farm-api/label/list"

//通过名称搜索商品列表
#define search_url  @"/farm-api/goods/search"

//活动模块列表
#define activity_list_url  @"/farm-api/activity/list"

//活动商品接口
#define activity_goods_url  @"/farm-api/activity/goods"

/**
 *  生鲜篮接口链接
 */
//生鲜篮列表接口
#define shop_basket_url @"/farm-api/shopping_carts"

//添加/编辑生鲜篮接口
#define edit_shopBasket_url @"/farm-api/shopping_cart"

////编辑生鲜篮接口
//#define edit_shopBasket_url @"/farm-api/shopping_cart/edit"

//删除生鲜篮
#define delete_shopBasket_url @"/farm-api/shopping_cart/delete"

//可能喜欢
#define may_like_url @"/farm-api/goods/recommend"

//商品数量加一
#define goods_increase_url @"/farm-api/shopping_cart/increase"

//商品数量减一
#define goods_decrease_url @"/farm-api/shopping_cart/decrease"

//热门商品搜素关键字
//#define search_hot_words @"/farm-api/goods/hot_key"
#define search_hot_words @"/farm-api/search/list"

//保存关键字
#define search_add_words @"/farm-api/search/add"

//会员签到
#define member_signin_url @"/farm-api/member/signin"

//获取积分明细
#define member_points_list @"/farm-api/member/points/list"

/**
 *  登录
 */


#define login_url @"/farm-api/member/login"

#define login_code_url @"/farm-api/member/captcha"

#define login_info_url @"/farm-api/member"


#define login_refresh_token_url @"/farm-api/member/refresh_token"


#define token_add_url @"/farm-api/token/add"


/**************************   订单部分   *******************************/
/**
 *  订单列表查询
 *
 */
#define order_list_url @"/farm-api/order/list/"

/**
 *  订单详情
 *
 */
#define order_detail_url @"/farm-api/order/detail/"

/**
 *  订单状态流程
 *
 */
#define order_log_url @"/farm-api/order/log/"


/**
 *  获取派送方式
 *
 */
#define order_deliver_url @"/farm-api/order/delivery/"


/**
 *  取消订单
 *
 */
#define cancel_order_url @"/farm-api/order/cancel/"


/**
 *  删除订单
 *
 */
#define delete_order_url @"/farm-api/order/delete/"

/**
 *  下单接口
 */
#define order_save_url @"/farm-api/order/save/"

/**
 *  获取支付金额
 */
#define order_price_url @"/farm-api/order/get_pay_money"

/**
 *  获取配送时间
 */
#define get_time_url @"/farm-api/order/get_time_list"

/**
 *  优惠券校验
 */
#define check_coupon_url @"/farm-api/order/check_coupon"


/**************************   地址部分   *******************************/
/**
 *  编辑收货地址
 */

#define edit_address_url @"/farm-api/member/address/"

/**
 *  设置默认地址
 */
#define default_address_url @"/farm-api/member/address/default/"


/**
 *  删除收货地址
 */

#define delete_address_url @"/farm-api/member/address/delete/"

/**
 *  查询收货地址
 */

#define address_list_url @"/farm-api/member/addresses/"

/**
 *  根据经纬度搜索周边兴趣点
 */

#define address_spot_list_url @"/farm-api/member/address/near/"

/**
 *  获取用户历史站点
 */

#define member_station_url @"/farm-api/member/station"

/**
 *  获取用户收支记录
 */

#define member_bill_url @"/farm-api/member/bill"


/**************************   优惠券部分   *******************************/
#define discount_list_url @"/farm-api/member/coupons"


/**************************   投诉与意见部分   *******************************/
#define feed_back_url @"/farm-api/feedback/"


/**************************   常见问题部分   *******************************/
#define QA_list_url @"/farm-api/faq/list/"

/**************************   充值部分   *******************************/

/**
 *  获取充值金额列表
 */
#define charge_list_url @"/farm-api/recharge/prepaid/"

/**
 *  获取充值数据
 */
#define charge_result_url @"/farm-api/recharge/get_recharge"


/**************************   收藏部分   *******************************/
/**
 *  收藏列表
 */
#define favorite_list_url @"/farm-api/favorite/list"

/**
 *  添加收藏
 */
#define favorite_add_url @"/farm-api/favorite/add"

/**
 *  删除收藏
 */
#define favorite_delete_url @"/farm-api/favorite/delete"

/**************************   搜索柜子部分   *******************************/
/**
 *  经纬度搜索
 */
#define cabinet_list_url @"/farm-api/order/cabinet_list"

/**
 *  名称搜索
 */
#define search_cabinet_url @"/farm-api/order/search_cabinet"