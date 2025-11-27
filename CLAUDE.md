# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is Awesome CV - a LaTeX template for creating professional CVs (Curriculum Vitae), Résumés, and Cover Letters. The project is a LaTeX document class (`awesome-cv.cls`) with accompanying example documents and build infrastructure.

## Key Commands

### Building Documents
```bash
# Build all example documents (resume, cv, cover letter, etc.)
make

# Build specific document types
make resume.pdf    # Build resume
make cv.pdf        # Build CV  
make coverletter.pdf # Build cover letter
make cv_cn.pdf     # Build Chinese CV
make cv_compute_zh.pdf # Build Chinese computing CV

# Clean build artifacts
make clean
```

### Development Environment
```bash
# Using Docker (recommended)
docker run --rm --user $(id -u):$(id -g) -i -w "/doc" -v "$PWD":/doc thomasweise/texlive make

# Direct compilation (requires XeLaTeX)
xelatex {your-document}.tex
```

### Linting
```bash
# YAML linting for configuration files
yamllint .
```

## Architecture

### Core Components
- `awesome-cv.cls` - The main LaTeX document class defining templates, layouts, and styling for CVs/resumes
- `examples/` - Directory containing example documents and templates
  - `resume.tex`, `cv.tex`, `coverletter.tex` - Main example documents
  - `resume/`, `cv/` - Supporting files organized by document type
  - Language variants: `cv_cn.tex`, `cv_compute_zh.tex`

### Build System
- `Makefile` - Handles compilation of different document types using XeLaTeX
- `.github/workflows/build_cv.yaml` - CI/CD pipeline for automated PDF generation
- `.devcontainer/` - Docker development environment configuration

### Styling Configuration
The template supports multiple color schemes: awesome-emerald, awesome-skyblue, awesome-red, awesome-pink, awesome-orange, awesome-nephritis, awesome-concrete, awesome-darknight

## Document Structure
Documents follow a semantic markup pattern where content is separated from presentation. The class file handles typography, layout, and styling while document files contain the actual content structured with specific commands for sections like experience, education, skills, etc.