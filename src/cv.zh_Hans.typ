#import "danielgu-resume-style.typ": *

// 中文版本，措辞参考 resume/zh_Hans.html。
//
// 字体照搬 zh_Hans.html：正文 Noto Serif SC，标题 Noto Sans SC。
// 中英文一并覆盖为同一族，避免中西文混排时基线不一致。
// 说明：模板在姓名、页眉标签、标题内部各自 set 了 Linux Biolinum / Linux Libertine，
// 且作用域比文档根更内层，所以根作用域的 set 覆盖不到这些位置。
// 解决办法只有两类：
//   1) "字符串 show 规则"：规则贴着字符串本身，层级最内，一定能赢（见下方标题）；
//   2) 把字体直接写在传入的内容上（如 address）。
//    注意字符串 show 规则用 set 形式即可；但若目标是模板内部再加工的文本，
//    需要写成内容形式 text(...)[...]，否则会被模板的 set 盖掉。

// —— 姓名与页眉标签：Noto Serif SC（与正文同族，保持基线一致）——
// 必须用"内容型 show 规则"（返回 text(...)）；写成 set 形式的话只作用在外层，
// 会被模板在 header 内部的 set text(font: _sans) 覆盖，等于没写。
#show "顾真榕 Zhenrong Gu": text(font: ("Noto Serif SC",))[顾真榕 Zhenrong Gu]
#show "邮箱": text(font: ("Noto Serif SC",), weight: "bold")[邮箱]
#show "电话": text(font: ("Noto Serif SC",), weight: "bold")[电话]
#show "个人网站": text(font: ("Noto Serif SC",), weight: "bold")[个人网站]
#show "GitHub": text(font: ("Noto Serif SC",), weight: "bold")[GitHub]
// 模板的地址标签写死为 "Address"（smallcaps 只对大写字母生效，对中文无影响）。
#show "Address": text(font: ("Noto Serif SC",), weight: "bold")[地址]

// —— 列表项目符号 • ——
// 模板的标记是 marker: text(fill: _hairline)[•]，不带字体，于是会跟着正文
// 走 Noto Serif SC；而 Noto Serif SC 的 U+2022 是个又小又高的点，
// 与英文版 Linux Libertine 的圆点大小明显不一致。这里把 • 钉回 Libertine。
#show "•": set text(font: ("Linux Libertine", "Libertinus Serif"))

// —— 一级标题：Noto Sans SC ——
// 下面这些写法全部无效，会被模板标题内部那句
// set text(font: _sans, size: size, weight: "regular", tracking: 0.1em) 盖掉，
// 因为它的作用域比"根作用域"和"变换作用域"都更内层：
//   #show heading.where(level: 1): set text(font: ...)
//   #show heading.where(level: 1): it => { set text(font: ...); it }
//   #show heading.where(level: 1): it => { show text: set text(...); it }
//   #show heading.where(level: 1): it => { show regex(...): text(...); it }
// 唯一有效的是"字符串 show 规则"：它贴在被匹配的字符串自身之上，层级最内，
// 能稳定压过模板的 set。所以这里逐个匹配章节标题文字（weight 350 对应
// zh_Hans.html 里 h2 的 font-weight: 350）。
// 这些标题只作为章节标题出现，不会误伤正文。
#show "研究兴趣": set text(font: ("Noto Sans SC",), weight: 350)
#show "教育经历": set text(font: ("Noto Sans SC",), weight: 350)
#show "科研经历": set text(font: ("Noto Sans SC",), weight: 350)
#show "工作经历": set text(font: ("Noto Sans SC",), weight: 350)
#show "论文发表": set text(font: ("Noto Sans SC",), weight: 350)
#show "能力与技能": set text(font: ("Noto Sans SC",), weight: 350)
#show "主要奖项": set text(font: ("Noto Sans SC",), weight: 350)
#show "兴趣爱好": set text(font: ("Noto Sans SC",), weight: 350)

#show: resume.with(
  name: "顾真榕 Zhenrong Gu",
  contacts: (
    ("邮箱"):   link("mailto:zrgu@stu.xjtu.edu.cn", "zrgu@stu.xjtu.edu.cn"),
    ("电话"):   "+86 138 1299 7865",
    ("个人网站"): link("https://danielgu.org", "danielgu.org"),
    ("GitHub"): link("https://github.com/endaytrer", "endaytrer"),
  ),
  address: (
    // 页眉整块由模板以 Linux Libertine + lang: "en" 渲染，中文会回退到黑体；
    // 这里把地址包成单个内容并显式指定字体，随地址值一起继承。
    text(font: ("Noto Serif SC",))[
      弘理楼 4-6090 室\
      西安交通大学（中国西部科技创新港）\
      红光大道 2399 号\
      中国 陕西省 西安市 710049
    ],
  ),
  // 参考文献中需要加粗的作者名（与 pubs.bib 中的拼写一致）。
  highlight-author: "Zhenrong Gu",
)

// —— 正文：Noto Serif SC（中英文同一族），lang 设为 zh 以按中文规则断行 ——
#set text(font: ("Noto Serif SC",), lang: "zh")

// 模板用 emph 表示职务、日期条目与导师等副标题；HTML 对应位置是粗体正体，
// 中文也一律不做倾斜。
#show emph: set text(style: "normal", weight: "semibold")

= 研究兴趣

形式化方法与自动推理，包括*决策图*（BDD、ADD、NDD 与 CFLOBDD）与 *SMT 求解器*，及其在程序语言、网络验证与网络系统上的运用。

= 教育经历

#entry[西安交通大学][
  #role(date: [2024年9月 -- 至今])[先进网络系统团队 硕士研究生]
  - 导师：张鹏教授

  #role(date: [2020年9月 -- 2024年6月])[计算机试验班（国家基础学科拔尖计划）工学学士]
  - GPA（平均学分绩）：3.95/4.3，平均分：91.64，专业排名：4/37
  - 毕业设计：可扩展网络仿真系统设计与实现
  - 核心课程：计算机程序设计（100），算法设计与分析（98），软件定义网络（99）

  #role(date: [2019年9月 -- 2020年6月])[少年班，预科（Honors Youth Program）]
]

#entry[威斯康星大学麦迪逊分校（University of Wisconsin - Madison, UW-Madison）][
  #role(date: [2022年9月 -- 2022年12月])[国际访问学生项目（Visiting International Student Program，计算机科学主题项目）]
  - 成绩：4 门课程全部为 A
  - 核心课程：操作系统（A），计算机体系结构（A）
]

= 科研经历

#entry(date: [2026年4月 --], subtitle: [合作导师：Thomas Reps 教授])[威斯康星大学麦迪逊分校（UW--Madison）madPL 研究组（远程合作研究）][
  - 与 Meghana A. Sistla 合作开发了广义 CFLOBDD 数据结构，并将其进一步推广应用于量子计算与网络验证；
  - 为 CFLOBDD 设计增强的数据结构与算法，将额外开销降低 3.5--20 倍，并消除了 2--8 倍的冗余中间乘积；
  - 2026 年 8 月于威斯康星大学麦迪逊分校线下作关于网络验证与广义 CFLOBDD 的报告。
]

#entry(date: [2023年7月 --], subtitle: [导师：张鹏教授])[西安交通大学先进网络系统团队（ANTS）][
  #role(date: [2025年7月 --])[*网络配置自动修复*]
  - 提出语法驱动的网络配置自动修复方法，借鉴自动程序修复（automatic program repair, APR）的思想，解决现有语义驱动、基于 SMT 约束的 ACR 工具在可扩展性上的局限；
  - 在真实生产网络中取得 97.5% 的修复率，系统可扩展至万节点规模网络的真实故障案例并完成测试。

  #role(date: [2024年7月 -- 2025年6月])[*访问控制策略验证*]
  - 参与 Relia 的设计与完善：该方法通过引入等价类来加速带正则约束的 SMT 求解，使云访问控制策略验证速度提升 8.21 倍；
  - 设计了对基于字符串与基于自动机的拼接约束进行拆分的机制；
  - 将基于 Relia 的正则约束求解迁移到访问控制策略意图挖掘项目AccessRefinary中，为多轮约束预处理器（multi-round constraint preprocessor, MCP）的思路做出贡献。

  #role(date: [2023年7月 -- 2024年6月])[*可扩展网络仿真系统*]
  - 通过将路由软件镜像融合进单一进程，独立设计并开发了面向异构网络设备的可扩展网络仿真系统；
  - 开发了 Linux 自定义动态连接器与自定义数据路径，使多个用户程序可加载到同一虚拟地址空间；
  - 系统启动时间加速 300--2200 倍，连接建立 / 往返时延降低 3--5 倍。
]

#entry(date: [2022年5月 -- 2022年7月], subtitle: [导师：Terence Sim 教授])[新加坡国立大学 暑期项目（视觉计算方向）][
  - 独立设计并开发了基于主成分分析（principal component analysis, PCA）的遮挡人脸识别与重建新方法；
  - 带领小组在所有 12 组中获得冠军，成绩 A+。
]

#entry(date: [2021年9月 --])[课程及课外项目][
  - 使用 C 语言开发了 RISC-V 架构、兼容 Linux ABI 的宏内核操作系统原型，支持页表虚拟内存、多任务、自定义文件系统以及 VirtIO 块设备与显示设备驱动。仓库地址：#link("https://github.com/endaytrer/endros/", "github.com/endaytrer/endros")；
  - 基于 eBPF（extended Berkeley Packet Filter）开发了用于容器化数据平面操作的领域特定语言及平台；
  - 使用 JavaScript 与 WebGL 开发了路径追踪演示程序。
]

= 工作经历

#entry(date: [2024年6月 -- 2024年8月])[字节跳动（ByteDance）][
  #role[网络开发实习生，基础设施 -- 网络团队]
]

= 论文发表

// 条目为英文，直接改用带完整西文字形的 Libertine 族；lang 切回 en，
// 否则中文 lang 会把 CSL 的措辞本地化（出现"取读于"之类）。
#{
  set text(lang: "en", font: ("Noto Serif",), weight: 350)
  show emph: set text(style: "normal", weight: 350)
  bibliography("pubs.bib")
}

= 能力与技能

#entry[计算机技能][
  精通 C，有较强 Rust、C++ 能力，熟悉 TypeScript、JavaScript、Java、Python 与 Go 语言；有较强的系统开发经验，使用 Z3 / cvc5 进行 SMT 求解，BDD / 决策图库开发，LEAN 与形式化证明；熟悉 GNU/Linux（GCC / GDB / Shell）、Linux 内核开发与 eBPF、嵌入式系统，以及全栈 Web 开发。
]
#entry[语言（英语）][
  TOEFL iBT：110（阅读 30，听力 30，口语 25，写作 25）；CET-6：584；DET：130
]

= 主要奖项

#entry(date: [2024年6月])[西安交通大学 优秀毕业生干部]
#entry(date: [2021年10月])[2021 国际大学生程序设计竞赛铜奖][
  亚洲济南区域赛（第 108 / 726 名）
]
#entry(date: [2021年10月])[税友奖学金一等奖]
#entry(date: [2021年5月])[第 12 届“蓝桥杯”全国软件和信息技术专业人才大赛][
  Java 软件开发组（全国排名第 6）
]

= 兴趣爱好

网球、摄影、视频剪辑、素描、平面设计、全栈 Web 开发、开源社区贡献
