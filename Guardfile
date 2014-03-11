guard :shell do
  watch(%r{.\+/.+\.(vim)$}) { system("TEST=1 vim") }
  watch(%r{.*\.(vim)$}) { system("TEST=1 vim") }
  watch('test.vim') { system("TEST=1 vim") }
end
