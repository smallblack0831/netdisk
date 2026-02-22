import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

// 解决导航栏或者底部导航tabBar中的vue-router在3.0版本以上频繁点击菜单报错的问题。
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push (location) {
  return originalPush.call(this, location).catch(err => err)
}

const routes = [
  {
    path: '/',
    name: 'Manager',
    component: () => import('../views/Manager.vue'),
    redirect: '/home',  // 重定向到主页
    // 新增：标记该路由及其子路由需要登录
    meta: { requiresAuth: true },
    children: [
      { path: '403', name: 'NoAuth', meta: { name: '无权限', requiresAuth: true }, component: () => import('../views/manager/403') },
      { path: 'home', name: 'Home', meta: { name: '系统首页', requiresAuth: true }, component: () => import('../views/manager/Home') },
      { path: 'admin', name: 'Admin', meta: { name: '管理员信息', requiresAuth: true }, component: () => import('../views/manager/Admin') },
      { path: 'adminPerson', name: 'AdminPerson', meta: { name: '个人信息', requiresAuth: true }, component: () => import('../views/manager/AdminPerson') },
      { path: 'password', name: 'Password', meta: { name: '修改密码', requiresAuth: true }, component: () => import('../views/manager/Password') },
      { path: 'notice', name: 'Notice', meta: { name: '公告信息', requiresAuth: true }, component: () => import('../views/manager/Notice') },
      { path: 'user', name: 'User', meta: { name: '用户信息', requiresAuth: true }, component: () => import('../views/manager/User') },
      { path: 'diskFiles', name: 'DiskFiles', meta: { name: '网盘文件', requiresAuth: true }, component: () => import('../views/manager/DiskFiles') },
      { path: 'share', name: 'Share', meta: { name: '文件分享', requiresAuth: true }, component: () => import('../views/manager/Share') },
      { path: 'trash', name: 'Trash', meta: { name: '垃圾箱', requiresAuth: true }, component: () => import('../views/manager/Trash') },
    ]
  },
  {
    path: '/front',
    name: 'Front',
    component: () => import('../views/Front.vue'),
    // 新增：标记前台路由也需要登录
    meta: { requiresAuth: true },
    children: [
      { path: 'home', name: 'FrontHome', meta: { name: '系统首页', requiresAuth: true }, component: () => import('../views/front/Home') },
      { path: 'person', name: 'Person', meta: { name: '个人信息', requiresAuth: true }, component: () => import('../views/front/Person') },
      { path: 'openShare', name: 'OpenShare', meta: { name: '下载分享内容', requiresAuth: true }, component: () => import('../views/front/OpenShare') },
    ]
  },
  { path: '/login', name: 'Login', meta: { name: '登录', requiresAuth: false }, component: () => import('../views/Login.vue') },
  { path: '/register', name: 'Register', meta: { name: '注册', requiresAuth: false }, component: () => import('../views/Register.vue') },
  { path: '*', name: 'NotFound', meta: { name: '无法访问', requiresAuth: false }, component: () => import('../views/404.vue') },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

// 注：不需要前台的项目，可以注释掉该路由守卫
// 路由守卫 - 取消注释并优化逻辑
router.beforeEach((to, from, next) => {
  // 优化：解析用户信息，兜底为空对象，避免JSON.parse报错
  let user = {}
  try {
    user = JSON.parse(localStorage.getItem("xm-user") || '{}')
  } catch (e) {
    user = {}
  }

  // 核心：判断目标路由是否需要登录
  if (to.meta.requiresAuth) {
    // 需要登录 - 判断用户是否已登录（存在token/用户ID等核心信息，不只判断role）
    if (user.id && user.role) { // 假设user里有id/role代表已登录，根据你的实际字段调整
      // 已登录：根据角色跳对应页面（根路径/时）
      if (to.path === '/') {
        if (user.role === 'USER') {
          next('/front/home')
        } else {
          next('/home')
        }
      } else {
        next() // 非根路径，正常放行
      }
    } else {
      // 未登录：跳转到登录页
      next('/login')
    }
  } else {
    // 不需要登录的路由（login/register/404），直接放行
    next()
  }
})

export default router