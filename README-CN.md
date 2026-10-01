# Self-Improving Agent Notebook

<p align="center">
  <strong>用 17 篇可运行 Jupyter Notebook，从一次 LLM 调用出发，一路走到会自我进化的 Agent。</strong>
</p>

<p align="center">
  <a href="README.md"><strong>English</strong></a>
  ·
  <a href="README-CN.md"><strong>中文文档</strong></a>
  ·
  <a href="https://walkinglabs.github.io/self-improving-agent-notebook/"><strong>在线阅读（中文）</strong></a>
  ·
  <a href="https://walkinglabs.github.io/self-improving-agent-notebook/?lang=en"><strong>Read Online (EN)</strong></a>
</p>

<p align="center">
  <img alt="Python" src="https://img.shields.io/badge/Python-3.10%2B-3776AB">
  <img alt="PyTorch" src="https://img.shields.io/badge/PyTorch-2.0%2B-EE4C2C">
  <img alt="Notebooks" src="https://img.shields.io/badge/Notebooks-17-orange">
  <img alt="Language" src="https://img.shields.io/badge/Language-Chinese%20%2B%20English-2ea44f">
  <img alt="LLM" src="https://img.shields.io/badge/LLM-OpenAI%20Compatible-4b32c3">
</p>

<p align="center">
  <a href="#课程定位">课程定位</a> ·
  <a href="#学习路线">学习路线</a> ·
  <a href="#快速开始">快速开始</a> ·
  <a href="#项目状态">项目状态</a> ·
  <a href="#课程地图">课程地图</a> ·
  <a href="#notebook-索引">Notebook 索引</a> ·
  <a href="#质量标准">质量标准</a> ·
  <a href="#课程来源">课程来源</a>
</p>

---

## 课程定位

这是一个从零拆解 Agent 的动手课程：用 17 本可运行 notebook，
从最小循环一路走到搜索、训练、记忆、评测和自治系统。每个核心算法都先用具体数字手算，
再写成短小代码；不依赖框架，也不把关键步骤藏在黑盒里。

每本 notebook 遵循同一个学习契约：`直觉理解 → 手算验证 → 代码实现 → 实验观察`。
依赖 LLM 的实验使用真实 OpenAI 兼容 API；本地运行前请配置 DeepSeek 或其他兼容端点。

## 课程路线

建议按顺序阅读。前面的 notebook 先把基本组件讲清楚，后面再把它们放进训练、工程和自治场景。

| # | 讲座 | 这一讲做什么 |
|:--:|:--|:--|
| 01 | 什么是 AI Agent | 从一个最小循环开始，明确 Agent 和普通 Chatbot 的区别 |
| 02 | Test-time Compute | 比较重复采样、投票和 best-of-n |
| 03 | 答案验证 | 实现结果验证和过程验证 |
| 04 | 工具与代码反馈 | 把搜索、计算器和代码执行接进 ReAct 循环 |
| 05 | 多步推理与规划 | 用 UCT 搜索多步动作，而不是只选下一步 |
| 06 | 训练期 RL | 手算一轮 GRPO，并观察奖励如何改变策略 |
| 07 | 开放进化 | 运行一个自动改进 Agent 的循环，复现奖励黑客 |
| 08 | 搜索与深度研究 | 把采样、过滤和聚类用于程序与资料搜索 |
| 09 | 后训练演进 | 梳理 SFT、RLHF、RLVR 到 Agent 的训练链路 |
| 10 | 软件工程智能体 | 让 Agent 在测试反馈下修改真实代码 |
| 11 | 智能体记忆 | 用分层上下文和 KV 复用处理长任务 |
| 12 | LLM 推理 | 检查 CoT、自洽投票和“涌现”说法 |
| 13 | 数学推理 | 将模型提出的步骤交给符号验证器检查 |
| 14 | Agent 评测 | 用统一 Harness 测量通过率和任务时长 |
| 15 | 自治系统 | 处理失败、重试，并在必要时请求人工接管 |
| 16 | 多模态机器人 | 将视觉和连续动作编码成模型可输出的 token |
| 17 | 未来研究方向 | 盘点可靠性、扩展监督和协调中的开放问题 |

### 内容之间的关系

前五讲建立 Agent 的基本工具：采样得到候选，验证器负责打分，树搜索负责组合多步动作。
第六至九讲把这些组件用于训练和规模化搜索；后面的工程与前沿部分则关注记忆、评测、自治和具身系统。

## 快速开始

### Python notebooks

```bash
git clone https://github.com/walkinglabs/self-improving-agent-notebook.git
cd self-improving-agent-notebook

python3 -m venv .venv
source .venv/bin/activate

python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python -m ipykernel install --user \
  --name self-improving-agent \
  --display-name "Python (self-improving-agent)"

jupyter notebook notebooks/part1-foundation/01-course-overview.ipynb
# 英文 notebook 在 notebooks-en/，目录结构相同
# jupyter notebook notebooks-en/part1-foundation/01-course-overview.ipynb
```

如果提示 `jupyter: command not found`，说明虚拟环境没有激活，运行 `source .venv/bin/activate`，
或直接用 `.venv/bin/jupyter notebook ...`。

推荐环境：Python 3.10+、PyTorch 2.0+、NumPy、Matplotlib、Jupyter、16GB 内存。
大多数 notebook 在 CPU 上即可运行。

### 在线阅读器（web）

[`web/`](web/) 里的 React/Vite 阅读器就是发布到 GitHub Pages 的站点，需要 Node.js 20+。

```bash
./scripts/serve_web.sh              # 开发服务器，带热更新，http://127.0.0.1:5273
./scripts/serve_web.sh --preview    # 本地运行生产构建
```

开发服务器会监听 `notebooks/` 与 `notebooks-en/`，新增、改名或删除 `.ipynb` 后刷新页面即可生效，
无需重启。`--preview` 构建到 `web/dist/`（已被 gitignore），不会覆盖仓库里已提交的 `docs/` 产物。
两种模式都用环境变量 `PORT` 指定端口。

想在浏览器里直接运行 notebook 本身，用 `./scripts/run_notebooks.sh`：它在仓库根目录启动
JupyterLab，`notebooks/` 与 `notebooks-en/` 共用一个服务。

### 配置真实 LLM

想看真实模型行为，把客户端指向任意 OpenAI 兼容端点：

```bash
export AGENT_LLM_BASE_URL="https://api.deepseek.com"
export AGENT_LLM_API_KEY="sk-..."
export AGENT_LLM_MODEL="deepseek-v4-flash"
```

没有有效 key 时，客户端会直接报错；这能避免把占位输出误当成实验结果。

## 项目状态

| 领域 | 状态 |
|:---|:---|
| Notebook | 完成 17/17，分布在 4 个 Part |
| 研读笔记 | 17/17 讲，每讲 `NOTES.md`（中文）与 `NOTES.en.md`（英文） |
| 论文 | 下载并精读 39 篇；`scripts/download_papers.py` 可复现下载 |
| 讲解深度 | 每本补齐"直觉 + 具体例子 + 手算 + 为什么"，面向大一读者 |
| 格式 | 全部通过 `nbformat.validate`，cell id 规范化 |
| 执行 | 真实 API 抽查通过；完整执行需配置 API key |
| 语言 | 中文 notebook 在 `notebooks/`，英文 notebook 在 `notebooks-en/` |

### 近期路线图

1. 打磨行文，让讲解从直觉到代码更自然。
2. 扩大真实 API 验证范围。
3. 增加 Agent 可靠性与可扩展监督的深度内容。

## 课程地图

```text
Self-Improving Agent Notebook
│
├── Part 1 · 基础与方法（L1-L5）     # 循环、test-time compute、验证、工具、规划
│   ├── 01 什么是 AI Agent
│   ├── 02 Test-time Compute
│   ├── 03 答案验证
│   ├── 04 工具使用与代码反馈
│   └── 05 多步推理与规划
│
├── Part 2 · 训练与进化（L6-L9）     # 训练进模型、进化、搜索、后训练全景
│   ├── 06 训练期缩放与强化学习
│   ├── 07 自改进智能体的开放进化
│   ├── 08 搜索与深度研究智能体
│   └── 09 后训练演进：从 Chatbot 到 Agent
│
├── Part 3 · 智能体工程（L10/L11/L14）# 让它真的能用
│   ├── 10 软件工程智能体
│   ├── 11 智能体记忆
│   └── 14 Agent 评测与长程任务
│
└── Part 4 · 前沿（L12-L13、L15-L17） # 边界在哪里
    ├── 12 LLM 推理
    ├── 13 数学推理：AlphaProof 与 AlphaGeometry
    ├── 15 构建自治智能体
    ├── 16 多模态机器人智能体
    └── 17 未来研究方向
```

每本 notebook 自包含，可独立运行。原始课程中的 L10-12 是中期展示，没有 notebook。

## Notebook 索引

中文 notebook 如下。英文译本在 [`notebooks-en/`](notebooks-en/)，文件名相同。在线阅读英文版加 [`?lang=en`](https://walkinglabs.github.io/self-improving-agent-notebook/?lang=en)。

### Part 1 · 基础与方法

| # | Notebook | 核心问题 | 实现重点 |
|:---:|:---|:---|:---|
| 01 | [什么是 AI Agent](notebooks/part1-foundation/01-course-overview.ipynb) | 什么是 Agent，为什么它是 Chatbot 的下一步？ | 最小循环骨架、动作解析器 |
| 02 | [Test-time Compute](notebooks/part1-foundation/02-test-time-compute.ipynb) | 推理期多花算力为什么有用？ | 重复采样、self-consistency、best-of-n |
| 03 | [答案验证](notebooks/part1-foundation/03-robust-verification.ipynb) | 如何检查模型生成出的答案？ | ORM vs PRM、验证器训练、步级奖励 |
| 04 | [工具使用与代码反馈](notebooks/part1-foundation/04-tool-code-feedback.ipynb) | Agent 如何在环境中行动？ | ReAct 循环、工具注册表、执行奖励 |
| 05 | [多步推理与规划](notebooks/part1-foundation/05-multi-step-planning.ipynb) | Agent 如何规划一步之外？ | 任务分解、UCT 树搜索、并行执行 |

### Part 2 · 训练与进化

| # | Notebook | 核心问题 | 实现重点 |
|:---:|:---|:---|:---|
| 06 | [训练期缩放与强化学习](notebooks/part2-training/06-train-time-scaling-rl.ipynb) | 如何把推理能力训练进模型？ | STaR 自举、GRPO advantage 与 loss |
| 07 | [开放进化](notebooks/part2-training/07-open-ended-evolution.ipynb) | Agent 如何设计更好的 Agent？ | 进化循环、奖励黑客 |
| 08 | [搜索与深度研究](notebooks/part2-training/08-search-deep-research.ipynb) | Agent 如何搜索程序与知识？ | 采样-过滤-聚类、按需检索 |
| 09 | [后训练演进](notebooks/part2-training/09-post-training-evolution.ipynb) | 后训练如何从 Chatbot 演进到 Agent？ | SFT vs RLHF vs RLVR、信号来源 |

### Part 3 · 智能体工程（10–11、14）

| # | Notebook | 核心问题 | 实现重点 |
|:---:|:---|:---|:---|
| 10 | [软件工程智能体](notebooks/part3-engineering/10-swe-agents.ipynb) | Agent 如何修复真实代码？ | 覆盖-选择、串行修复循环 |
| 11 | [智能体记忆](notebooks/part3-engineering/11-agent-memory.ipynb) | Agent 如何记住看到过的东西？ | 分层上下文、逐出、KV 复用 |
| 14 | [Agent 评测](notebooks/part3-engineering/14-agent-evaluation.ipynb) | 如何度量长时程 Agent？ | 评测 Harness、胜率、时间视野 |

### Part 4 · 前沿（12–13、15–17）

| # | Notebook | 核心问题 | 实现重点 |
|:---:|:---|:---|:---|
| 12 | [LLM 推理](notebooks/part4-frontiers/12-llm-reasoning.ipynb) | 推理能力从哪里来？ | CoT、自洽投票、涌现度量 |
| 13 | [数学推理](notebooks/part4-frontiers/13-alphaproof-math.ipynb) | 验证器 + 搜索如何证明定理？ | 符号引擎、证明验证器、搜索 |
| 15 | [自治系统](notebooks/part4-frontiers/15-autonomy-agents.ipynb) | 从演示到自治之间缺什么？ | 可靠性、自检重试、监督 |
| 16 | [多模态机器人](notebooks/part4-frontiers/16-multimodal-robotics.ipynb) | VLA 模型如何工作？ | 动作离散化、词汇表屏蔽 |
| 17 | [未来研究方向](notebooks/part4-frontiers/17-future-research.ipynb) | 还有什么没解决？ | 开放问题、Goodhart、协调 |

## 质量标准

为了让 notebook 真正可用作学习材料，本仓库遵循几条标准：

- 概念先讲动机，再给记号。
- 新术语先定义，再大量使用。
- 核心算法至少包含一次具体的手算或 toy 示例。
- 代码 cell 短小、可观察。
- 随机实验使用固定种子。
- 每个 notebook 自包含，LLM 实验明确依赖真实 API。
- 讲解面向有耐心的初学者，代码保持贴近真实算法结构。

## 论文与系统

本课程把实现细节与有影响力的论文和系统连接起来：

| 论文或系统 | 覆盖的概念 |
|:---|:---|
| Large Language Monkeys / Snell et al. | 重复采样、compute-optimal 测试期缩放 |
| Cobbe 验证器 / Lightman / Math-Shepherd | 结果奖励模型 vs 过程奖励模型 |
| ReAct / RLEF / Constitutional AI | 工具使用、执行反馈、AI 反馈 |
| LATS / ADaPT / SPRINT | 树搜索、按需分解、并行执行 |
| STaR / DeepSeekMath-GRPO / DAPO | 推理自举、组内相对 RL |
| ADAS / AI Scientist / AlphaEvolve | 自动化 Agent 设计、开放进化 |
| AlphaCode / Search-o1 | 程序采样-过滤-聚类、Agentic 检索 |
| MemGPT / Cartridges / CacheBlend | 分层记忆、可学习压缩、KV 复用 |
| CodeMonkeys / KernelBench | 软件工程中的测试期算力 |
| METR / GDPval / DeepScholar-Bench | 长时程与经济价值评测 |
| CoT / Self-Consistency / Emergent Abilities | 推理链、采样并边缘化 |
| AlphaGeometry / AlphaProof | 神经-符号证明、形式化 + RL |
| RT-2 / OpenVLA | 视觉-语言-动作模型 |

## 课程来源

课程大纲复刻自 Stanford 的 [CS329A: AI Agents](https://cs329a.stanford.edu/)（Autumn 2025）。
原课程页只列出每讲的论文、不展开内容。本仓库下载并精读这些论文，为每一讲写一份研读笔记
（`papers/lecture-XX/NOTES.md`），再把每一讲做成一本可运行的 notebook，还原讲师会怎么教这节课。

没有指定论文的嘉宾讲座（后训练演进、LLM 推理、AlphaProof、自治、机器人等），按嘉宾的
研究方向与相关论文补全内容。研读笔记见 [papers/](papers/)，用
`scripts/download_papers.py` 可复现论文下载。教学契约与仓库风格参考
[Modern LLM Notebook](https://github.com/walkinglabs/modern-llm-notebook)。

## 仓库结构

```text
self-improving-agent-notebook/
├── notebooks/                    # 中文 notebook（17 本）
├── notebooks-en/                 # 英文 notebook（17 本），目录结构相同
│   ├── part1-foundation/         # 01-05
│   ├── part2-training/           # 06-09
│   ├── part3-engineering/        # 10, 11, 14
│   └── part4-frontiers/          # 12, 13, 15, 16, 17
├── papers/                       # NOTES.md（中文）+ NOTES.en.md（英文）；论文 PDF 可复现
├── scripts/download_papers.py    # 从 arXiv 解析并下载全部课程论文
├── llm_client.py                 # 统一 LLM 客户端（OpenAI 兼容）
├── web/                          # React/Vite 在线阅读器（部署到 GitHub Pages）
├── .claude/CLAUDE.md             # 中文 notebook 写作规范
├── .claude/CLAUDE.en.md          # 英文 notebook 写作规范
├── OUTLINE.md / OUTLINE.en.md    # 课程大纲
└── README.md / README-CN.md
```

## 贡献

欢迎能提升清晰度、正确性或覆盖面的贡献：修正错误讲解、改进手算与可视化、增加带断言的小练习、
为重要的 Agent 主题提议新 notebook、帮助在真实 LLM 端点上验证 notebook。

## 引用

如果 Self-Improving Agent Notebook 对你的研究或工作有帮助，请引用：

```bibtex
@misc{self-improving-agent-notebook,
  title   = {Self-Improving Agent Notebook: Build AI Agents from Scratch},
  author  = {WalkingLabs},
  year    = {2026},
  url     = {https://github.com/walkinglabs/self-improving-agent-notebook},
  note    = {GitHub repository, accessed 2026}
}
```

## 许可证

许可证待定。项目遵循
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-nc-sa/4.0/)
的精神，与参考项目 Modern LLM Notebook 一致。

---

<p align="center">
  <sub>
    为想从内部理解 Agent 系统的工程师而建。
    <br>
    由 <a href="https://github.com/walkinglabs">walkinglabs</a> 维护。
  </sub>
</p>
