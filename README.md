# Personal Homepage

Vue 3 + Vite + Tailwind CSS v4 个人主页，使用 MoonBit 编写数据/逻辑层。

## 技术栈

- **前端**: Vue 3 + TypeScript + Tailwind CSS v4
- **数据层**: MoonBit（编译为 JS）
- **构建工具**: Vite + Bun
- **部署**: GitHub Pages

## 本地运行

```bash
# 安装依赖
bun install

# 构建 MoonBit → JS（修改 .mbt 文件后必须先执行此步骤）
bun run build:moonbit

# 启动开发服务器
bun run dev
```

访问终端显示的地址（默认 `http://localhost:5173`）。

## 构建命令

```bash
bun run build:moonbit    # MoonBit → JS（输出到 src/moonbit/index.js）
bun run build            # 类型检查 + Vite 生产构建
bun run build:all        # MoonBit 构建 + Vue 构建（完整流程）
bun run preview          # 预览生产构建产物
```

## 项目结构

```
moonbit/          # MoonBit 源码（数据、类型、搜索过滤）
  content.mbt     # 站点数据（项目、技能、社交链接、博客）
  types.mbt       # 类型定义
  filter.mbt      # 项目搜索/过滤
  json.mbt        # JSON 序列化
src/              # Vue 前端
  components/     # Vue 组件
  composables/    # useContent() 等组合式函数
  moonbit/        # 自动生成，不要手动编辑
```

## 编辑站点内容

编辑 `moonbit/content.mbt`，然后重新构建：

```bash
bun run build:moonbit
```

## 部署到 GitHub Pages

项目已配置 GitHub Actions，推送到 `main` 分支自动部署。

部署流程：`moon build → build-moonbit.js → vite build → deploy`

GitHub Pages 设置：
1. 仓库 → Settings → Pages
2. Source 选择 **GitHub Actions**
3. 推送到 `main` 即触发部署

本地验证生产构建：

```bash
bun run build:all
bun run preview
```
