import http from "../util/http";

// 发送邮箱验证码
const sendEmailVerifyCode = (data) => {
    return http.get("/index/sendEmailVerifyCode", data);
  };
  // 校验邮箱验证码
  const checkEmailVerifyCode = (data) => {
    return http.post("/index/checkEmailVerifyCode", data);
  };
  
  // 通过邮箱重置用户密码
  const resetPasswordByEmail = (data) => {
    return http.post("/sysUser/resetPasswordByEmail", data);
  };
  export default { sendEmailVerifyCode, resetPasswordByEmail, checkEmailVerifyCode }