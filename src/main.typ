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
        tl: [*东北大学*，软件工程专业，本科，中国],
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
        bl: [技术架构部，基座大语言模型pre-train/post-train工程师],
      )[
        - 负责微信内部基座大语言模型预训练/后训练的框架开发工作，包括模型训练加速，显存优化等。
        - 参与DeepSeek Infra的复现工作，使用ThunderKittens重构DeepGEMM，负责框架内*80%*的Kernel开发工作。
        - 参与RL框架的搭建工作，搭建Parameter Server，使用RDMA实现参数高性能通信。
      ]
    )
  }

  let mimikyu = {
    translate(
      en: cventry(
        tl: [Distributed Pre-training Engine for Large Language Models],
        // tr: githublink("aya-prover/aya-dev"),
      )[
      - Supports dependent types, dependent pattern matching with confluence check for overlapping clauses, higher inductive types, GADTs (paper published), hierarchial universes, cubical type theory features, and implicit arguments.
      - Can export elaboration result to HTML or #latex. Can JIT-compile closures into JVM using HOAS, Can refine patterns using coverage information. Supports both LSP in VSCode and IntelliJ PSI. Provide jlink binary releases.
      ],
      zh: cventry(
        tl: [大模型分布式预训练引擎],
        // tr: githublink("aya-prover/aya-dev"),
      )[
      - 
      ],
    )
  }

  let skills = {
    let acm = {
      let acm-date = [#translate-date(12, 2023)]
      translate(en: [
        - *ACM* (Association for Computing Machinery), member since #acm-date
      ], zh: [
        - *ACM竞赛经历* 熟悉算法与数据结构，代码能力强，曾获得*ICPC金牌*，codeforces 2300+
      ])
    }

    let llm = translate(en: [
      - LLM: familiar with LLM development, especially with the training and inference of large models.
    ], zh: [
      - *LLM算法*：熟悉大模型预训练/后训练相关算法，。
    ])

    let progLang = {
      let very = "C/C++ Python Go"
      let somehow = "Java Rust"
      translate(en: [
        - *Programming Languages*: multilingual (not limited to any specific language), especially experienced in #very, comfortable with #somehow (in random order).
      ], zh: [
        - *编程语言*：泛语言（编程不受特定语言限制），且尤其熟悉 #very，较为熟悉 #somehow（排名均不分先后）。
      ])
    }


    acm
    progLang
    llm

  }

  let misc = {
    let intellij = "https://plugins.jetbrains.com/author/10a216dd-c558-4aaf-aa8a-723f431452fb"
    let osc      = link("https://ice1000.org/opensource-contributions")
    // bintray  = "https://bintray.com/ice1000"
    let crates   = "https://crates.io/users/ice1000"
    // What to do with this?
    // let personal = "https://personal.psu.edu/yqz5714"
    let seRep    = [6000+]
    let paRep    = [5000+]
    let stackex(e) = link("https://stackexchange.com/users/9532102")[#e]
    let pase     = link("https://proofassistants.stackexchange.com/users/32/ice1000")[Proof Assistants]
    // https://raw.githubusercontent.com/ice1000/resume/master/resume.pdf
    let enSimple = link("https://tinyurl.com/y8xdlfug")
    // https://raw.githubusercontent.com/ice1000/resume/master/resume-elab.pdf
    let enElab   = link("https://tinyurl.com/y2v59t36")
    // https://raw.githubusercontent.com/ice1000/resume/master/resume-cn.pdf
    let cnLink   = link("https://tinyurl.com/ya4urea8")
    let codewars = link("https://www.codewars.com/users/ice1000")[CodeWars]
    let cwLevel  = [*1 dan*]
    let cwPerc   = [0.020%]
    let cwRank   = [\#111]
    let projects = [*agda, Arend, libgdx, jacoco, KaTeX, shields.io, grpc-rs, intellij-solidity, intellij-haskell, intellij-rust, TeXiFy-IDEA, rust-analyzer*]

    translate(en: noSimple(simple: [
      - Profile links (please use a PDF reader with hyperlink support):
        #link(crates)[Crates.io],
        #link(intellij)[IntelliJ] Marketplace
    ])[
      - Crates.io: #link(crates), publishing interesting Rust libraries
      - IntelliJ Marketplace: #link(intellij)
    ], zh: [
      - 相关个人页面链接（请使用支持超链接的 PDF 阅读器）：#link(crates)[Crates.io] 主页，#link(intellij)[IntelliJ] 插件市场主页
    ])
    translate(
      en: [- Languages: English - fluent (TOEFL 100), Chinese - native speaker],
      zh: [- 语言：English - 熟练 (托福 100)，汉语 - 母语水平]
    )
    translate(
      en: [
        - Open-source contributions: #osc, #noSimple[member of JuliaEditorSupport, agda, pest-parser, EmmyLua, arend-lang and more,]
          contributed to #projects and other projects #noSimple[(apart from organization ones)]
      ],
      zh: [- 开源贡献: #osc，向 #projects 等项目贡献过代码]
    )
    [- #link("https://stackoverflow.com/users/7083401/ice1000")[StackOverflow]: #seRep
      #translate(
        en: [reputation, also active on #pase (#paRep reputation) and #stackex("other StackExchange sites")],
        zh: [声誉，同时也在 #pase（#paRep 声誉）和#stackex("其他 StackExchange 子站")活跃]
      )
    ]
    translate(
      en: [
        - Latest revision of this resume: one-page version #enSimple, complete version: #enElab
        #noSimple[- Get the Chinese version of this resume: #cnLink]
      ],
      zh: [- 获取此简历的最新更新：中文版本 #cnLink，英语版本 #enElab，单页版本（仅英语）：#enSimple]
    )
    translate(
      en: [
        - #cwLevel on #codewars, ranked #cwRank on the whole site (Top #cwPerc),
          #noSimple[solving and making new coding challenges] primarily in Haskell, Agda, and Idris
          #noSimple[and some other JVM languages]
      ],
      zh: [- 在 #codewars 上，以 Haskell、Agda 和 Idris 为主，达到 #cwLevel，全站排名 #cwRank（前 #cwPerc）]
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

  translate(en: [== Skills], zh: [== 技能])
  skills

  translate(en: [== Misc], zh: [== 其它])
  misc
}

If you are seeing this in your compilation output,
it's caused by running `typst c main.typ` directly.
Please use the build scripts instead. In fact, please read the README.md file
(this message is created because I got a bug report from people who didn't read the README file).
