#!/bin/bash

rm -f zfan-*.pdf

files=("zfan-resume-cn" "zfan-resume" "zfan-resume-elab")
echo "Generating..."

for f in "${files[@]}"; do
  {
    echo '#import "main.typ": *;'
    echo '#show: chicv'
  } > "$f.typ"
done

echo '#runReader(Chinese)' >> "zfan-resume-cn.typ"
echo '#runReader(Simplified)' >> "zfan-resume.typ"
echo '#runReader(EnglishFull)' >> "zfan-resume-elab.typ"

for f in "${files[@]}"; do
  echo "Building $f.typ"
  typst compile "$f.typ"
  rm "$f.typ"
done
