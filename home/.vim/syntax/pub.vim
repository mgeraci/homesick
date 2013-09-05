syn match pubInlineMode /%{[^}]*}/ contained

syn keyword pubKeyword if elif else contained
syn keyword pubKeyword for while contained
syn keyword pubKeyword switch case contained
syn keyword pubKeyword return contained

syn keyword pubBoolean true false contained

syn keyword pubScopeKeyword locals globals universals contained nextgroup=pubBlock skipwhite
syn keyword pubDefFunction function lambda contained
syn keyword pubBuiltin load include print contained

syn match pubNumber /\<[0-9][0-9]*\>/ contained

syn region pubString start=/"/ end=/"/ contained
syn region pubString start=/'/ end=/'/ contained
syn region pubComment start=/\/\// end=/$/ contained
syn region pubComment start=/\/\*/ end=/\*\// contained
syn region pubHtmlComment start=/\[\[\[/ end=/\]\]\]/ contained

syn cluster pubCluster contains=pubDefFunction,pubBuiltin,pubKeyword,pubBoolean,pubScopeKeyword,pubString,pubComment,pubNumber,htmlMode

syn region pubMode matchgroup=pubDelimiter start=/{%/ end=/%}/ contains=@pubCluster
syn region htmlMode matchgroup=pubDelimiter start=/\V{{/ end=/\V}}/ contains=pubInlineMode,pubMode,pubHtmlComment
syn region htmlMode start=/\%^/ end=/\%$/ contains=pubInlineMode,pubMode,pubHtmlComment

syn sync match pubSync grouphere pubMode "}}"
syn sync maxlines=200

hi link pubKeyword Keyword

hi link pubDefFunction Function
hi link pubBuiltin Identifier

hi link pubScopeKeyword StorageClass

hi link pubInlineMode String
hi link pubString String
hi link pubBoolean Boolean
hi link pubNumber Number

hi link htmlMode PreProc
hi link pubDelimiter Special

hi link pubComment Comment
hi link pubHtmlComment Comment
