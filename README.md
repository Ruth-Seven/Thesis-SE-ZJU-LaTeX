## 浙江大学软件学院硕士研究生学位论文LaTeX模板
模板上游：[Kwen](https://github.com/KwenString/Thesis-SE-ZJU-LaTeX)<br>
模板改造者：  [Mengoreo](mailto:moonshine-you@maskmail.net)

## 1、简介
一些简介和高阶使用，可以详见[Kwen](https://github.com/KwenString/Thesis-SE-ZJU-LaTeX/blob/master/README.md)，这里只介绍为了迎合软院2020年毕业论文标准，做出的修改。

## 2、开始使用

本项目已经在 macOS Catalina (MacTex 2020/2019)，Windows 10 Pro(Tex Live 2020/2019) 和 Ubuntu 18.04.1 LTS(Tex Live 2020/2019) 上测试通过，其他版本和系统未进行测试。

> Windows 10 Pro 中使用 TeXworks 需要编译两次才可以正常显示目录，从命令行执行`latexmk -xelatex`编译正常。
>
> 还有 Windows 在安装字体时一定要**为所有用户安装**，要不然「跟没装一样」。

按照[官网](https://tug.org/texlive/)安装教程之后，下载 [Adobe Heiti Std R](https://hdream-my.sharepoint.com/:u:/g/personal/mengoreo_huadream_com/ERzetxcWKoJBuKnUQjLYIhsBZgLIeFib_GUyVp-kOIey3g?e=oFXEZx)、[KaiTi](https://hdream-my.sharepoint.com/:u:/g/personal/mengoreo_huadream_com/ER5NuELjli1Pr4W5soeQzcQB53K1zlvdZW6hBGC8nEUx5A?e=b4jQPj) 和 [FangSong_GB2312](https://hdream-my.sharepoint.com/:u:/g/personal/mengoreo_huadream_com/EVpdW8jP481Oqi_bjB-2zBIBjWYhZKP9NkELHJoQoa-_pw?e=lTLHLt)，并安装，一般情况下就可以正常使用了。如果遇到啥问题，issue就好了，我回复一般是很及时的🧏🏻



## 3、更新内容

- [取消页眉英文全部大写](https://github.com/KwenString/Thesis-SE-ZJU-LaTeX/pull/2/commits/7464296bb7ee83c69264fdaa47e7ee02db293001)
- [取消使用TeX Gyre*，改为 Times New Roman](https://github.com/KwenString/Thesis-SE-ZJU-LaTeX/pull/2/commits/140fcd6559470fea3d7a52ff765f95090a99d2e5)
- [设置仿宋字体为FangSong_GB2312，并解决不能加粗的问题](https://github.com/KwenString/Thesis-SE-ZJU-LaTeX/pull/2/commits/0598613d03583a5c73e370336f660bffa2f7b510)
- [修改英文评审页中 Examining Committe Chair](https://github.com/KwenString/Thesis-SE-ZJU-LaTeX/pull/2/commits/bc8591f4a6c75d9849eeb133a13c377718f6acb0)
- [调整章题目与页眉距离及段前段后距离](https://github.com/KwenString/Thesis-SE-ZJU-LaTeX/pull/2/commits/3c64947044218e9a7ce2f5d809e2de4a96405291)
- [删除目录、摘要等题目中的空格](https://github.com/KwenString/Thesis-SE-ZJU-LaTeX/pull/2/commits/f4772b93cba8c90d0b9d1c61d2ba46f746b33b02)
- [添加「式」到 `\eqref`](https://github.com/KwenString/Thesis-SE-ZJU-LaTeX/pull/2/commits/37a7d1a699b9d1a09c757dee4787b54eba908c47)
- 等



编译方法见https://github.com/KwenString/Thesis-SE-ZJU-LaTeX

## 4、参考

- https://github.com/KwenString/Thesis-SE-ZJU-LaTeX
- https://github.com/CTeX-org/gbt7714-bibtex-style/compare/v1.1.1...master#diff-4ac32a78649ca5bdd8e0ba38b7006a1eR21

## 4、许可权和贡献

**MIT** 

欢迎 issue 和 PR
