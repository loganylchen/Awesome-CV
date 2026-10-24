# Yuelong Chen · 陈玥茏

中英文个人学术 CV，使用 [Awesome-CV](https://github.com/posquit0/Awesome-CV) LaTeX 模板。

统一维护分支为 `cv-unified`。原有 `main`、`jing-gang-shan`、`qiongtai-normal-university` 和 `tropical-ocean-university` 的历史已合并到此分支；各定制版本可通过 `cv-2026-10-24-*` tags 和 [Releases](https://github.com/loganylchen/Awesome-CV/releases) 查看。

## 编辑

- 英文内容：`examples/cv/`；中文内容：`examples/cv-zh/`。
- 主文档：`examples/cv.tex` 和 `examples/cv_zh.tex`。
- 共用排版、字体和联系方式：`examples/cv-common.tex`。
- 两种语言保持相同的章节、条目和时间线。已发表论文与未发表稿件分列。
- 修订依据和待确认事实见 [修订记录](docs/cv-revision-notes.md)。

## 编译

使用 XeLaTeX；本地需要完整 TeX Live 和中文字体。优先采用 Noto Sans CJK SC，也支持 macOS 的 PingFang SC 或 Adobe Kaiti Std。

```bash
make                         # examples/cv.pdf 和 examples/cv_zh.pdf
make examples/cv.pdf          # 仅英文
make examples/cv_zh.pdf       # 仅中文
make clean                   # 清理生成文件
```

使用与 CI 相同的 Docker 环境：

```bash
docker build -t awesome-cv -f .devcontainer/Dockerfile .
docker run --rm -v "$PWD:/workspace" -w /workspace awesome-cv make
```

`examples/resume.tex`、`examples/resume/` 和 `examples/coverletter.tex` 保留为上游模板示例，内容不属于陈玥茏，默认不编译、不发布。需要查看模板时可运行 `make examples`。

## 保存版本

推送分支会编译 CV，并在 Actions 中提供 `cv-build-results` artifact。提交修订后，推送一个新 tag 即可创建对应的 GitHub Release，并附上中英文 PDF：

```bash
git tag -a cv-2026-10-24-unified -m "Unified bilingual CV"
git push origin cv-2026-10-24-unified
```

每个需要保留的版本使用新 tag。构建失败时不会发布 Release。普通分支推送、Pull Request 和手动运行只提供构建产物。

## 模板来源

基于 Claud D. Park 的 [Awesome-CV](https://github.com/posquit0/Awesome-CV)。保留仓库及源码中的原始许可证和署名。
