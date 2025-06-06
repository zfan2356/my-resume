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
        tl: [东北大学，软件工程专业，本科，中国],
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
        bl: [技术架构部，基座大模型预训练/后训练工程师],
      )[
        - 负责微信内部基座大模型预训练/后训练的框架开发工作，包括模型训练加速，显存优化等。
        - 参与DeepSeek Infra的复现工作，使用ThunderKittens重构DeepGEMM，负责框架内*80%*的Kernel开发工作。
      ]
    )
  }

  let jetbrains = {
    let jetbrains-date = [#translate-date(1, 2020) -- #translate-date(12, 2020)]
    translate(
      en: cventry(
        tl: [*JetBrains Research*, Remote],
        tr: jetbrains-date,
        bl: [_HoTT and Dependent Types_, Interactive Theorem Prover Development],
      )[
      #noSimple[- Used features like gradle composite build and buildSrc to reduce build time and improve automation.]
      - Improved the language/IDE, such as sections, hygiene macros, `Fin` type with elaborative subtyping, semantic highlighting, etc.
      #noSimple(
        simple: [- Created a debugger for inspecting bidirectional type-checking and REPL in both CLI and IntelliJ IDEA.]
      )[
        - Created an extensible REPL engine, provided implementations in CLI (with contextual completion using `jline3`) and in IntelliJ IDEA (interacts with the opened project, supports completion, highlighting and goto definition).
        - Designed and implemented an expression type-checking debugger that supports step-into and displays local context and expressions as stack frames.
      ]],
      zh: cventry(
        tl: [*捷并思研究院*，远程],
        tr: jetbrains-date,
        bl: [同伦类型论与依值类型，交互式定理证明器 Arend 开发实习],
      )[
      - 使用 gradle composite build 和 buildSrc 等复杂的构建功能改善编译速度、提高构建自动化程度。
      - 实现了一些语言特性和 IDE 插件功能，如 section 语法、卫生宏、优化的 `Fin` 类型、语义高亮等。
      - 开发了一个可扩展的 REPL 引擎，并提供命令行实现（可通过上下文补全，使用 `jline3` 框架）、IntelliJ IDEA 实现（可与打开的项目进行交互，支持补全、高亮和跳转）。
      - 设计并实现了一个表达式类型检查的调试器，支持显示局部变量和表达式栈帧，同时支持单步调试。
      ],
    )
  }

  let aya = {
    translate(
      en: cventry(
        tl: [*Aya Prover*, Practical Implementation of Dependent Types (role: project leader)],
        tr: githublink("aya-prover/aya-dev"),
      )[
      - Supports dependent types, dependent pattern matching with confluence check for overlapping clauses, higher inductive types, GADTs (paper published), hierarchial universes, cubical type theory features, and implicit arguments.
      - Can export elaboration result to HTML or #latex. Can JIT-compile closures into JVM using HOAS, Can refine patterns using coverage information. Supports both LSP in VSCode and IntelliJ PSI. Provide jlink binary releases.
      ],
      zh: cventry(
        tl: [*Aya Prover*，实用的依值类型系统实现（职位：项目组长）],
        tr: githublink("aya-prover/aya-dev"),
      )[
      - 支持依值类型、依值模式匹配及重叠情况一致性检查、高阶归纳类型、泛化代数数据类型（已发表文章）、分层宇宙、立方类型论特性和隐式参数的推导。
      - 能导出繁饰结果到网页或 #latex。能将解释执行时的闭包 JIT 编译到 Java 字节码（使用 HOAS 接入原本的语法树）。能根据模式匹配覆盖情况智能对模式细化。同时支持 VSCode 的语言服务器协议和 IntelliJ 的代码分析框架。提供 jlink 二进制分发。
      ],
    )
  }

  let arendVSCode = {
    translate(
      en: cventry(
        tl: [*VSCode extension for Arend*, Arend language server, based on lsp4j and Arend compiler's internals],
        tr: githublink("ice1000/vscode-arend"),
      )[],
      zh: cventry(
        tl: [*VSCode extension for Arend*，Arend 语言服务实现，基于 lsp4j 框架和 Arend 编译器内部接口。],
        tr: githublink("ice1000/vscode-arend"),
      )[],
    )
  }

  let arendIO = {
    translate(
      en: cventry(
        tl: [*Arend IO*, Experimental IO library for Arend, implements unsafePerformIO and simple IO actions],
        tr: githublink("ice1000/arend-io"),
      )[],
      zh: cventry(
        tl: [*Arend IO*，实验性 Arend IO 库，实现了 unsafePerformIO 和简单的 IO 操作。],
        tr: githublink("ice1000/arend-io"),
      )[],
    )
  }

  let intellijPest = {
    translate(
      en: cventry(
        tl: [*IntelliJ Pest*, Pest language plugin for IntelliJ Platform],
        tr: githublink("pest-parser/intellij-pest"),
      )[
      - Semantic-based highlighting, completion, navigation, definition extraction/inlining, and Rust plugin integration.
      - Provides live preview -- test grammar files by dynamically highlighting user code according to the grammar on the fly. These highlighted code could be exported to HTML.
      ],
      zh: cventry(
        tl: [*IntelliJ Pest*，给 IntelliJ Platform 开发的 Pest 文法语言插件],
        tr: githublink("pest-parser/intellij-pest"),
      )[
      - 支持含语义信息的高亮、错误检查、定义跳转、变量补全、提取定义、内联定义以及与 Rust 插件集成。
      - 提供实时高亮功能——可根据语法定义为用户代码动态提供高亮以测试语法定义文件，并支持导出 HTML。
      ],
    )
  }

  let skills = {
    let devTools = {
      let tools = ("YouTrack", "Jira", "GitHub", "BitBucket", /* "Coding.net", "Tower", */ "Slack", "JetBrains Space")
      translate(en: [
        - Tools: editor-agnostic, have experience with team tools like #tools.join(", ") and more.
      ], zh: [- 开发工具：能适应任何常见编辑器/操作系统，有使用 #tools.join("、") 等团队协作工具的经验。])
    }
    let compiler = translate(en: [
      - Compiler: understand techniques like locally nameless, explicit substitution, ANF, (P)HOAS (in LF & logic programming), and NbE.
        #noSimple[Familiar with most parser generators, understand layout syntax parsing.]
    ], zh: [
      - 编译器：理解局部无名表示法、惰性代换（ES）、ANF、(P)HOAS 等技术，理解语义正规化（NbE）及其使用的惰性闭包技术。熟悉大部分 parser 生成器，理解布局的语法解析。
    ])
    let progLang = {
      let very = "Java Kotlin Rust C# Agda Haskell Arend"
      let somehow = "Dart C C++ F# F★ Idris Perl MATLAB"
      translate(en: [
        - Programming Languages: multilingual (not limited to any specific language), especially experienced in #very, comfortable with #somehow (in random order).
      ], zh: [
        - 编程语言：泛语言（编程不受特定语言限制），且尤其熟悉 #very，较为熟悉 #somehow（排名均不分先后）。
      ])
    }
    let ideDev = {
      let pref = "https://plugins.jetbrains.com/plugin/"
      let julia = link(pref + "10413")[Julia]
      let dtlc  = link(pref + "12176")[DTLC]
      let pest  = link(pref + "12046")[Pest]
      let kala  = link(pref + "17453")[Kala Inspections]
      translate(en: [
        - IDE Tooling: *6 years of experience*, familiar with the IntelliJ Platform infrastructure (created #julia, #dtlc, #pest, #kala, etc.), also have experience with VSCode plugin development.
      ], zh: [
        - IDE 工具开发：*6 年开发经验*，熟悉 IntelliJ 平台的基础设施（开发了 #julia、#dtlc、#pest、#kala 等插件），同时了解 VSCode 的插件开发。
      ])
    }
    let kotlinJava = {
      let before-swing = "JNI, JPMS, Gradle, Kotlin coroutines"
      translate(
        en: [- Kotlin/Java: *10 years of experience*, familiar with #before-swing, and Swing.],
        zh: [- Kotlin/Java：*10 年开发经验*，熟悉 #before-swing, Swing。]
      )
    }
    let mobileDev = translate(
      en: [- Mobile Development: *2 years of experience*, familiar with Flutter and Android.],
      zh: [- 移动端开发：*2 年开发经验*，熟悉 Flutter、Android。]
    )
    let typeTheory = translate(
      en: [- Type Theory: understand Martin-Löf type theory, coinduction, HoTT, and Cubical, familiar with Idris, Agda (*5 years* of experience, contributor), Arend and some Lean/F★/Coq.],
      zh: [- 类型论：理解 Martin-Löf 类型论、余归纳法、同伦类型论、立方类型论；熟悉 Idris，Agda（*5 年经验*，编译器和标准库贡献者），Arend 和一些 Lean/F★/Coq。]
    )
    progLang
    compiler
    kotlinJava
    typeTheory
    noSimple[
      - *JetBrains MPS*: #translate(
        en: [understand concepts and applications of #link("https://www.jetbrains.com/mps/")[Language-Oriented Programming].],
        zh: [理解 #link("https://www.jetbrains.com/mps/")[面向语言编程] 的概念和应用。]
      )
    ]
    ideDev
    noSimple[#mobileDev]
    devTools
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
  jetbrains

  translate(en: [== Related Projects], zh: [== 项目经历])
  aya
  intellijPest
  noSimple[
    #arendVSCode
    #arendIO
  ]

  translate(en: [== Skills], zh: [== 技能])
  skills

  translate(en: [== Misc], zh: [== 其它])
  misc

  // https://github.com/typst/typst/issues/1462
  {
    set text(size: 0pt)
    [@SIT]
    noSimple[@ExactlyApplied, @Guest, @ExtTyApp, @FordHelix]
  }
  translate(en: [== Publications & Preprints], zh: [== 论文发表 & 预印本])
  bibliography("pub.bib", title: none)
}

If you are seeing this in your compilation output,
it's caused by running `typst c main.typ` directly.
Please use the build scripts instead. In fact, please read the README.md file
(this message is created because I got a bug report from people who didn't read the README file).
