# Overview

Automated linting allow you to remove the cognitive load of code review for
large or small projects. It allows you to focus on the larger items while
the linter take care of the well define items for the different language types.

I have managed linting by different Makefile target for the different type of
code.  While on a large project with many different type of file formats and
languages I ran across [Mega-linter](https://github.com/megalinter/megalinter)I.
I am using Mega-linter for the following reasons:

1. It will review your code and turn on any of it linters according to your file types.
2. It has a well layered set of documentation based on:
   1. Language like [go](https://github.com/megalinter/megalinter/blob/main/docs/descriptors/go.md#readme)
      1. language linters config like [golangci-lint](https://github.com/megalinter/megalinter/blob/main/docs/descriptors/go_golangci_lint.md)
         1. Specific [linter docs](https://golangci-lint.run/)
   2. format like [markdown](https://github.com/megalinter/megalinter/blob/main/docs/descriptors/markdown.md#readme)
      1. Specific linter [markdownlint](https://github.com/megalinter/megalinter/blob/main/docs/descriptors/markdown_markdownlint.md)
         1. Specific [linter docs](https://github.com/DavidAnson/markdownlint#readme)
   3. tools like [Dockerfile](https://github.com/megalinter/megalinter/blob/main/docs/descriptors/dockerfile.md#readme)
      1. Specific linter config like [Hadolint](https://github.com/megalinter/megalinter/blob/main/docs/descriptors/dockerfile_hadolint.md)
         1. Specific [linter docs](https://github.com/hadolint/hadolint#readme)
3. It also have configuration documentation based on
   1. Mega-linter [general config](https://github.com/megalinter/megalinter#common-variables)
   2. Sample [linter config](https://github.com/megalinter/megalinter/tree/main/TEMPLATES)
4. Support for [Github Actions](https://raw.githubusercontent.com/megalinter/megalinter/main/TEMPLATES/mega-linter.yml)
5. Difference [reporting formats](https://github.com/megalinter/megalinter#reporters)
6. [Plugins](https://github.com/megalinter/megalinter#reporters)
7. [flavors](https://github.com/megalinter/megalinter#flavors) for groups of languages and tools.
