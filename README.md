## Reproducing the issue


### Setup

```
# Install ruby 2.6.10 x86 (that's the one I've tested on).
gem install tiny_tds --platform=ruby --version=2.1.5 -- --with-freetds-include="C:\Ruby26\msys32\mingw32\include\freetds"
bundle install
```

### Result on not compiled version

```
PS Z:\> bundle exec ruby .\src\entrypoint.rb
Starting script
TinyTds: TinyTds
```

### Result on compiled version

Compilation:

```
mkdir pkg
bundle exec ocra "src/entrypoint.rb" --console --debug-extract --no-lzma --add-all-core --gemfile Gemfile --no-dep-run --gem-full --output "pkg/tinytdsissue.exe"
cd pkg
./tinytdsissue.exe
cd ocrC9E2.tmp
.\bin\ruby.exe .\src\entrypoint.rb
```

Execution:

```
PS Z:\pkg\ocrC9E2.tmp> .\bin\ruby.exe .\src\entrypoint.rb
Starting script
Z:/pkg/ocrC9E2.tmp/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require': 126: The specified module could not be found.   - Z:/pkg/ocrC9E2.tmp/lib/ruby/gems/2.6.0/gems/tiny_tds-2.1.5/lib/tiny_tds/tiny_tds.so (LoadError)
  from Z:/pkg/ocrC9E2.tmp/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
  from Z:/pkg/ocrC9E2.tmp/lib/ruby/gems/2.6.0/gems/tiny_tds-2.1.5/lib/tiny_tds.rb:46:in `rescue in block in <top (required)>'
  from Z:/pkg/ocrC9E2.tmp/lib/ruby/gems/2.6.0/gems/tiny_tds-2.1.5/lib/tiny_tds.rb:43:in `block in <top (required)>'
  from Z:/pkg/ocrC9E2.tmp/lib/ruby/gems/2.6.0/gems/tiny_tds-2.1.5/lib/tiny_tds.rb:37:in `block in <top (required)>'
  from Z:/pkg/ocrC9E2.tmp/lib/ruby/gems/2.6.0/gems/tiny_tds-2.1.5/lib/tiny_tds.rb:42:in `<top (required)>'
  from Z:/pkg/ocrC9E2.tmp/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:130:in `require'
  from Z:/pkg/ocrC9E2.tmp/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:130:in `rescue in require'
  from Z:/pkg/ocrC9E2.tmp/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:34:in `require'
  from ./src/entrypoint.rb:6:in `<main>'
Z:/pkg/ocrC9E2.tmp/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require': cannot load such file -- tiny_tds/2.6/tiny_tds (LoadError)
  from Z:/pkg/ocrC9E2.tmp/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
  from Z:/pkg/ocrC9E2.tmp/lib/ruby/gems/2.6.0/gems/tiny_tds-2.1.5/lib/tiny_tds.rb:44:in `block in <top (required)>'
  from Z:/pkg/ocrC9E2.tmp/lib/ruby/gems/2.6.0/gems/tiny_tds-2.1.5/lib/tiny_tds.rb:37:in `block in <top (required)>'
  from Z:/pkg/ocrC9E2.tmp/lib/ruby/gems/2.6.0/gems/tiny_tds-2.1.5/lib/tiny_tds.rb:42:in `<top (required)>'
  from Z:/pkg/ocrC9E2.tmp/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:130:in `require'
  from Z:/pkg/ocrC9E2.tmp/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:130:in `rescue in require'
  from Z:/pkg/ocrC9E2.tmp/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:34:in `require'
  from ./src/entrypoint.rb:6:in `<main>'
Z:/pkg/ocrC9E2.tmp/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require': cannot load such file -- tiny_tds (LoadError)
  from Z:/pkg/ocrC9E2.tmp/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
  from ./src/entrypoint.rb:6:in `<main>'
```
