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

*Scalable formal verification and automated reasoning*, with a focus on decision diagrams and SMT-based analysis, and applications to network and cloud systems.


= Education

#entry[Xi'an Jiaotong University][
  #role(date: [Sep. 2024 -- Present])[Master's Student in NetVerify, Advanced Networked System Group]
  - Advisor: Prof. Peng Zhang

  #role(date: [Sep. 2020 -- Jun. 2024])[B.Eng. in Computer Science and Technology (Honors Science Program)]
  - GPA: 3.95/4.3, Average Score: 91.64, Major Rank: 4/37
  - Thesis: Design and Implementation of Scalable Network Emulation System
  - Core Courses: Programming Fundamentals (100), The Design and Analysis of Algorithms (98), Software-Defined Networks (99)

  #role(date: [Sep. 2019 -- Jun. 2020])[Honors Youth Program, Pre-University Program]
]

#entry[University of Wisconsin - Madison][
  #role(date: [Sep. 2022 -- Dec. 2022])[Visiting International Student Program (Computer Sciences Thematic Track)]
  - Grades: 4 courses, all A
  - Core Courses: Operating Systems (A), Intro to Computer Architecture (A)
]

= Research Experience

#entry(date: [Apr. 2026 -- Present], subtitle: [Collaborator: Prof. Thomas Reps])[Remote Research Collaborator, MADPL Group, University of Wisconsin - Madison][
- Refining and extending GCFLOBDDs, proposed by Meghana A. Sistla: formulated the grammar specification, designed a guarded grammar extension, and proved canonicity (paper in preparation);
- Implemented GCFLOBDDs in Rust and conducted grammar search and experiments; for each tested domain, identified a grammar yielding the fastest representation and one yielding the most space-efficient;
- Achieved ~2$times$ faster network verification, ~40% faster N-Queens solving than the fastest NDD, and 5--15$times$ faster quantum circuit construction than original CFLOBDDs through support for arbitrary qubit counts;
]

#entry(date: [Jul. 2023 -- Present], subtitle: [Advisor: Prof. Peng Zhang])[Student Researcher, Advanced Networked System Group, Xi'an Jiaotong University][
  #role(date: [Jul. 2025 -- Present])[*Automatic Network Configuration Repair*]
  - Developed Astragalus, replacing SMT-based repair generation with syntax-driven search inspired by automatic program repair; reduced iteration time by ~100$times$ with nearly unchanged iteration count;
  - Repaired 97.5% of injected incidents on a real network in 7.36 seconds on average; produced valid repairs for four real production incidents within six minutes on a network with thousands to tens of thousands of devices.
  #role(date: [Jul. 2024 -- Jun. 2025])[*Access Control Policy Verification*]
  - Contributed to Relia, which accelerates SMT-based cloud policy analysis through string equivalence classes: nearly 95% of cases accelerated, with an average 8.21$times$ speedup;
  - Developed concatenation elimination using field delimiters; splitting directly on pattern text instead of automata made splitting 100--1000$times$ faster;
  - Contributed to AccessRefinery's constraint preprocessing and built BDD-based bit-vector partitioning; the project achieves 10--100$times$ faster access control intent mining.

  #role(date: [Jul. 2023 -- Jun. 2024])[*Scalable Network Emulation System*]
  - Independently built a heterogeneous network emulator with a custom dynamic loader and user-space data path, bringing routing software images into one process;
  - Achieved 300--2200$times$ faster boot and a 3--5$times$ reduction in connection-establishment / round-trip latency.
]

#block(breakable: false)[
#entry(date: [May 2022 -- Jul. 2022], subtitle: [Advisor: Prof. Terence Sim])[Research Competition Participant, NUS Summer Workshop (Visual Computing)][
  - Independently created a new method based on principal component analysis (PCA) for face detection and reconstruction;
  - Won first place among 12 groups and received a grade of A+.
]
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

= Selected Talks

#entry(date: [Nov. 18, 2026])[Astragalus: Automatic Configuration Repair for Production Networks][
  SIGOPS ATC 2026, Hong Kong SAR (scheduled)
]

#entry(date: [Aug. 24, 2026])[Network Verification and BDDs][
  Invited talk, University of Wisconsin--Madison, Madison, USA
]

#entry(date: [Nov. 18, 2025])[Relia: Accelerating the Analysis of Cloud Access Control Policies][
  ASE 2025, Seoul, South Korea
]

= Computer & Language Skills

#entry[Computer Science][
  Proficiency in C, advanced Rust and C++, TypeScript, JavaScript, Java, Python and Go; Z3 / cvc5 for SMT solving, BDD/decision-diagram libraries, LEAN and formal proof assistants, system programming, proficient GNU/Linux skills (GCC / GDB / Shell), Linux kernel hacking and eBPF, embedded systems, fullstack web development.
]
#entry[Language (English)][
  TOEFL iBT 5.5/6.0 (Reading 6.0, Listening 6.0, Writing 5.5, Speaking 5.0)
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
