function! Header_42()

	let logo42_top1 = ":::      ::::::::   */"
	let logo42_top2 = ":+:      :+:    :+:   */"
	let logo42_top3 = "+:+ +:+         +:+     */"
	let logo42_top4 = "+#+  +:+       +#+        */"
	let logo42_top5 = "+#+#+#+#+#+   +#+           */"
	let logo42_top6 = "#+#    #+#             */"
	let logo42_top7 = "###   ########.fr       */"
	let fileName = expand("%:t")
	let currentTime = strftime("%Y/%m/%d %H:%M:%S")
	let systmHstname = substitute(system('hostname'), '\n', '', '')
	let userName = $USER

	"------------------------------------------------------------------
	"------------------------------------------------------------------
	let count_character_logo42_top1 = len(logo42_top1)
	let count_character_logo42_top2 = len(logo42_top2)
	let count_character_logo42_top3 = len(logo42_top3)
	let count_character_logo42_top4 = len(logo42_top4)
	let count_character_logo42_top5 = len(logo42_top5)
	let count_character_logo42_top6 = len(logo42_top6)
	let count_character_logo42_top7 = len(logo42_top7)
	let count_character_fileName = len(fileName)
	let count_character_userName = len(userName)
	let count_systmHstname = len(systmHstname)
	let count_character_currentTime = len(currentTime)
	"------------------------------------------------------------------
	"------------------------------------------------------------------
	let spaces_after_content_for_top2 = 81 - 5 - count_character_fileName - count_character_logo42_top2 - 1
	let spaces_after_content_for_top4 = 81 - 5 - 8 - count_character_userName - count_character_userName - count_systmHstname - count_character_logo42_top4 - 1
	let spaces_after_content_for_top6 = 81 - 5 - 13 - count_character_currentTime - count_character_userName - count_character_logo42_top6 - 1
	let spaces_after_content_for_top7 = 81 - 5 - 13 - count_character_currentTime - count_character_userName - count_character_logo42_top7 - 1


	normal gg

	let is_there_Header = search('\/\* \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* \*\/', 'cnW')
	"echom "is_there_Header: " . is_there_Header
	
	let is_file_in_Header = search('^/\*.*' . fileName, 'ncW')
	"echom "is_file_in_Header: " . is_file_in_Header

	if is_file_in_Header <= 0
			let createHeader = [
		\ "/* ************************************************************************** */",
		\ "/*                                                                            */",
		\ "/*                                                        :::      ::::::::   */",
		\ "/*   " . fileName . repeat(" ", spaces_after_content_for_top2) . ":+:      :+:    :+:   */",
		\ "/*                                                    +:+ +:+         +:+     */",
		\ "/*   By: " . userName . " <" . userName . '@' . systmHstname . ">" . repeat(" ", spaces_after_content_for_top4) . "+#+  +:+       +#+        */",
		\ "/*                                                +#+#+#+#+#+   +#+           */",
		\ "/*   Created: " . currentTime . " by " . userName . repeat(" ", spaces_after_content_for_top6) . "#+#    #+#             */",
		\ "/*   Updated: " . currentTime . " by " . userName . repeat(" ", spaces_after_content_for_top7) . "###   ########.fr       */",
		\ "/*                                                                            */",
		\ "/* ************************************************************************** */",
		\ ""
	\ ]

		call append(0, createHeader)

	else

		let existingCreateTime = getline(is_there_Header + 8)

		let i = 1
		
		while i <= 12
			
			call deletebufline('%', is_there_Header + 1)
			let i = i + 1

		endwhile


			let newHeader = [
		\ "/* ************************************************************************** */",
		\ "/*                                                                            */",
		\ "/*                                                        :::      ::::::::   */",
		\ "/*   " . fileName . repeat(" ", spaces_after_content_for_top2) . ":+:      :+:    :+:   */",
		\ "/*                                                    +:+ +:+         +:+     */",
		\ "/*   By: " . userName . " <" . userName . '@' . systmHstname . ">" . repeat(" ", spaces_after_content_for_top4) . "+#+  +:+       +#+        */",
		\ "/*                                                +#+#+#+#+#+   +#+           */",
		\ existingCreateTime,
		\ "/*   Updated: " . currentTime . " by " . userName . repeat(" ", spaces_after_content_for_top7) . "###   ########.fr       */",
		\ "/*                                                                            */",
		\ "/* ************************************************************************** */",
		\ ""
	\ ]

		call append(0, newHeader)

	endif

endfunction

nnoremap <C-H> :call Header_42()<CR>
