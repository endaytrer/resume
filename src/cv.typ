#import "danielgu-resume-style.typ": *

#show: resume.with(
  name: "Zhenrong (Daniel) Gu",
  contacts: (
    Email:   link("mailto:zrgu@stu.xjtu.edu.cn", "zrgu@stu.xjtu.edu.cn"),
    Phone:   "+86 138 1299 7865",
    Website: link("https://danielgu.org", "danielgu.org"),
    GitHub:  link("https://github.com/endaytrer", "endaytrer"),
  ),
  address: (
    "Room 4-6090, Hongli Building",
    "Xi'an Jiaotong University (iHarbour campus)",
    "2399 Hongguang Avenue,",
    "Xi'an, Shaanxi, P.R. China 710049",
  ),
  // Your name as the bibliography style prints it (IEEE: initials + surname).
  highlight-author: "Zhenrong Gu",
)

= Research Interests

Formal methods and automated reasoning, paticularly *decision diagrams* (BDDs / NDDs / ADDs / CFLOBDDs) and *SMT solvers*, with application to programming languages, network verification, and networked systems.


= Education

#entry[Xi'an Jiaotong University][
  #role(date: [Sep. 2024 -- Present])[Master Student in NetVerify, Advanced Networked System Group]
  - Advisor: Prof. Peng Zhang

  #role(date: [Sep. 2020 -- Jun. 2024])[B.Eng. in Computer Science and Technology (Honors Science Program)]
  - GPA: 3.95/4.3, Average Score: 91.64, Major Rank: 4/37
  - Thesis: Design and Implementation of Scalable Network Emulation System
  - Core Courses: Core Courses: Programming Fundamentals (100), The Design and Analysis of Algorithms (98), Software-Defined Networks (99)

  #role(date: [Sep. 2019 -- Jun. 2020])[Honors Youth Program, Pre-University Program]
]

#entry[University of Wisconsin - Madison][
  #role(date: [Sep. 2022 -- Dec. 2022])[Visiting International Student Program (Computer Sciences Thematic Track)]
  - Grades: 4 courses, all A
  - Core Courses: Operating Systems (A), Intro to Computer Architecture (A)
]

= Research Experience

#entry(date: [Apr. 2026 -- Present], subtitle: [Collaborator: Prof. Thomas Reps])[Remote Research Collaborator, madPL Group, University of Wisconsin - Madison][
  - Co-developed the generalized CFLOBDD data structure with Meghana A. Sistla, with more generalized application in quantum computing and network verification;
  - Designed enhanced data structures and algorithms for CFLOBDDs, reducing the overhead by 3.5-20$times$ and eliminating 2-8$times$ redundant intermediate products;
  - Delivered a talk on network verification and generalized CFLOBDDs in person at UW-Madison in Aug. 2026.
]

#entry(date: [Jul. 2023 -- Present], subtitle: [Advisor: Prof. Peng Zhang])[Student Researcher, Advanced Networked System Group, Xi'an Jiaotong University][
  #role(date: [Jul. 2025 -- Present])[*Automatic Network Configuration Repair*]
  - Proposed a syntax-driven approach to automatic network configuration repair (ACR), addressing the scalability limitations of existing semantic-driven, SMT-constraint-based ACR tools by adapting ideas from automatic program repair (APR);
  - Achieved a 97.5% repair rate on a real production network, the system can be scaled up to and tested on 10,000-node-network real incidents.
  #role(date: [Jul. 2024 -- Jun. 2025])[*Access Control Policy Verification*]
  - Contribute to the design and refinement of Relia, a general method to accelerate SMT solving with regular constraints by introducing equivalence classes, making cloud access control policy verification 8.21$times$ faster;
  - Designed the mechanism to deal with string-based and automata-based concatenation constraint splitting;
  - Port the Relia-based regular constraint solving into access control policy intent mining project AccessRefinary, contributing to the idea of multi-round constraint preprocessor (MCP).

  #role(date: [Jul. 2023 -- Jun. 2024])[*Scalable Network Emulation System*]
  - Independently designed and developed scalable network emulation system for heterogeneous network devices by fusing routing software images into a single process;
  - Developed a custom dynamic loader for routing software images, and a custom user-space data path for intra-process networking;
  - Achieved 300-2200$times$ speedup in system boot time, and 3-5$times$ reduction in connection establishment / round-trip time (RTT) latency.
]

#entry(date: [May 2022 -- Jul. 2022], subtitle: [Advisor: Prof. Terence Sim])[Research Competition Partitipant, NUS Summer Workshop (Visual Computing)][
  - Independently created a new method based on primary component analysis (PCA) for face detection and reconstruction;
  - Be awarded the champion among all 12 groups, got a grade of A+.
]

#entry(date: [Sep 2021 -- Present])[Course and Extracurricular Projects][
  - Developed an operating system for RISC-V machines with virtual memory with page tables, multiprocessing, custom filesystems, and drivers for VirtIO blocks and displays. Repository: #link("https://github.com/endaytrer/endros/", "github.com/endaytrer/endros");
  - Developed a domain-specific language (DSL) and platform for containerized dataplane manipulation, based on eBPF.
  - Developed a path tracing demo with JavaScript and WebGL.
]

= Work Experience

#entry(date: [Jul. 2025 -- May 2026])[ByteDance][
  #role[Network developer intern, Infrastructure -- Network Team]
]

= Publications

#bibliography("pubs.bib")

= Computer & Language Skills

#entry[Computer Science][
  Proficiency in C, advanced Rust and C++, TypeScript, JavaScript, Java, Python and Go; Z3 / cvc5 for SMT solving, BDD/decision-diagram libraries, LEAN and formal proof assistants, system programming, proficient GNU/Linux skills (GCC / GDB / Shell), Linux kernel hacking and eBPF, embedded systems, fullstack web development.
]
#entry[Language (English)][
  TOEFL iBT 110 (R 30, L 30, S 25, W 25); CET-6 584, DET (Duolingo English Test) 130
]

= Awards

#entry(date: [Jun. 2024])[Outstanding Graduate Leader, Xi'an Jiaotong University]
#entry(date: [Oct. 2021])[Bronze Award, 2021 International Collegial Programming Contest (ICPC)][
  Asia Jinan regional contest (Ranked 108#super[th] / 726)
]
#entry(date: [Oct. 2021])[First Prize, Shuiyou Scholarship, China]
#entry(date: [May 2021])[First Prize, 12#super[th] "Lanqiao" Cup National Software and IT Contest, China][
  Track of Java software development (ranked 6#super[th] in national final)
]

= Personal Interests

Tennis, photography, video editing, sketching, graphics designing, full-stack web development, contributing to open-source communities.
