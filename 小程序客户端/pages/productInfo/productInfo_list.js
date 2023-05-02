var utils = require("../../utils/common.js");
var config = require("../../utils/config.js");

Page({
  /**
   * 页面的初始数据
   */
  data: {
    queryViewHidden: true, //是否隐藏查询条件界面
    productClassObj_Index:"0", //物品分类查询条件
    productClasss: [{"productClassId":0,"productClassName":"不限制"}],
    productName: "", //失物招领名称查询关键字
    priceRegionObj_Index:"0", //图书分类查询条件
    priceRegions: [{"regionId":0,"regionName":"不限制"}],
    newOldLevelObj_Index:"0", //新旧程度查询条件
    newOldLevels: [{"levelId":0,"levelName":"不限制"}],
    areaObj_Index:"0", //图书分类查询条件
    areaInfos: [{"areaId":0,"areaName":"不限制"}],
    userObj_Index:"0", //用户查询条件
    userInfos: [{"user_name":"","realname":"不限制"}],
    addTime: "", //发布时间查询关键字
    productInfos: [], //界面显示的失物招领信息列表数据
    page_size: 8, //每页显示几条数据
    page: 1,  //当前要显示第几页
    totalPage: null, //总的页码数
    loading_hide: true, //是否隐藏加载动画
    nodata_hide: true, //是否隐藏没有数据记录提示
  },

  // 加载失物招领信息列表
  listProductInfo: function () {
    var self = this
    var url = config.basePath + "api/productInfo/list"
    //如果要显示的页码超过总页码不操作
    if(self.data.totalPage != null && self.data.page > self.data.totalPage) return
    self.setData({
      loading_hide: false,  //显示加载动画
    })
    //提交查询参数到服务器查询数据列表
    utils.sendRequest(url, {
      "productClassObj.productClassId": self.data.productClasss[self.data.productClassObj_Index].productClassId,
      "productName": self.data.productName,
      "priceRegionObj.regionId": self.data.priceRegions[self.data.priceRegionObj_Index].regionId,
      "newOldLevelObj.levelId": self.data.newOldLevels[self.data.newOldLevelObj_Index].levelId,
      "areaObj.areaId": self.data.areaInfos[self.data.areaObj_Index].areaId,
      "userObj.user_name": self.data.userInfos[self.data.userObj_Index].user_name,
      "addTime": self.data.addTime,
      "page": self.data.page,
      "rows": self.data.page_size,
    }, function (res) { 
      wx.stopPullDownRefresh()
      setTimeout(function () {  
        self.setData({
          productInfos: self.data.productInfos.concat(res.data.list),
          totalPage: res.data.totalPage,
          loading_hide: true
        })
      }, 500)
      //如果当前显示的是最后一页，则显示没数据提示
      if(self.data.page == self.data.totalPage) {
        self.setData({
          nodata_hide: false,
        })
      }
    })
  },

  //显示或隐藏查询视图切换
  toggleQueryViewHide: function () {
    this.setData({
      queryViewHidden: !this.data.queryViewHidden,
    })
  },

  //点击查询按钮的事件
  queryProductInfo: function(e) {
    var self = this
    self.setData({
      page: 1,
      totalPage: null,
      productInfos: [],
      loading_hide: true, //隐藏加载动画
      nodata_hide: true, //隐藏没有数据记录提示 
      queryViewHidden: true, //隐藏查询视图
    })
    self.listProductInfo()
  },

  //查询参数发布时间选择事件
  bind_addTime_change: function (e) {
    this.setData({
      addTime: e.detail.value
    })
  },
  //清空查询参数发布时间
  clear_addTime: function (e) {
    this.setData({
      addTime: "",
    })
  },

  //绑定查询参数输入事件
  searchValueInput: function (e) {
    var id = e.target.dataset.id
    if (id == "productName") {
      this.setData({
        "productName": e.detail.value,
      })
    }

  },

  //查询参数失物招领类别选择事件
  bind_productClassObj_change: function(e) {
    this.setData({
      productClassObj_Index: e.detail.value
    })
  },

  //查询参数价格区域选择事件
  bind_priceRegionObj_change: function(e) {
    this.setData({
      priceRegionObj_Index: e.detail.value
    })
  },

  //查询参数成色选择事件
  bind_newOldLevelObj_change: function(e) {
    this.setData({
      newOldLevelObj_Index: e.detail.value
    })
  },

  //查询参数区域选择事件
  bind_areaObj_change: function(e) {
    this.setData({
      areaObj_Index: e.detail.value
    })
  },

  //查询参数发布人选择事件
  bind_userObj_change: function(e) {
    this.setData({
      userObj_Index: e.detail.value
    })
  },

  init_query_params: function() { 
    var self = this
    var url = null
    //初始化失物招领类别下拉框
    url = config.basePath + "api/productClass/listAll"
    utils.sendRequest(url,null,function(res){
      wx.stopPullDownRefresh();
      self.setData({
        productClasss: self.data.productClasss.concat(res.data),
      })
    })
    //初始化价格区域下拉框
    url = config.basePath + "api/priceRegion/listAll"
    utils.sendRequest(url,null,function(res){
      wx.stopPullDownRefresh();
      self.setData({
        priceRegions: self.data.priceRegions.concat(res.data),
      })
    })
    //初始化成色下拉框
    url = config.basePath + "api/newOldLevel/listAll"
    utils.sendRequest(url,null,function(res){
      wx.stopPullDownRefresh();
      self.setData({
        newOldLevels: self.data.newOldLevels.concat(res.data),
      })
    })
    //初始化区域下拉框
    url = config.basePath + "api/areaInfo/listAll"
    utils.sendRequest(url,null,function(res){
      wx.stopPullDownRefresh();
      self.setData({
        areaInfos: self.data.areaInfos.concat(res.data),
      })
    })
    //初始化发布人下拉框
    url = config.basePath + "api/userInfo/listAll"
    utils.sendRequest(url,null,function(res){
      wx.stopPullDownRefresh();
      self.setData({
        userInfos: self.data.userInfos.concat(res.data),
      })
    })
  },

  //删除失物招领信息记录
  removeProductInfo: function (e) {
    var self = this
    var productId = e.currentTarget.dataset.productid
    wx.showModal({
      title: '提示',
      content: '确定要删除productId=' + productId + '的记录吗？',
      success: function (sm) {
        if (sm.confirm) {
          // 用户点击了确定 可以调用删除方法了
          var url = config.basePath + "api/productInfo/delete/" + productId
          utils.sendRequest(url, null, function (res) {
            wx.stopPullDownRefresh();
            wx.showToast({
              title: '删除成功',
              icon: 'success',
              duration: 500
            })
            //删除失物招领信息后客户端同步删除数据
            var productInfos = self.data.productInfos;
            for (var i = 0; i < productInfos.length; i++) {
              if (productInfos[i].productId == productId) {
                productInfos.splice(i, 1)
                break
              }
            }
            self.setData({ productInfos: productInfos })
          })
        } else if (sm.cancel) {
          console.log('用户点击取消')
        }
      }
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.listProductInfo()
    this.init_query_params()
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
    var self = this
    self.setData({
      page: 1,  //显示最新的第1页结果
      productInfos: [], //清空失物招领信息数据
      nodata_hide: true, //隐藏没数据提示
    })
    self.listProductInfo()
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
    var self = this
    if (self.data.page < self.data.totalPage) {
      self.setData({
        page: self.data.page + 1, 
      })
      self.listProductInfo()
    }
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }

})

