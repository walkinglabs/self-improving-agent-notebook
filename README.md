# Self-Improving Agent Notebook

<p align="center">
  <strong>From a single LLM call to a self-improving agent, through 17 runnable Jupyter Notebooks.</strong>
</p>

<p align="center">
  <a href="README.md"><strong>English</strong></a>
  ·
  <a href="README-CN.md"><strong>中文文档</strong></a>
  ·
  <a href="https://walkinglabs.github.io/self-improving-agent-notebook/"><strong>Read Online (ZH)</strong></a>
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
  <a href="#why-this-course">Why</a> ·
  <a href="#curriculum">Curriculum</a> ·
  <a href="#what-you-will-build">What You Will Build</a> ·
  <a href="#quick-start">Quick Start</a> ·
  <a href="#project-status">Status</a> ·
  <a href="#curriculum">Curriculum</a> ·
  <a href="#notebook-index">Notebook Index</a> ·
  <a href="#quality-bar">Quality Bar</a> ·
  <a href="#course-origin">Course Origin</a>
</p>

---

## Why This Course

In 17 notebooks you build, **from scratch**, every core algorithm behind modern AI agents — and you trace each one
by hand before writing any code. No frameworks, no black boxes. By the end you can open any agent paper and know
exactly which piece of the system it changes.

You will have personally implemented:

- **An agent loop** — the model emits *thought + action*, a tool executes it, the result feeds back, until the task is done
- **A verifier** — a small model trained to grade answers, at both the outcome level (final answer) and the process level (every step)
- **A ReAct agent** wired to real tools (search, calculator) — watch it reason *while* it acts
- **A tree-search planner** that keeps many candidate paths and backs up rewards (UCT, hand-calculated)
- **A GRPO update** — the group-relative RL rule behind reasoning models, derived step by step
- **An evolution loop** where an agent designs better agents — plus the reward-hacking trap it falls into
- **A memory system** with hierarchical context and KV-cache reuse
- **An eval harness** that fits a capability curve to "how long a task takes a human vs an agent"

Every notebook follows one contract — `intuition -> hand calculation -> implementation -> experiment` — and uses
a real OpenAI-compatible LLM endpoint for model-dependent experiments.

## Curriculum

The 17 lectures form one progressive path: each adds one ability and picks up the question the previous one left.

| # | Lecture | After this you can... |
|:--:|:--|:--|
| 01 | Course Overview | explain what an agent is, and run the minimal loop |
| 02 | Test-time Compute | boost accuracy by sampling many times and voting |
| 03 | Robust Verification | train a verifier to tell good answers from bad |
| 04 | Tool & Code Feedback | build a ReAct agent that calls real tools |
| 05 | Multi-step Planning | search a tree of actions instead of guessing one step |
| 06 | Train-time RL | hand-calculate a GRPO update that bakes reasoning into the model |
| 07 | Open-ended Evolution | let an agent improve an agent — and spot reward hacking |
| 08 | Search & Deep Research | run sample-filter-cluster at AlphaCode scale |
| 09 | Post-training Evolution | trace one model's whole life from chatbot to agent |
| 10 | SWE Agents | make an agent fix real code, iteratively |
| 11 | Agent Memory | give an agent memory that outlives the context window |
| 12 | LLM Reasoning | explain why CoT works and when "emergence" is real |
| 13 | Math Proof | combine a neural proposer with a symbolic verifier |
| 14 | Agent Evaluation | measure what an agent can actually finish |
| 15 | Autonomy | detect errors, recover, and decide when to hand off to a human |
| 16 | Robotics (VLA) | turn continuous robot actions into tokens a model can emit |
| 17 | Future Research | name the open problems and where you could start |

### How the pieces connect

Not 17 isolated topics — ideas get handed off:

- **voting → verification → search** (L2 → L3 → L5): the score you vote with becomes the verifier that picks nodes in tree search
- **verification → RL reward → fitness** (L3 → L6 → L7): the same verifier becomes the training signal, then the fitness in evolution
- **sampling → search at scale** (L2 → L8): "ask many times" scaled to millions of candidates is AlphaCode
- **the loop → embedded in a tree → called on code** (L4 → L5 → L10): one ReAct loop, three settings
- **reward hacking → what eval guards against → Goodhart** (L7 → L14 → L17)

## What You Will Build

| You will build | What it means (no jargon) |
|:---|:---|
| An agent loop | The model emits "thought + action" each round, the action runs in a tool, the result feeds back, until the task is done |
| Repeated sampling and voting | Ask the same question N times, majority vote wins; see why "generating is easy, picking is hard" |
| A verifier | Train a small model to score answers: outcome-level checks only the final answer, process-level checks every step |
| A ReAct agent | Wire tools like search and calculator to the model and watch it "think while doing" |
| A search tree | Treat the task as a tree: select → expand → evaluate → back up the result (hand-calculate UCT and backup) |
| A GRPO update | Hand-calculate the advantage of a batch, then run one group-relative RL update |
| An evolution loop | A "design agent" writes agent code, scores it, archives it, improves it; reproduce reward hacking |
| A hierarchical memory | Evict old context when the window overflows, recall it when needed; understand KV cache reuse |
| An eval harness | Define tasks, run the agent, aggregate pass rate; fit a time-horizon capability curve |
| A proof searcher | The model proposes proof steps and a verifier checks each one — the AlphaProof recipe |

## Quick Start

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
# English notebooks live in notebooks-en/ with the same layout
# jupyter notebook notebooks-en/part1-foundation/01-course-overview.ipynb
```

If `jupyter: command not found` appears, run `source .venv/bin/activate` or call
`.venv/bin/jupyter notebook ...` directly.

Recommended environment: Python 3.10+, PyTorch 2.0+, NumPy, Matplotlib, Jupyter, 16GB RAM. Most
notebooks run on CPU.

### Online reader (web)

The React/Vite reader in [`web/`](web/) is what gets published to GitHub Pages. Requires Node.js 20+.

```bash
./scripts/serve_web.sh              # dev server with hot reload on http://127.0.0.1:5273
./scripts/serve_web.sh --preview    # production build, served locally
```

The dev server watches `notebooks/` and `notebooks-en/`, so added, renamed or removed `.ipynb` files
show up on refresh without a restart. `--preview` builds into `web/dist/` (gitignored), leaving the
committed `docs/` output untouched. Both forms read the port from `PORT`.

To browse and run the notebooks themselves, `./scripts/run_notebooks.sh` starts JupyterLab at the
repository root so `notebooks/` and `notebooks-en/` are both reachable from one server.

### Real LLM

Point the client at any OpenAI-compatible endpoint to see real model behavior:

```bash
export AGENT_LLM_BASE_URL="https://api.deepseek.com"
export AGENT_LLM_API_KEY="sk-..."
export AGENT_LLM_MODEL="deepseek-v4-flash"
```

Without a valid key, `get_llm()` raises an error instead of returning a placeholder answer.

## Project Status

| Area | Status |
|:---|:---|
| Notebooks | Complete 17/17 across 4 parts |
| Study notes | 17/17 lectures, `NOTES.md` (ZH) and `NOTES.en.md` (EN) each |
| Papers | 39 downloaded and read; reproducible via `scripts/download_papers.py` |
| Teaching depth | Every notebook adds "intuition + concrete example + hand calculation + why" |
| Format | All pass `nbformat.validate`; cell ids normalized |
| Execution | Real-API execution verified across the course; model-dependent cells require an API key |
| Language | Chinese notebooks in `notebooks/`, English notebooks in `notebooks-en/` |

### Near-Term Roadmap

1. Polish the writing so explanations flow naturally from intuition to code.
2. Widen real-API verification across all notebooks.
3. Add deeper material on reliability and scalable oversight.

## Curriculum Map

```text
Self-Improving Agent Notebook
│
├── Part 1 · Foundation (L1-L5)          # loop, test-time compute, verification, tools, planning
│   ├── 01 Course Overview
│   ├── 02 Test-time Compute Scaling
│   ├── 03 Robust Verification
│   ├── 04 Tool Use & Code Feedback
│   └── 05 Multi-step Reasoning & Planning
│
├── Part 2 · Training & Evolution (L6-L9) # train into the model, evolve, search, post-training
│   ├── 06 Train-time Scaling & RL
│   ├── 07 Open-Ended Evolution
│   ├── 08 Search & Deep Research
│   └── 09 Post-training: from Chatbots to Agents
│
├── Part 3 · Agent Engineering (L10/14/17) # make it actually useful
│   ├── 13 SWE Agents
│   ├── 14 Agent Memory
│   └── 17 Agent Evaluation
│
└── Part 4 · Frontiers (L12-L17)         # where the boundary is
    ├── 15 LLM Reasoning
    ├── 16 Mathematical Reasoning
    ├── 18 Autonomy
    ├── 19 Multimodal Robotics
    └── 20 Future Research
```

Every notebook is self-contained. Lectures 10-12 in the source course were midterm presentations and
have no notebooks.

## Notebook Index

Chinese notebooks are linked below. The English port uses the same filenames under [`notebooks-en/`](notebooks-en/). The online reader opens English with [`?lang=en`](https://walkinglabs.github.io/self-improving-agent-notebook/?lang=en).

### Part 1 · Foundation

| # | Notebook | Primary question | Implementation focus |
|:---:|:---|:---|:---|
| 01 | [Course Overview](notebooks/part1-foundation/01-course-overview.ipynb) | What is an agent, and why is it the next step after a chatbot? | Minimal loop, action parser |
| 02 | [Test-time Compute](notebooks/part1-foundation/02-test-time-compute.ipynb) | Why does more inference compute help? | Repeated sampling, self-consistency, best-of-n |
| 03 | [Robust Verification](notebooks/part1-foundation/03-robust-verification.ipynb) | How do we check the answers the model generates? | ORM vs PRM, verifier training, step rewards |
| 04 | [Tool Use & Code Feedback](notebooks/part1-foundation/04-tool-code-feedback.ipynb) | How does an agent act in an environment? | ReAct loop, tool registry, execution reward |
| 05 | [Planning](notebooks/part1-foundation/05-multi-step-planning.ipynb) | How does an agent plan beyond one step? | Decomposition, UCT tree search, parallel execution |

### Part 2 · Training & Evolution

| # | Notebook | Primary question | Implementation focus |
|:---:|:---|:---|:---|
| 06 | [Train-time Scaling & RL](notebooks/part2-training/06-train-time-scaling-rl.ipynb) | How do we train reasoning into a model? | STaR bootstrapping, GRPO advantage and loss |
| 07 | [Open-Ended Evolution](notebooks/part2-training/07-open-ended-evolution.ipynb) | How do agents design better agents? | Evolution loop, reward hacking |
| 08 | [Search & Deep Research](notebooks/part2-training/08-search-deep-research.ipynb) | How do agents search programs and knowledge? | Sample-filter-cluster, on-demand retrieval |
| 09 | [Post-training Evolution](notebooks/part2-training/09-post-training-evolution.ipynb) | How did post-training evolve from chatbots to agents? | SFT vs RLHF vs RLVR, signal migration |

### Part 3 · Agent Engineering

| # | Notebook | Primary question | Implementation focus |
|:---:|:---|:---|:---|
| 13 | [SWE Agents](notebooks/part3-engineering/10-swe-agents.ipynb) | How do agents fix real code? | Coverage-selection, serial repair loop |
| 14 | [Agent Memory](notebooks/part3-engineering/11-agent-memory.ipynb) | How do agents remember what they saw? | Hierarchical contexts, eviction, KV reuse |
| 17 | [Agent Evaluation](notebooks/part3-engineering/14-agent-evaluation.ipynb) | How do we measure long-horizon agents? | Eval harness, win-rate, time horizon |

### Part 4 · Frontiers

| # | Notebook | Primary question | Implementation focus |
|:---:|:---|:---|:---|
| 15 | [LLM Reasoning](notebooks/part4-frontiers/12-llm-reasoning.ipynb) | Where does reasoning ability come from? | CoT, self-consistency, emergent measures |
| 16 | [Mathematical Reasoning](notebooks/part4-frontiers/13-alphaproof-math.ipynb) | How do verifiers + search prove theorems? | Symbolic engine, proof verifier, search |
| 18 | [Autonomy](notebooks/part4-frontiers/15-autonomy-agents.ipynb) | What is missing between demo and autonomy? | Reliability, self-check retry, oversight |
| 19 | [Multimodal Robotics](notebooks/part4-frontiers/16-multimodal-robotics.ipynb) | How do VLA models work? | Action tokenization, vocabulary masking |
| 20 | [Future Research](notebooks/part4-frontiers/17-future-research.ipynb) | What is still unsolved? | Open problems, Goodhart, coordination |

## Quality Bar

The repository follows a small set of standards to keep the notebooks useful as learning material:

- Concepts are introduced by motivation before notation.
- New terminology is defined before it is used heavily.
- Core algorithms include at least one concrete hand calculation or toy example.
- Code cells are kept small and observable.
- Randomized experiments use fixed seeds.
- Every notebook is self-contained; model-dependent experiments use the configured real API.
- Explanations are written for patient beginners, while the code stays close to the real algorithm.

## Papers and Systems

| Paper or system | Concepts covered |
|:---|:---|
| Large Language Monkeys / Snell et al. | Repeated sampling, compute-optimal test-time scaling |
| Cobbe verifiers / Lightman / Math-Shepherd | Outcome vs process reward models |
| ReAct / RLEF / Constitutional AI | Tool use, execution feedback, AI feedback |
| LATS / ADaPT / SPRINT | Tree search, as-needed decomposition, parallel execution |
| STaR / DeepSeekMath-GRPO / DAPO | Reasoning bootstrapping, group-relative RL |
| ADAS / AI Scientist / AlphaEvolve | Automated agent design, open-ended evolution |
| AlphaCode / Search-o1 | Program sample-filter-cluster, agentic retrieval |
| MemGPT / Cartridges / CacheBlend | Hierarchical memory, learned compression, KV reuse |
| CodeMonkeys / KernelBench | Test-time compute for software engineering |
| METR / GDPval / DeepScholar-Bench | Long-horizon and economic-value evaluation |
| CoT / Self-Consistency / Emergent Abilities | Reasoning traces, sampling-and-marginalizing |
| AlphaGeometry / AlphaProof | Neuro-symbolic proof, formalization + RL |
| RT-2 / OpenVLA | Vision-language-action models |

## Course Origin

The curriculum mirrors the syllabus of Stanford's [CS329A: AI Agents](https://cs329a.stanford.edu/)
(Autumn 2025). The course page lists each lecture's papers without lecture details. This repository
downloads and reads those papers, writes a study note for every lecture
(`papers/lecture-XX/NOTES.md` and `NOTES.en.md`), then turns each lecture into a runnable notebook that reconstructs how
the lecturer would teach it. Chinese notebooks live in `notebooks/`; the English port lives in `notebooks-en/`. The online reader switches with `?lang=en`.

Guest lectures without assigned papers (post-training evolution, LLM reasoning, AlphaProof, autonomy,
robotics) are reconstructed from the speaker's research direction and related papers. See
[papers/](papers/) for the study notes and `scripts/download_papers.py` for reproducing the paper
collection. The teaching contract and repository style are inspired by
[Modern LLM Notebook](https://github.com/walkinglabs/modern-llm-notebook).

## Repository Structure

```text
self-improving-agent-notebook/
├── notebooks/                    # Chinese notebooks (17)
├── notebooks-en/                 # English notebooks (17), same layout
│   ├── part1-foundation/         # 01-05
│   ├── part2-training/           # 06-09
│   ├── part3-engineering/        # 10, 11, 14
│   └── part4-frontiers/          # 12, 13, 15, 16, 17
├── papers/                       # NOTES.md (ZH) + NOTES.en.md (EN); PDFs reproducible
├── scripts/download_papers.py    # Resolve and download all course papers from arXiv
├── llm_client.py                 # Unified LLM client (OpenAI-compatible)
├── web/                          # React/Vite reader (deployed to GitHub Pages)
├── .claude/CLAUDE.md             # Chinese notebook writing guide
├── .claude/CLAUDE.en.md          # English notebook writing guide
├── OUTLINE.md / OUTLINE.en.md    # Course outline
└── README.md / README-CN.md
```

## Contributing

Contributions are welcome when they improve clarity, correctness, or coverage: fix incorrect
explanations, improve hand calculations and visualizations, add focused exercises with assertions,
propose new notebooks for important agent topics, or help verify notebooks against a real LLM
endpoint.

## Citation

If Self-Improving Agent Notebook helps your research or work, please cite:

```bibtex
@misc{self-improving-agent-notebook,
  title   = {Self-Improving Agent Notebook: Build AI Agents from Scratch},
  author  = {WalkingLabs},
  year    = {2026},
  url     = {https://github.com/walkinglabs/self-improving-agent-notebook},
  note    = {GitHub repository, accessed 2026}
}
```

## License

License to be determined. The project follows the spirit of the
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-nc-sa/4.0/),
same as the reference project Modern LLM Notebook.

---

<p align="center">
  <sub>
    Built for engineers who want to understand agent systems from the inside.
    <br>
    Maintained by <a href="https://github.com/walkinglabs">walkinglabs</a>.
  </sub>
</p>
