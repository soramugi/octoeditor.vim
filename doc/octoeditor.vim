*octoeditor.txt*

Author: Akira Maeda                             *octoeditor-author*
License: Same terms as Vim itself (see |license|)

This plugin is only available if 'compatible' is not set.

==============================================================================
INTRODUCTION                                    *octoeditor*

Install in ~/.vim

Set the path to your Octopress in your vimrc.

The default directory path is "~/octopress". You can override these if you like.

Example: >
    let g:octopress_path = "path/to/dir"
<
The default post suffix is "markdown". You can override these if you like.
enable a prompt for post tags and/or post categories during create.

Example: >
    let g:octopress_post_suffix = "markdown"
    let g:octopress_date = "%Y-%m-%d %H:%M"
    let g:octopress_date = "epoch"
    let g:octopress_date = "%D %T"
    let g:octopress_prompt_tags = 1
    let g:octopress_prompt_categories = 1
    let g:octopress_qfixgrep = 1
    let g:octopress_vimfiler = 1
    let g:octopress_template_dir_path = "path/to/dir"
<
You may also want to add a few mappings to stream line the behavior: >
    map <Leader>on  :OctopressNew<CR>
    map <Leader>ol  :OctopressList<CR>
<
==============================================================================
COMMANDS                                        *octoeditor-commands*

                                                *octoeditor-:OctopressList*
:OctopressList               List Posts.
    Show up Post file list in new buffer.

                                                *octoeditor-:OctopressNew*
:OctopressNew                Create a new Post
    You'll be asked like following: >
         Post title:
<
    Use CTRL-C to cancel. If you want to fill tags/categories: >
        let g:octopress_prompt_tags = 1
        let g:octopress_prompt_categories = 1
<
                                                *octoeditor-:OctopressGrep*
:OctopressGrep               Grep Octopress Posts Directory

    You'll be asked to search the keyword like following: >
        OctopressGrep word:
<
                                                *octoeditor-:OctopressGenerate*
:OctopressGenerate           Generate Posts.
     Generate Post file.

                                                *octoeditor-:OctopressDeploy*
:OctopressDeploy             Deploy Posts.
     Deploy Post file.


==============================================================================
TEMPLATE *octopress-template*

If you want to change default template, set template directory path.

Example:
>
    let g:octopress_template_dir_path = "~/.vim/template/octopress"
<

Note:
    Template file's naming rule is octopress_post_suffix + '.txt'
>
    let g:octopress_post_suffix = "markdown"
    let g:octopress_template_dir_path = "~/.vim/template/octopress"
<
    Template file should put into ~/.vim/template/octopress/markdown.txt


Template variables:
    |{{_title_}}| Title which you input.
    |{{_date_}}| Datetime when Post file created.
    |{{_tags_}}| Tags which you input.
    |{{_categories_}}| Categories which you input.

Example:
>
    ---
    layout: post
    title: {{_title_}}
    published: true
    date: {{_date_}}
    tags: [{{_tags_}}]
    categories: [{{_categories_}}]
    ---
<
    If you input like following.
>
    title: Sample Post 
    tags: foo
    categories: bar, baz
<
    Post file would be like following.
>
    ---
    layout: post
    title: Sample Post
    published: true
    date: 2012-03-29 22:16
    tags: [foo]
    categories: [bar, baz]
    ---
<

Note:
    If you did not set tags or categories in your .vimrc {{_tags_}} and/or
    {{_categories_}} would be ignored.

Example:
    If you input like following.
>
    title: Sample Post
<
    Post file would be like following.
>
    ---
    layout: post
    title: Sample Post
    published: true
    date: 2012-03-29 22:16
    tags: []
    categories: []
    ---
<

==============================================================================
ABOUT                                           *octoeditor-about*

Grab the latest version or report a bug on Github:

http://github.com/glidenote/octoeditor.vim

==============================================================================
 vim:tw=78:et:ft=help:norl:
