#import "chicv.typ": *;

#let Chinese = 0
#let EnglishFull = 1
#let Simplified = 2
#let runReader(mode) = {
  let translate(zh: [], en: []) = {
    if mode == Chinese {
      zh
    } else {
      en
    }
  }
  let noSimple(simple: [], content) = {
    if mode == Simplified {
      simple
    } else {
      content
    }
  }
  let months = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
  let translate-date(month, year) = translate(
    zh: [#year 年 #month 月],
    en: [#months.at(month - 1), #year]
  )
  let current = translate(
    zh: [至今],
    en: [Present]
  )

  let edu = {
    let neu-courses = (
      ([Operating Systems], [操作系统]),
      ([Computer Networks], [计算机网络]),
      ([Computer Architecture], [计算机体系结构]),
    )
    translate(en: [== Education], zh: [== 教育经历])
    let neu-date = [#translate-date(9, 2021) -- #translate-date(6, 2025)]
    translate(
      en: cventry(
        tl: [B.S. in Software Engineering at *Northeastern University*, NE, China],
        tr: neu-date,
      )[Selected courses: #neu-courses.map(item => item.at(0)).join(", ")],
      zh: cventry(
        tl: [*东北大学*, 软件工程专业, 本科, 中国],
        tr: neu-date,
      )[部分必修课程：#neu-courses.map(item => item.at(1)).join(", ")],
    )
  }

  let wechat = {
    let wechat-date = [#translate-date(12, 2024) -- #current]
    translate(
      en: cventry(
        tl: [*Tencent*, WXG WeChat Technology Group],
        tr: wechat-date,
        bl: [Technology Architecture Department, Pre-training/Post-training Engineer of Base Model],
      )[
        - Responsible for the framework development of pre-training/post-training of base model in WeChat, including model training acceleration and memory optimization.
        - Participated in the reimplementation of DeepSeek Infra, using ThunderKittens to refactor DeepGEMM, and responsible for the development of *80%* of Kernels in the framework.
      ],
      zh: cventry(
        tl: [*腾讯科技有限公司* WXG 微信事业群],
        tr: wechat-date,
        bl: [技术架构部, 基座大语言模型pre-train/post-train工程师],
      )[
        - 负责微信内部基座大语言模型预训练/后训练的框架开发工作，包括模型训练加速，显存优化等。
        - 参与DeepSeek Infra的复现工作, 使用ThunderKittens重构DeepGEMM, 负责框架内*80%*的Kernel开发工作。
        - 参与RL框架的搭建工作, 搭建Parameter Server, 使用RDMA实现参数高性能通信。
      ]
    )
  }

  let mimikyu = {
    let mimikyu-date = [#translate-date(12, 2024) -- #current]
    translate(
      en: cventry(
        tl: [*Distributed Pre-training Engine for Large Language Models*],
        tr: mimikyu-date,
      )[
      A large-scale pre-training engine developed for WeChat's next-generation foundation model WELM, supporting multi-node multi-GPU training of trillion-parameter language models with industry-leading distributed training capabilities, perfectly adapted to the WeChat ecosystem.
      - *High-Performance Parallelism*: Implements 3D parallelism (TP+DP+PP) and ZeRO for dense models, with EP parallelism support for MoE models, enabling distributed training across multiple machines and GPUs.
      - *Customized Kernels*: Integrated forward and backward computation for most operators using Triton/ThunderKittens, with multiple operator fusion implementations to optimize memory usage and accelerate training efficiency.
      - *FP8 Precision Support*: Supports FP8 low-precision training with flexible precision selection through Quant/Dequant operations for efficient low-precision training.
      - *Cutting-edge Technology Integration*: Supports Dualpipe/DeepEP to achieve computation and communication overlap.
      ],
      zh: cventry(
        tl: [*大模型分布式预训练引擎*],
        tr: mimikyu-date,
      )[
      大模型分布式预训练引擎是为了微信内部新一代基座WELM自研的大规模预训练引擎, 支持多机多卡训练万亿级别参数的语言模型, 实现业界领先的模型大规模集群分布式训练, 完美适配微信生态. 
      - *高性能并行策略*: Dense模型实现3D并行TP+DP+PP以及ZeRO, 同时对MoE模型支持EP并行, 实现多机多卡分布式训练.
      - *定制化内核*: 使用Triton/ThunderKittens实现大部分算子的前向和反向计算集成到框架内, 同时实现多种算子的Fusion, 优化显存占用, 加速训练效率.
      - *FP8精度支持*: 支持FP8低精度训练, 同时也可以灵活选择训练精度, 通过Quant/Dequant实现低精度训练.
      - *前沿技术集成*: 支持Dualpipe/DeepEP, 实现计算和通信的overlap.
      ],
    )
  }

  let ps = {
    let ps-date = [#translate-date(12, 2024) -- #current]
    translate(
      en: cventry(
        tl: [*RDMA Server*],
        tr: ps-date,
      )[
      RDMA Server is a parameter distribution engine used by Pre-Train/Post-Train frameworks for efficient parameter distribution. Based on InfiniBand RDMA for high-performance reading, supporting multi-node multi-GPU parameter synchronization and forwarding, it is a Linux high-performance communication engine for large model distributed training.
      - *High-Performance Communication*: Based on InfiniBand, uses RDMA to optimize communication. GPUs can read memory data from other GPUs bypassing CPU, avoiding CPU intervention and achieving high-performance communication. Also provides UDP communication support.
      - *Python Binding*: Uses PyBind11 to wrap C++ code, providing easy-to-call Python interfaces.
      - *Asynchronous Support*: Implemented stackless coroutine model based on C++20 coroutine standard, transforming asynchronous I/O operations into sequential awaitable expressions through co_await suspension points. While maintaining event-driven high performance, eliminates callbacks through compile-time state machines, achieving synchronous semantics for asynchronous execution flow.
      - *High-Performance Logging*: Lock-free queue asynchronous batch log processing combined with thread-local buffering and double-buffering mechanisms. Achieves zero dynamic memory allocation based on memory pre-allocation, coupled with SSD-optimized sequential write strategy and real-time log compression, delivering tens of millions of log writes per second while maintaining nanosecond-level latency.
      ],
      zh: cventry(
        tl: [*RMDA Server*],
        tr: ps-date,
      )[
        RDMA Server 是Pre-Train/Post-Train框架使用的参数分发引擎, 用于高效分发参数, 基于InfiniBand RDMA实现高性能读取分发, 支持多机多卡参数的同步和转发, 是一套用于大模型分布式训练的Linux高性能通信引擎.
        - *高性能通信*: 基于InfiniBand, 使用RDMA优化通信, GPU可以越过CPU读取其他GPU的内存数据, 避免了CPU的干预, 实现高性能通信. 同时也提供了UDP的通信.
        - *PYBIND*: 使用PyBind11封装CPP代码, 提供易于调用的Python接口.
        - *异步支持*: 实现了基于C++20协程标准的无栈协程模型，通过co_await挂起点将异步I/O操作转化为顺序化可等待表达式，在保持事件驱动高性能的同时，通过编译期状态机消除回调，实现同步语义的异步执行流。
        - *高性能日志库*: 无锁队列异步批量化日志处理、结合线程本地缓冲与双缓冲机制，在内存预分配的基础上实现零动态内存分配，配合SSD优化顺序写策略和实时日志压缩，达成每秒千万级日志写入性能同时保持纳秒级延迟。
      ],
    )
  }


  let skills = {
    let acm = {
      let acm-date = [#translate-date(12, 2023)]
      translate(en: [
        - *ACM* (Association for Computing Machinery), member since #acm-date
      ], zh: [
        - *ACM竞赛经历* 熟悉算法与数据结构，代码能力强，曾获得*ICPC金牌*, ICPC/CCPC银牌若干, *省赛亚军*， codeforces 2300+
      ])
    }

    let progLang = {
      let very = "C/C++, Python, Go"
      let somehow = "Java, Rust"
      translate(en: [
        - *Programming Languages*: multilingual (not limited to any specific language), especially experienced in #very, comfortable with #somehow (in random order).
      ], zh: [
        - *编程语言*：泛语言（编程不受特定语言限制），且尤其熟悉 #very，较为熟悉 #somehow（排名均不分先后）。
      ])
    }

    let llm-algo = translate(en: [
      - *LLM Algorithms*: Proficient in large model pre-training algorithms, familiar with cutting-edge Dense and MoE technologies. Deep understanding of model architectures including Llama, DeepSeek, Qwen, and comprehension of principles and designs of components like Rotary, RMSNorm, Swiglu. Experienced in large model post-training algorithms, familiar with principles and designs of DPO, PPO, GRPO.
    ], zh: [
      - *LLM算法*: 熟悉大模型预训练相关算法, 熟悉Dense, MoE前沿技术, 深入了解Llama, DeepSeek, Qwen等模型结构, 了解Rotary, RMSNorm, Swiglu等原理和设计. 熟悉大模型后训练相关算法, 熟悉DPO, PPO, GRPO等原理和设计. 
    ])

    let llm-infra = translate(en: [
      - *Proficient in LLM Infrastructure*: Have studied source code of frameworks including Megatron-LM, DeepSpeed, FSDP, Verl, understanding their principles and designs. Familiar with distributed computing/communication libraries such as Ray, NCCL, and proficient in PyTorch.
    ], zh: [
      - *LLM Infra*: 阅读过Megatron-LM, DeepSpeed, FSDP, Verl等框架源码, 了解其原理和设计, 了解Ray, NCCL等分布式计算/通信库, 熟练掌握PyTorch.
    ])

    let system = {
      translate(en: [
        - *System & Hardware*: Understanding of Linux low-level principles, familiar with GPU/CPU hardware knowledge, proficient in X86-64, ARM64, RISC-V architecture knowledge, skilled in NVIDIA GPU underlying architecture and PTX assembly, proficient in writing CUDA-related code.
      ], zh: [
        - *System*: 了解Linux底层原理, 了解GPU/CPU硬件知识, 掌握X86-64, ARM64, RISC-V等架构知识, 熟练掌握NVIDIA GPU底层架构以及PTX汇编, 熟练编写CUDA相关代码.
      ])
    }

    acm
    progLang
    llm-algo
    llm-infra
    system

  }

  let misc = {
    let ai-router   = "https://zfan2356.github.io/AI-Router/"
    let cnlink   = link("https://github.com/zfan2356/my-resume/blob/main/resume/zfan-resume-cn.pdf")
    let enlink   = link("https://github.com/zfan2356/my-resume/blob/main/resume/zfan-resume.pdf")
    translate(en: [
      - Personal blog: #link(ai-router)[ai-router], recording learning experiences and technical sharing.
    ], zh: [
      - 个人博客：#link(ai-router)[ai-router], 记录学习心得与技术分享.
    ])
    translate(
      en: [- Languages: English - fluent, Chinese - native speaker],
      zh: [- 语言: English - 熟练(通过四六级)，汉语 - 母语水平]
    )
  }

  // Start of the document

  translate(en: [= #smallcaps[Fan Zhang]], zh: [= #smallcaps[张帆]])

  [#link("zfan38551@gmail.com")[zfan38551\@gmail.com] $dot.c$ #iconlink("https://github.com/zfan2356", icon: "github")]

  edu

  translate(en: [== Work Experience], zh: [== 工作经历])
  wechat

  translate(en: [== Related Projects], zh: [== 项目经历])
  mimikyu
  ps

  translate(en: [== Skills], zh: [== 技能])
  skills

  translate(en: [== Misc], zh: [== 其它])
  misc
}

If you are seeing this in your compilation output,
it's caused by running `typst c main.typ` directly.
Please use the build scripts instead. In fact, please read the README.md file
(this message is created because I got a bug report from people who didn't read the README file).
