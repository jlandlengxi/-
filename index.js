const express = require('express');
const app = express();
app.use(express.json());

// ========== 配置区域 ==========
// 带有效期的卡密列表（格式：{卡密: 过期时间(YYYY-MM-DD)}）
const VALID_KEYS = {
  "shaoyunb666": "2099-01-18",
  "LENG": "2025-12-18",
  "lxnb": "2099-08-15"
};
// API密钥（防止接口被滥用）
const API_SECRET = "lxnb666";
// ========== 配置结束 ==========

// 跨域支持
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Content-Type");
  next();
});

// 卡密验证接口
app.post("/verify-key", (req, res) => {
  try {
    const { userKey, secret } = req.body;

    // 验证API密钥
    if (secret !== API_SECRET) {
      return res.json({ success: false, msg: "API密钥错误" });
    }

    // 验证卡密是否存在
    const expireDate = VALID_KEYS[userKey];
    if (!expireDate) {
      return res.json({ success: false, msg: "卡密无效" });
    }

    // 验证卡密是否过期
    const now = new Date();
    const expire = new Date(expireDate);
    if (now > expire) {
      return res.json({ success: false, msg: "卡密已过期" });
    }

    // 验证通过
    res.json({ 
      success: true, 
      msg: "卡密验证成功",
      expire: expireDate // 返回过期时间
    });
  } catch (err) {
    res.json({ success: false, msg: "服务器错误" });
  }
});

// 适配Vercel/Serverless
if (process.env.VERCEL) {
  module.exports = app;
} else {
  // 本地测试用
  const PORT = 3000;
  app.listen(PORT, () => console.log(`API运行在端口 ${PORT}`));
}
