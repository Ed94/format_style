[string[]] $include = '*.h', '*.hh', '*.hpp', '*.c', '*.cc', '*.cpp'
[string[]] $exclude = ''

Write-Host "Beginning format...`n"

# Format the files.
$formatParams = @(
    '-i'          # In-place
    '-style=file' # Search for a .clang-format file in the parent directory of the source file.
    '-verbose'
)

$targetFiles = @(Get-ChildItem -Recurse -Path $path_test -Include $include -Exclude $exclude | Select-Object -ExpandProperty FullName)

clang-format $formatParams $targetFiles

Write-Host "`nFormatting complete"
