# Librarium

### 文档

Vue [的官方文档](https://vuejs.org/)为你提供了入门所需的所有信息。



### 工具

此项目与 [Vite](https://vite.dev/guide/features.html) 一起提供和捆绑。推荐的 IDE 设置为 [VSCode](https://code.visualstudio.com/) + [Volar](https://github.com/johnsoncodehk/volar)。如果您需要测试您的组件和网页，请查看 [Cypress](https://www.cypress.io/) 和 [Cypress 组件测试](https://on.cypress.io/component)。
中提供了更多说明。`README.md`



### 生态系统

为您的项目获取官方工具和库：[Pinia](https://pinia.vuejs.org/)、[Vue Router](https://router.vuejs.org/)、[Vue Test Utils](https://test-utils.vuejs.org/) 和 [Vue Dev Tools](https://github.com/vuejs/devtools)。如果您需要更多资源，我们建议您访问 [Awesome Vue](https://github.com/vuejs/awesome-vue)。



### 社区

卡住了？在我们的官方 Discord 服务器 [Vue Land](https://chat.vuejs.org/) 或 [StackOverflow](https://stackoverflow.com/questions/tagged/vue.js) 上提出您的问题。你还应该订阅[我们的邮件列表](https://news.vuejs.org/)并关注官方 [@vuejs](https://twitter.com/vuejs) twitter 帐户以获取 Vue 世界的最新消息。



### 支持 Vue

作为一个独立的项目，Vue 的可持续性依赖于社区的支持。您可以通过[成为赞助商](https://vuejs.org/sponsor/)来帮助我们。

## Project Setup

```sh
npm install

npm run dev

npm run build
```

### Lint with [ESLint](https://eslint.org/)

```sh
npm run lint
```

1. 页面文件放在 `views` 文件下,且命名方式为`文件夹/index.vue`

2. `store` 存放 模拟后端传过来的数据

3. 组件写在`components`目录下,命名统一采用大驼峰格式

4. 不含有响应式 api 的工具函数写在`utils`文件下,命名方式为小驼峰。

5. 含有响应式 api 的工具则称之为`hook`函数,写在`hooks`文件夹下,命名方式为`use-xxx/index.ts`,

6. 导出函数名为`useXxx`

7. 请求接口统一写在`src/api`目录下,且根据使用场景区分目录

   

### 1. 图书书目表 (`book_info`)

```sql
CREATE TABLE book_info (
    book_id BIGINT PRIMARY KEY,          -- 图书号
    name VARCHAR(20) NOT NULL,           -- 书名
    author VARCHAR(15) NOT NULL,         -- 作者
    publish VARCHAR(20) NOT NULL,        -- 出版社
    ISBN VARCHAR(15) NOT NULL,           -- 标准书号
    introduction TEXT NULL,              -- 简介
    language VARCHAR(4) NOT NULL,        -- 语言
    price DECIMAL(10, 2) NOT NULL,       -- 价格
    pub_date DATE NOT NULL,              -- 出版时间
    class_id INT NULL,                   -- 分类号 (外键，连接分类表)
    number INT NULL                      -- 剩余数量
);
```

### 2. 图书分类表 (`class_info`)

```sql
CREATE TABLE class_info (
    class_id INT PRIMARY KEY,            -- 类别号
    class_name VARCHAR(15) NOT NULL      -- 类别名
);
```

### 3. 借阅信息表 (`lend_list`)

```sql
CREATE TABLE lend_list (
    ser_num BIGINT PRIMARY KEY,          -- 流水号
    book_id BIGINT NOT NULL,             -- 图书号 (外键，连接书目表)
    reader_id BIGINT NOT NULL,           -- 读者证号 (外键，连接读者表)
    lend_date DATE NULL,                 -- 借出日期
    back_date DATE NULL                  -- 归还日期
);
```

### 4. 借阅卡信息表 (`reader_card`)

```sql
CREATE TABLE reader_card (
    reader_id BIGINT PRIMARY KEY,        -- 读者证号 (外键，连接读者信息表)
    password VARCHAR(15) NOT NULL,       -- 密码
    username VARCHAR(15) NULL            -- 用户名
);
```

### 5. 读者信息表 (`reader_info`)

```sql
CREATE TABLE reader_info (
    reader_id BIGINT PRIMARY KEY,        -- 读者证号
    name VARCHAR(10) NOT NULL,           -- 姓名
    sex VARCHAR(2) NOT NULL,             -- 性别
    birth DATE NOT NULL,                 -- 生日
    address VARCHAR(50) NOT NULL,        -- 地址
    phone VARCHAR(15) NOT NULL           -- 电话
);
```

### 外键添加：
你可以根据需求，添加外键约束来确保表之间的关联性。

```sql
-- 在 book_info 表中添加外键，连接 class_info 表的 class_id
ALTER TABLE book_info
ADD CONSTRAINT FK_Book_Class FOREIGN KEY (class_id) REFERENCES class_info(class_id);

-- 在 lend_list 表中添加外键，连接 book_info 表和 reader_info 表
ALTER TABLE lend_list
ADD CONSTRAINT FK_Lend_Book FOREIGN KEY (book_id) REFERENCES book_info(book_id),
ADD CONSTRAINT FK_Lend_Reader FOREIGN KEY (reader_id) REFERENCES reader_info(reader_id);

-- 在 reader_card 表中添加外键，连接 reader_info 表的 reader_id
ALTER TABLE reader_card
ADD CONSTRAINT FK_Reader_Card FOREIGN KEY (reader_id) REFERENCES reader_info(reader_id);
```

