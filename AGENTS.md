# AGENTS.md

This document provides guidance for agentic coding agents working with the Awesome-CV LaTeX template for personal resumes/CVs.

## Build Commands

### Building Documents
```bash
# Build all documents
make

# Build specific document (PDFs created in examples/)
xelatex examples/resume.tex      # English resume
xelatex examples/cv.tex         # English CV
xelatex examples/cv_zh.tex      # Chinese CV
xelatex examples/coverletter.tex # Cover letter

# Clean build artifacts
make clean  # Removes all *.pdf from examples/
```

### Linting
```bash
# YAML linting (for CI/CD config files)
yamllint .
```

### Verification
1. Build documents with `make` or `xelatex`
2. Check generated PDFs for correct formatting and content
3. Compare Chinese and English versions for consistency

**Note:** This is a personal resume project. "Tests" are successful document compilations.

## Code Style Guidelines

### File Structure
- **Main documents**: resume.tex (英文简历), cv.tex (英文CV), cv_zh.tex (中文CV), coverletter.tex (求职信)
- **Section files**: examples/resume/, examples/cv/, examples/cv-zh/
- **Class file**: awesome-cv.cls (defines all commands and styling)

### Naming Conventions
- **Files**: lowercase, descriptive (e.g., experience.tex, skills.tex)
- **LaTeX commands**: camelCase (e.g., `\cventry`, `\cvsection`)
- **Document class**: awesome-cv

### Keeping Chinese & English Consistent

**关键原则**：中英文版本应保持结构和内容的一致性

1. **同步文件结构**
   - English CV: examples/cv/
   - Chinese CV: examples/cv-zh/
   - 确保两个目录下的文件名和数量相同
   - 例如：如果有 cv/education.tex，也应该有 cv-zh/education.tex

2. **内容同步策略**
   - 编辑时同时更新中英文版本
   - 保持章节顺序一致（例如：summary → education → experience）
   - 保持时间线、项目、技能的分类一致

3. **格式一致性**
   - 使用相同的章节标题（中文对应英文）
   - 保持相同的布局和间距
   - 相同的技能分类体系

### LaTeX Formatting
- Use `%` for comments, with separators like `%---------------------------------------------------------`
- Arguments in `{}` required, optional in `[]`
- Blank lines between logical sections
- 中文文件使用 UTF-8 编码，文件开头添加 `%!TEX encoding = UTF-8 Unicode`

### Document Configuration
- **Paper size**: a4paper (default) or letterpaper
- **Font size**: 11pt-18pt
- **Colors**: Use predefined colors (awesome-emerald, awesome-skyblue, awesome-red, etc.)
- **Section highlighting**: `\setbool{acvSectionColorHighlight}{true/false}`

### Language Support
- **UTF-8 encoding**: Add `%!TEX encoding = UTF-8 Unicode` at top of all files
- **Chinese documents**: Set CJK font in cv_zh.tex: `\setCJKmainfont{Adobe Kaiti Std}`
  - macOS alternative: `\setCJKmainfont{PingFang SC}`
  - Windows alternative: `\setCJKmainfont{SimSun}`
  - Linux alternative: `\setCJKmainfont{Noto Sans CJK SC}`
- **Compiler**: Must use XeLaTeX for proper font support

### Commands and Environments

**Personal Info Commands:**
```latex
\name{firstname}{lastname}  % English: name{Byungjin}{Park}
\position{title}            % English: position{SRE Engineer}
\address{address}
\mobile{number}
\email{email}
\github{username}
\linkedin{username}
```

**CV Structure Commands:**
```latex
\cvsection{Section Title}              % English: \cvsection{Experience}
                                      % Chinese: \cvsection{工作经验}

\cventry{position}{organization}{location}{date}{description}
% English:
\cventry{SRE Engineer}{Company}{Seoul}{2023-Present}{Description}
% Chinese:
\cventry{SRE工程师}{公司}{首尔}{2023-至今}{描述}

\cvskill{category}{skillset}
% English:
\cvskill{Programming Languages}{Python, Go, Java}
% Chinese:
\cvskill{编程语言}{Python, Go, Java}
```

**Environments:**
```latex
\begin{cventries} ... \end{cventries}  % Multiple work/education entries
\begin{cvskills} ... \end{cvskills}    % Skills section
\begin{cvitems} ... \end{cvitems}      # Bullet points
```

**Cover Letter Commands:**
```latex
\recipient{name}{address}
\lettertitle{title}
\letterdate{\today}
\letteropening{Dear Hiring Manager,}    % English
\letteropening{尊敬的招聘经理，}         % Chinese
\letterclosing{Sincerely,}              % English
\letterclosing{诚挚地，}                  % Chinese
\letterenclosure{附件说明}
```

### Layout Parameters
```latex
\acvSectionTopSkip              % Space before sections (default: 3mm)
\acvSectionContentTopSkip       % Space after section header (default: 2.5mm)
\geometry{left=1.4cm, top=.8cm, right=1.4cm, bottom=1.8cm}
```

### Common Issues & Troubleshooting

**Font Issues:**
```bash
# macOS: Install fonts
brew tap homebrew/cask-fonts
brew install font-source-sans-pro font-roboto

# For Chinese documents, install CJK fonts:
# macOS: PingFang SC (pre-installed)
# Windows: SimSun (pre-installed)
# Linux: sudo apt-get install fonts-noto-cjk
```

**Compilation Errors:**
```bash
# View detailed error messages
xelatex -interaction=nonstopmode examples/cv_zh.tex

# Clean and rebuild
make clean && make

# Check .log files for specific error lines
```

**Common Issues:**
- Unmatched braces `{}` → Check all `\cventry` and `\cvskill` commands
- Missing `\input` files → Verify file paths in examples/cv/ and examples/cv-zh/
- Font errors → Install required fonts or change CJK font in document
- Special characters → Escape with backslash: `\&`, `\_`, `\%`, `\$`

### CI/CD
- Workflow in `.github/workflows/build_cv.yaml` builds all documents on push
- Uses Docker for consistent environment
- Uploads generated PDFs as artifacts
- Checks successful compilation only (not visual correctness)

### When Editing

1. **保持同步原则**：编辑时同时更新中英文版本
2. **优先编辑 section 文件**：在 examples/cv/ 或 examples/cv-zh/ 中编辑，不要直接改主文档
3. **测试编译**：每次修改后运行 `make` 或 `xelatex` 验证
4. **检查 PDF**：打开生成的 PDF 查看实际效果
5. **对比验证**：确保中英文版本结构和内容一致

### Editing Workflow Example

**当添加新的工作经历时：**

1. 编辑 `examples/cv/experience.tex`（英文）
```latex
\cventry
  {Senior SRE}  % Position
  {Company Name}  % Organization
  {San Francisco, CA}  % Location
  {2020-2023}  % Date
  {
    \begin{cvitems}
      \item {Achievement 1}
      \item {Achievement 2}
    \end{cvitems}
  }
```

2. 同时编辑 `examples/cv-zh/experience.tex`（中文）
```latex
\cventry
  {高级SRE工程师}  % 职位
  {公司名称}  % 组织
  {美国旧金山}  % 地点
  {2020-2023}  % 日期
  {
    \begin{cvitems}
      \item {成就1}
      \item {成就2}
    \end{cvitems}
  }
```

3. 运行 `make` 验证两个版本都成功编译

### Advanced Customization

```latex
% Custom color scheme
\definecolor{awesome}{HTML}{3E6D9C}  % Custom blue

% Custom margins
\geometry{left=1.5cm, top=1.0cm, right=1.5cm, bottom=2.0cm}

% Photo configuration
\photo[circle,noedge,left]{./examples/profile.jpg}
\photo[rectangle,noedge,right]{./examples/profile.jpg}

% Custom footer
\makecvfooter{\today}{姓名~~~·~~~简历}{\thepage}
```

### Important Notes
- This is a personal resume project - "Running" means compiling to PDF
- Always use XeLaTeX compiler (not pdflatex or lualatex)
- Maintain consistency between Chinese and English versions
- Content changes go in section files, not main documents
- No automated tests - verification is manual PDF review

### Directory Structure
```
awesome-cv/
├── awesome-cv.cls              # Styling class file
├── examples/
│   ├── resume.tex              # English resume
│   ├── cv.tex                 # English CV
│   ├── cv_zh.tex              # Chinese CV (中文简历)
│   ├── coverletter.tex        # Cover letter
│   ├── resume/                # Resume sections
│   ├── cv/                    # English CV sections
│   │   ├── summary.tex
│   │   ├── education.tex
│   │   ├── experience.tex
│   │   └── skills.tex
│   └── cv-zh/                 # Chinese CV sections (中文内容)
│       ├── summary.tex
│       ├── education.tex
│       ├── experience.tex
│       └── skills.tex
├── Makefile                   # Build automation
└── AGENTS.md                  # This file
```
